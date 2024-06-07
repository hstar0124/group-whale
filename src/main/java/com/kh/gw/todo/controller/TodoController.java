package com.kh.gw.todo.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.gw.todo.model.service.TodoService;
import com.kh.gw.common.CommonsUtils;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.settings.model.vo.Department;
import com.kh.gw.settings.model.vo.MemberDto;
import com.kh.gw.todo.model.vo.Attachment;
import com.kh.gw.todo.model.vo.Card;
import com.kh.gw.todo.model.vo.Checklist;
import com.kh.gw.todo.model.vo.Folder;
import com.kh.gw.todo.model.vo.Label;
import com.kh.gw.todo.model.vo.Member;
import com.kh.gw.todo.model.vo.Reply;
import com.kh.gw.todo.model.vo.TodoList;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService service;
	
	@RequestMapping(value="/main.td")
	public String moveTodoMain() {
		return "todo/todoMain";
	}
	
	@RequestMapping(value="/list.td")
	public String moveTodoList() {
		return "todo/todoList";
	}
	
	//폴더명 중복체크
	/*
	 * @RequestMapping("/folderNameCheck.td") public void
	 * folderNameCheck(@RequestParam String folderName, HttpServletResponse response
	 * ) {
	 * 
	 * Folder folder = new Folder(); folder.setFolderName(folderName);
	 * 
	 * int result = service.folderNameCheck(folder);
	 * 
	 * System.out.println("중복체크 컨트롤러 result : " + result);
	 * System.out.println("중복체크 컨트롤러 folder : " + folder);
	 * 
	 * try { response.getWriter().print(result); } catch (IOException e) {
	 * e.printStackTrace(); } }
	 */
	
	//폴더 리스트 조회 (left메뉴/todo홈) => todoMain ajax
	@RequestMapping("/selectFolderList.td")
	public void selectMemberList(HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
			
		Folder f = new Folder();
		f.setEmpNo(empNo);
		
		List<Folder> folderList = service.selectFolderList(f);
		
		//System.out.println("folderList 조회 : " + folderList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(folderList));
		
		} catch (IOException e) {			
			e.printStackTrace();
		}	
	}
	
	//폴더 추가 => Modal form
	@RequestMapping("/insertFolder.td")
	public String insertFolder(HttpServletRequest request, Folder f) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		f.setEmpNo(empNo);
		
		//TODO_FOLDER 테이블에 insert
		int result = service.insertFolder(f);
		
		String folderNo = f.getFolderNo();
		f.setFolderNo(folderNo);
		
		//TODO_MEMEBR 테이블에 insert
		int result2 = service.insertMember(f);
		
		//System.out.println("폴더 추가 컨트롤러 result : " + result);

		return "redirect:/main.td";
	}
	
	//폴더명 수정 => todoList ajax
	@RequestMapping("/updateFolderName.td")
	public void updateFolderName(@RequestParam String folderNo, @RequestParam String folderName, HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		Folder f = new Folder();
		f.setEmpNo(empNo);
		f.setFolderNo(folderNo);
		f.setFolderName(folderName);
		
		//System.out.println("f : " + f);
		
		int result = service.updateFolderName(f);
		
		if(result > 0) {
			ObjectMapper mapper = new ObjectMapper();
			
			try {			
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				//jsp에 변경된 folderName을 넘겨줌
				response.getWriter().print(mapper.writeValueAsString(folderName));
			
			} catch (IOException e) {			
				e.printStackTrace();
			}	
		}
	}
	
	//폴더 삭제 => todoMain location.href
	@RequestMapping("/deleteFolder.td")
	public String deleteFolder(@RequestParam String fNo, HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		fNo = fNo.replaceAll(" ", "");
		
		Folder f = new Folder();
		f.setEmpNo(empNo);
		f.setFolderNo(fNo);
		
		//TODO_FOLDER에서 삭제
		int result = service.deleteFolder(f);
		
		//TODO_MEMBER에서 삭제
		int result2 = service.deleteMember(f);
		
		//System.out.println("result : " + result);
		//System.out.println("result2 : " + result2);
			
		return "redirect:/main.td";
	}
	
	//리스트, 카드 정보 조회 => todoMain location.href
	@RequestMapping("/selectListInfo.td")
	public String selectListInfo(@RequestParam String fNo, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		fNo = fNo.replaceAll(" ", "");
		
		Folder f = new Folder();
		f.setEmpNo(empNo);
		f.setFolderNo(fNo);
		
		List<Folder> folderInfo = service.selectFolderInfo(f);
		List<TodoList> listInfo = service.selectListInfo(f);
		List<Card> cardInfo = service.selectCardInfo(f);
		List<Label> labelInfo = service.selectLabelInfo(f);	
		List<Member> memberInfo = service.selectMemberInfo(f);
		
		System.out.println("controller folderInfo : " + folderInfo);
		System.out.println("controller listInfo : " + listInfo);
		System.out.println("controller cardInfo : " + cardInfo);
		System.out.println("controller labelInfo : " + labelInfo);
		System.out.println("controller MemberInfo : " + memberInfo);

		model.addAttribute("folderInfo", folderInfo);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("cardInfo", cardInfo);
		model.addAttribute("labelInfo", labelInfo);
		model.addAttribute("memberInfo", memberInfo);
			
		return "todo/todoList";
	}
	
	//리스트 추가 & listNo 가져오기 => todoList ajax
	@RequestMapping("/insertList.td")
	public void insertList(@RequestParam String folderNo, @RequestParam String listTitle, HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();

		folderNo = folderNo.replaceAll(" ", "");
		
		//System.out.println("controller로 넘어온 folderNo : " + folderNo);
		//System.out.println("controller로 넘어온 listTitle : " + listTitle);
		
		TodoList li = new TodoList(); 
		li.setListCreateEmpNo(empNo);
		li.setFolderNo(folderNo);
		li.setListTitle(listTitle);
		
		//DB insert
		int result = service.insertList(li);
		
		//insert한 listNo 가져오기
		String listNo = li.getListNo();		
		
		Folder f = new Folder();
		f.setFolderNo(folderNo);
		
		//리스트 목록 불러오기
		List<TodoList> list = service.selectListInfo(f);

		//카드 목록 불러오기
		List<Card> card = service.selectCardInfo(f);
		
		//라벨 정보 불러오기
		List<Label> label = service.selectLabelInfo(f);	
		
		//참여자 정보 볼러오기
		List<Member> member = service.selectMemberInfo(f);
		
		HashMap<String, Object> listInfo = new HashMap<String, Object>();
		
		listInfo.put("list", list);
		listInfo.put("card", card);
		listInfo.put("label", label);
		listInfo.put("member", member);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(listInfo));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	} 
	
	//카드 상세보기 Modal 닫기 아이콘 클릭 시 리스트/카드/라벨 정보 불러오기
	@RequestMapping("/selectListCardInfo.td")
	public void selectListCardInfo(@RequestParam String folderNo, HttpServletRequest request, HttpServletResponse response) {
		
		folderNo = folderNo.replaceAll(" ", "");
		
		Folder f = new Folder();
		f.setFolderNo(folderNo);
		
		//리스트 목록 불러오기
		List<TodoList> list = service.selectListInfo(f);

		//카드 목록 불러오기
		List<Card> card = service.selectCardInfo(f);
		
		//라벨 정보 불러오기
		List<Label> label = service.selectLabelInfo(f);	
		
		//참여자 정보 볼러오기
		List<Member> member = service.selectMemberInfo(f);
		
		HashMap<String, Object> listInfo = new HashMap<String, Object>();
		
		listInfo.put("list", list);
		listInfo.put("card", card);
		listInfo.put("label", label);
		listInfo.put("member", member);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(listInfo));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//카드 추가 & cardNo 가져오기 => todoList ajax
	@RequestMapping("/insertCard.td")
	public void insertCard(@RequestParam String listNo, @RequestParam String cardTitle, HttpServletRequest request, HttpServletResponse response) {

		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();

		listNo = listNo.replaceAll(" ", "");
		
		//System.out.println("controller로 넘어온 listNo : " + listNo);
		//System.out.println("controller로 넘어온 cardTitle : " + cardTitle);
		
		Card c = new Card();
		c.setCardCreateEmpNo(empNo);
		c.setListNo(listNo);
		c.setCardTitle(cardTitle);

		//DB insert
		int result = service.insertCard(c);
		
		//카드 목록 불러오기
		List<Card> cardList = service.selectCardList(c);
		
		//라벨 정보 가져오기
		List<Label> labelList = service.selectLabelList(c);
		
		//System.out.println("==================labelList============== : " + labelList);

		HashMap<String, Object> card = new HashMap<String, Object>();
		
		card.put("cardList", cardList);
		card.put("labelList", labelList);
		
		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(card));

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//cardNo 가져오기		
//		String cardNo = c.getCardNo();
//		
//		ObjectMapper mapper = new ObjectMapper();
//		
//		try {
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("application/json");
//			response.getWriter().print(mapper.writeValueAsString(cardNo));
//			
//		} catch (JsonGenerationException e) {
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	}
	
	//리스트 이름 수정
	@RequestMapping("/updateListName.td")
	public void updateListName(@RequestParam String listNo, @RequestParam String listName, HttpServletRequest request, HttpServletResponse response) {
		
		listNo = listNo.replaceAll(" ", "");
		
		TodoList li = new TodoList();
		li.setListNo(listNo);
		li.setListTitle(listName);
		
		int result = service.updateListName(li);
	}
	
	//카드 이름 수정
	@RequestMapping("/updateCardName.td")
	public void updateCardName(@RequestParam String cardNo, @RequestParam String cardName, HttpServletRequest request, HttpServletResponse response) {
		
		cardNo = cardNo.replaceAll(" ", "");
		
		Card c = new Card();
		c.setCardNo(cardNo);
		c.setCardTitle(cardName);
		
		int result = service.updateCardName(c);
	}
	
	//리스트 삭제 => todoList ajax
	@RequestMapping("/deleteList.td")
	public void deleteList(@RequestParam String listNo, HttpServletRequest request, HttpServletResponse response) {
		
		TodoList li = new TodoList();
		li.setListNo(listNo);
		
		int result = service.deleteList(li);
	}
	
	//카드 삭제 => todoCardDetail ajax
		@RequestMapping("/deleteCard.td")
		public void deleteCard(@RequestParam String cardNo, HttpServletRequest request, HttpServletResponse response) {
			
		Card c = new Card();
		c.setCardNo(cardNo);
		
		int result = service.deleteCard(c);	
	}
	
	//카드 상세보기 => todoList ajax
	@RequestMapping("/selectCardDetail.td")
	public void selectCardDetail(@RequestParam String cardNo, HttpServletRequest request, HttpServletResponse response) {
		
		cardNo = cardNo.replaceAll(" ", "");
		
		//System.out.println("controller로 넘어온 cardNo : " + cardNo);
		
		Card c = new Card();
		c.setCardNo(cardNo);
		
		List<Card> detailCard = service.selectDetailCardInfo(c);
		List<Checklist> detailChecklist = service.selectDetailCheckInfo(c);
		List<Label> detailLabel = service.selectDetailLabelInfo(c);
		List<Reply> detailReply = service.selectDetailReplyInfo(c);
		List<Attachment> detailAttachment = service.selectDetailAttachInfo(c);
		
		HashMap<String, Object> cardDetail = new HashMap<String, Object>();
		
		cardDetail.put("Card", detailCard);
		cardDetail.put("Checklist", detailChecklist);
		cardDetail.put("Label", detailLabel);
		cardDetail.put("Reply", detailReply);
		cardDetail.put("Attachment", detailAttachment);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(cardDetail));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//참여자 목록 불러오기 => todoMain ajax
	@RequestMapping("/selectParticipantList.td")
	public void selectParticipantList(@RequestParam String folderNo, HttpServletRequest request, HttpServletResponse response) {
		
		folderNo = folderNo.replaceAll(" ", "");
		
		Folder f = new Folder();
		f.setFolderNo(folderNo);
		
		List<Member> member = service.selectParticipantList(f);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(member));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//참여자 추가 조직도 조회
	@RequestMapping("/selectMemberList.td")
	public void empNoCheck(@RequestParam List<String> etcEmpNolist, HttpServletRequest request, HttpServletResponse response){	
		
		//System.out.println("컨트롤러에서 받은 etcEmpNolist : " + etcEmpNolist);
		
		String etcEmpNo = null;
		
		for(int i = 0; i < etcEmpNolist.size(); i++) {
			etcEmpNo = etcEmpNolist.get(i);		
		}
		
		List<MemberDto> memberList = service.selectMemberList();
		List<MemberDto> resultList = new ArrayList<MemberDto>();	
		
		a:for(int i = 0; i < memberList.size(); i++) {
			
			for(int j = 0; j < etcEmpNolist.size(); j++) {
				if(memberList.get(i).getEmpNo().equals(etcEmpNolist.get(j))) {
					continue a;
				}
			}
			
			//참여자를 제외시킨 사원을 list에 담아줌
			resultList.add(memberList.get(i));
		}  
		
		/*
		 * for(int i = 0; i < resultList.size(); i++) {
		 * System.out.println(resultList.get(i).getEmpNo()); }
		 */
		
		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(resultList));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 
	
	//폴더 참여자 추가
	@RequestMapping("/insertParticipant.td")
	public void insertParticipant(@RequestParam String folderNo, @RequestParam List<String> empList, HttpServletRequest request, HttpServletResponse response) {
		
		//System.out.println("컨트롤러에서 받은 폴더번호 : " + folderNo);
		//System.out.println("컨트롤러에서 받은 empList : " + empList);
		
		folderNo = folderNo.replaceAll(" ", "");
		
		String empNo = null;
		
		for(int i = 0; i < empList.size(); i++) {
			empNo = empList.get(i);
			//System.out.println("empNo : " + empNo);
			
			Member m = new Member();
			m.setMemberEmpNo(empNo);
			m.setFolderNo(folderNo);
			
			//TODO_MEMBER 테이블에 insert
			int result = service.insertParticipant(m);
			
			//System.out.println("result : " + result);
		}
		
		Folder f = new Folder();
		f.setFolderNo(folderNo);
		
		//참여자 목록 불러오기
		List<Member> member = service.selectParticipantList(f);
		
		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(member));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//참여자 삭제
	@RequestMapping("/deleteParticipant.td")
	public void deleteParticipant(@RequestParam String folderNo, @RequestParam String empNo, HttpServletRequest request, HttpServletResponse response) {

		folderNo = folderNo.replaceAll(" ", "");
		empNo = empNo.replaceAll(" ", "");

		Member m = new Member();
		m.setMemberEmpNo(empNo);
		m.setFolderNo(folderNo);

		//TODO_MEMBER 테이블에서 delete
		int result = service.deleteParticipant(m);

		Folder f = new Folder();
		f.setFolderNo(folderNo);
		
		//참여자 목록 불러오기
		List<Member> member = service.selectParticipantList(f);
		
		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(member));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//담당자 추가
	@RequestMapping("/insertIncharge.td")
	public void insertIncharge(@RequestParam String cardNo, @RequestParam String empNo, HttpServletRequest request, HttpServletResponse response) {

		//System.out.println("컨트롤러에서 받은 카드번호 : " + cardNo);
		//System.out.println("컨트롤러에서 받은 사원번호 : " + empNo);
		
		cardNo = cardNo.replaceAll(" ", "");
		empNo = empNo.replaceAll(" ", "");

		Card c = new Card();
		c.setCardNo(cardNo);
		c.setInchargeEmpNo(empNo);

		int result = service.insertIncharge(c);
		
		//담당자 불러오기
		List<Card> incharge = service.selectIncharge(c);
		
		//System.out.println("담당자 리스트 : " + incharge);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(incharge));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//담당자 삭제
	@RequestMapping("/deleteIncharge.td")
	public void deleteIncharge(@RequestParam String cardNo, @RequestParam String empNo, HttpServletRequest request, HttpServletResponse response) {

		//System.out.println("컨트롤러에서 받은 카드번호 : " + cardNo);
		//System.out.println("컨트롤러에서 받은 사원번호 : " + empNo);

		cardNo = cardNo.replaceAll(" ", "");
		empNo = empNo.replaceAll(" ", "");

		Card c = new Card();
		c.setCardNo(cardNo);
		c.setInchargeEmpNo(empNo);

		int result = service.deleteIncharge(c);

		//담당자 불러오기
		List<Card> incharge = service.selectIncharge(c);

		//System.out.println("담당자 리스트 : " + incharge);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(incharge));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//체크리스트 추가 
	@RequestMapping("/insertChecklist.td")
	public void insertChecklist(@RequestParam String cardNo, @RequestParam String content, HttpServletRequest request, HttpServletResponse response) {

		//System.out.println("컨트롤러에서 받은 카드번호 : " + cardNo);
		//System.out.println("컨트롤러에서 받은 내용 : " + content);

		cardNo = cardNo.replaceAll(" ", "");

		Checklist cl = new Checklist();
		cl.setCardNo(cardNo);
		cl.setChecklistContent(content);
		
		int result = service.insertChecklist(cl);

		//체크리스트 불러오기
		List<Checklist> checklist = service.selectChecklist(cl);

		//System.out.println("컨트롤러 체크리스트 : " + checklist);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(checklist));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//체크리스트 체크 상태 업데이트
	@RequestMapping("/updateCheckStatus.td")
	public void updateCheckStatus(@RequestParam String checklistNo, @RequestParam String checkStatus, HttpServletRequest request, HttpServletResponse response) {

		checklistNo = checklistNo.replaceAll(" ", "");
		checkStatus = checkStatus.replaceAll(" ", "");

		Checklist cl = new Checklist();
		cl.setChecklistNo(checklistNo);
		cl.setCheckYN(checkStatus);

		int result = service.updateCheckStatus(cl);

	}
	
	//체크리스트 수정
	@RequestMapping("/updateChecklist.td")
	public void updateChecklist(@RequestParam String cardNo, @RequestParam String checklistNo, @RequestParam String content, HttpServletRequest request, HttpServletResponse response) {

		cardNo = cardNo.replaceAll(" ", "");
		checklistNo = checklistNo.replaceAll(" ", "");

		Checklist cl = new Checklist();
		cl.setCardNo(cardNo);
		cl.setChecklistNo(checklistNo);
		cl.setChecklistContent(content);

		int result = service.updateChecklist(cl);

		//체크리스트 불러오기
		List<Checklist> checklist = service.selectChecklist(cl);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(checklist));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//체크리스트 삭제
	@RequestMapping("/deleteChecklist.td")
	public void deleteChecklist(@RequestParam String cardNo, @RequestParam String checklistNo, HttpServletRequest request, HttpServletResponse response) {
		cardNo = cardNo.replaceAll(" ", "");
		checklistNo = checklistNo.replaceAll(" ", "");
		
		Checklist cl = new Checklist();
		cl.setCardNo(cardNo);
		cl.setChecklistNo(checklistNo);
		
		int result = service.deleteChecklist(cl);
		
		//체크리스트 불러오기
		List<Checklist> checklist = service.selectChecklist(cl);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(checklist));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}  
	
	//카드 번호
	String cNo = "";
	
	//파일 업로드 전 카드 번호 가져오기
	@RequestMapping("/insertFileInfo.td")
	public void insertFileInfo(@RequestParam String cardNo, HttpServletRequest request, HttpServletResponse response) {
		
		Attachment at = new Attachment();
		at.setCardNo(cardNo);
	
		cNo = cardNo;
	}
	
	//파일 업로드
	@RequestMapping("/uploadFile.td")
	public void uploadFile(@RequestParam MultipartFile picture, HttpServletRequest request, HttpServletResponse response) {
		
		//System.out.println("카드 번호 : " + cNo);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		//파일 저장경로
		String filePath = root + "\\uploadFiles\\todo";
		//System.out.println("filePath : " + filePath);
		
		//파일명 변경
		String originFileName = picture.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonsUtils.getRandomString();		
		
		//System.out.println("originFileName : " + originFileName);
		//System.out.println("changeName : " + changeName);
		
		Attachment file = new Attachment();
		file.setOriginName(originFileName);
		file.setChangeName(changeName + ext);
		file.setFilePath(filePath);
		file.setFileSize(Long.toString(picture.getSize()));
		file.setCardNo(cNo);
		
		int result = 0;
		try {
			picture.transferTo(new File(filePath + "\\" + changeName + ext));
			
			result = service.uploadFile(file);
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		//파일 불러오기
		List<Attachment> attach = service.selectFileList(file);

		//System.out.println("컨트롤러 attachList : " + attach);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(attach));

		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//파일 다운로드 
	@RequestMapping("/downloadFile.td")
	public void downloadFile(@RequestParam String attachNo, HttpServletRequest request, HttpServletResponse response) {
		
		//System.out.println("컨트롤러에서 받은 파일번호 : " + attachNo);
		
		Attachment at = service.downloadFile(attachNo);
		
		try {
			//파일을 읽을 스트림 생성
			BufferedInputStream buf = null;
			
			//클라이언트에게 내보낼 출력 스트림 생성
			ServletOutputStream downOut = response.getOutputStream();
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String filePath = root + "\\uploadFiles\\todo\\" + at.getChangeName();
			
			//스트림으로 전송할 파일 객체
			File downFile = new File(filePath);
			
			System.out.println("=========downFile========= : " + downFile);
			
			//응답 헤더 설정
			response.setContentType("text/plain; charset=UTF-8");
			//파일명을 클릭했을때 다운로드 저장화면이 출력되게 처리하는 부분 (한글 인코딩)
			response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(at.getOriginName().getBytes("UTF-8"),"ISO-8859-1") + "\"");
			response.setContentLength((int) downFile.length());
			
			FileInputStream fin = new FileInputStream(downFile);
			buf = new BufferedInputStream(fin);
			System.out.println("fin : " + fin);
			System.out.println("buf : " + buf);
			int readBytes = 0;
			while((readBytes = buf.read()) != -1) {
				downOut.write(readBytes);
			}
			
			downOut.close();
			buf.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//파일 삭제
	@RequestMapping("/deleteFile.td")
	public void deleteFile(@RequestParam String attachNo, @RequestParam String cardNo, HttpServletRequest request, HttpServletResponse response) {

		attachNo = attachNo.replaceAll(" ", "");
		cardNo = cardNo.replaceAll(" ", "");
		
		//System.out.println("컨트롤러에서 받은 파일 번호 : " + attachNo);
		//System.out.println("컨트롤러에서 받은 카드 번호 : " + cardNo);

		Attachment file = new Attachment();
		file.setAttachNo(attachNo);
		file.setCardNo(cardNo);
		
		//프로젝트 내에 있는 파일을 삭제하기 위해 파일 정보를 가져옴
		Attachment at = service.downloadFile(attachNo);
		
		String filePath = at.getFilePath();
		String changeName = at.getChangeName();
		
		File deleteFile = new File(filePath + "\\" + changeName);
		
		if(deleteFile.exists() == true) {
			deleteFile.delete();
		}

		int result = service.deleteFile(file);
		
		//카드 상세보기에 나타내줄 파일 목록 불러오기
		List<Attachment> fileList = service.selectFileList(file);
	
		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(fileList));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//라벨 추가
	@RequestMapping("/insertLabel.td")
	public void insertLabel(@RequestParam String cardNo, @RequestParam String colorNo, HttpServletRequest request, HttpServletResponse response) {

		cardNo = cardNo.replaceAll(" ", "");
		colorNo = colorNo.replaceAll(" ", "");
		
		Label lb = new Label();
		lb.setCardNo(cardNo);
		lb.setColorNo(colorNo);
		
		int result = service.insertLabel(lb);

//		String colorNo = null;
//
//		for(int i = 0; i < labelList.size(); i++) {
//			colorNo = labelList.get(i);
//
//			Label lb = new Label();
//			lb.setCardNo(cardNo);
//			lb.setColorNo(colorNo);
//
//			int result = service.insertLabel(lb);
//		}
//
		Card c = new Card();
		c.setCardNo(cardNo);

		//라벨 목록 불러오기
		List<Label> labelInfo = service.selectDetailLabelInfo(c);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(labelInfo));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//라벨 삭제
	@RequestMapping("/deleteLabel.td")
	public void deleteLabel(@RequestParam String cardNo, @RequestParam String colorNo, HttpServletRequest request, HttpServletResponse response) {
		cardNo = cardNo.replaceAll(" ", "");
		colorNo = colorNo.replaceAll(" ", "");

		Label lb = new Label();
		lb.setCardNo(cardNo);
		lb.setColorNo(colorNo);
		
		int result = service.deleteLabel(lb);
		
		Card c = new Card();
		c.setCardNo(cardNo);

		//라벨 목록 불러오기
		List<Label> labelInfo = service.selectDetailLabelInfo(c);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(labelInfo));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//기한일 추가
	@RequestMapping("/insertDuedate.td")
	public void insertDuedate(@RequestParam String cardNo, @RequestParam String chooseDate, HttpServletRequest request, HttpServletResponse response) {

		//System.out.println("컨트롤러에서 받은 카드번호 : " + cardNo);
		//System.out.println("컨트롤러에서 받은 날짜 : " + chooseDate);

		cardNo = cardNo.replaceAll(" ", "");

		Card c = new Card();
		c.setCardNo(cardNo);
		c.setDueDate(chooseDate);
		
		int result = service.insertDuedate(c);

		//날짜를 1월 1일 형식으로 바꿔줌 
//		String date = chooseDate.substring(chooseDate.indexOf("/") + 1);;
//		
//		String resultDate = date.replace("/", "");
//		
//		String month = resultDate.substring(0, 2);
//		String day = resultDate.substring(2);
//		int resultMonth = Integer.parseInt(month);
//		int resultDay = Integer.parseInt(day);
//		
//		String dueDate = resultMonth + "월 " + resultDay + "일";
		
		String dueDate = chooseDate.substring(2);
		
		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(dueDate));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//기한일 삭제
	@RequestMapping("/deleteDuedate.td")
	public void deleteDuedate(@RequestParam String cardNo, HttpServletRequest request, HttpServletResponse response) {
		
		cardNo = cardNo.replaceAll(" ", "");
		
		int result = service.deleteDuedate(cardNo);
		
	}
	
	//설명 추가
	@RequestMapping("/insertDescription.td")
	public void insertDescription(@RequestParam String cardNo, @RequestParam String content, HttpServletRequest request, HttpServletResponse response) {
		
		cardNo = cardNo.replaceAll(" ", "");
		
		Card c = new Card();
		c.setCardNo(cardNo);
		c.setDescription(content);
		
		int result = service.insertDescription(c);
	}
	
	//댓글 등록
	@RequestMapping("/insertReply.td")
	public void insertReply(@RequestParam String cardNo, @RequestParam String content, @RequestParam Timestamp writeTime, HttpServletRequest request, HttpServletResponse response) {

		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		//System.out.println("writeTime : " + writeTime);
		
		cardNo = cardNo.replaceAll(" ", "");
		empNo = empNo.replaceAll(" ", "");
		
		//System.out.println("카드 번호 : " + cardNo);
		//System.out.println("댓글 내용 : " + content);

		Reply r = new Reply();
		r.setCardNo(cardNo);
		r.setReplyContent(content);
		r.setReplyCreateEmpNo(empNo);
		r.setEnrollDate(writeTime);

		int result = service.insertReply(r);
		
		//댓글 목록 불러오기
		List<Reply> replyList = service.selectReplyList(r);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(replyList));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//댓글 수정
	@RequestMapping("/updateReply.td")
	public void updateReply(@RequestParam String cardNo, @RequestParam String replyNo, @RequestParam String content, @RequestParam Timestamp modifyTime, HttpServletRequest request, HttpServletResponse response) {

		cardNo = cardNo.replaceAll(" ", "");
		replyNo = replyNo.replaceAll(" ", "");

		//System.out.println("댓글 카드 번호 : " + cardNo);
		//System.out.println("댓글 번호 : " + replyNo);
		//System.out.println("댓글 수정 내용 : " + content);

		Reply r = new Reply();
		r.setCardNo(cardNo);
		r.setReplyNo(replyNo);
		r.setReplyContent(content);
		r.setModifyDate(modifyTime);

		int result = service.updateReply(r);

		//댓글 목록 불러오기
		List<Reply> replyList = service.selectReplyList(r);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(replyList));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//댓글 삭제
	@RequestMapping("/deleteReply.td")
	public void deleteReply(@RequestParam String replyNo, @RequestParam String cardNo, HttpServletResponse response) {
		
		cardNo = cardNo.replaceAll(" ", "");
		replyNo = replyNo.replaceAll(" ", "");
		
		Reply r = new Reply();
		r.setCardNo(cardNo);
		r.setReplyNo(replyNo);
		
		int result = service.deleteReply(r);
		
		//댓글 목록 불러오기
		List<Reply> replyList = service.selectReplyList(r);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(replyList));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

} 