package com.kh.gw.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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

import com.kh.gw.board.model.service.AllBoardService;
import com.kh.gw.board.model.service.NoticeService;
import com.kh.gw.board.model.service.SurveyService;
import com.kh.gw.board.model.vo.AllBoard;
import com.kh.gw.board.model.vo.AllBoardReply;
import com.kh.gw.board.model.vo.Attachment;
import com.kh.gw.board.model.vo.Notice;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.Pagination;
import com.kh.gw.board.model.vo.Survey;
import com.kh.gw.board.model.vo.SurveyAnswer;
import com.kh.gw.board.model.vo.SurveyQuestion;
import com.kh.gw.common.CommonsUtils;

@Controller
public class boardController {
	
	@Autowired
	NoticeService ns;
	
		//대시보드에서 결재대기문서 5개 조회하는 메소드
		@RequestMapping(value="/selectListNoticeMain.bo")
		public void selectListNoticeMain(HttpServletResponse response) {
			
			List<Notice> mainList=null;

			try {
				mainList = ns.selectListNoticeMain();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			ObjectMapper mapper = new ObjectMapper();
			
			try {
				//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().print(mapper.writeValueAsString(mainList));
					
			} catch (JsonGenerationException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
		//공지사항 목록 조회
		@RequestMapping(value="/main.bo", method=RequestMethod.GET)
		public String selectListNoticePaging(Model model, HttpServletRequest request) throws Exception {
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}		
				
		int listCount = ns.getListCount();
			
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);	

		pi.setLimit(7);
		
		List<Notice> list = ns.selectListNoticePaging(pi);
		
		List<Notice> listPin = ns.selectListNoticePagingPin();
		
		//System.out.println("상단 고정 리스트 : " + listPin);
		model.addAttribute("list", list);
		model.addAttribute("listPin", listPin);
		model.addAttribute("pi", pi);
			
		return "board/notice/noticeList";
		}
	
		//공지사항 작성뷰
		@RequestMapping(value="/noticeInsertForm.bo", method=RequestMethod.GET)
		public String noticeInsertForm() throws Exception {
			
		return "board/notice/noticeInsertForm";
		}
				
		//공지사항 작성 완료
		@RequestMapping(value="/noticeInsertForm.bo", method=RequestMethod.POST)
		public String noticeInsertPost(Model model, Notice notice, HttpServletRequest request) throws Exception {
			
			ns.insertNotice(notice);
			
			return "redirect:/main.bo";
		}
		
		//공지사항 조회
		@RequestMapping(value="/noticeDetail.bo", method=RequestMethod.GET)
		public String noticeSelectOne(@RequestParam String nBoardNo, Notice notice, Model model) throws Exception {
		
		model.addAttribute("list", ns.selectOne(notice.getnBoardNo()));

		return "board/notice/noticeDetail";
		}
		
		//공지사항 수정뷰
		@RequestMapping(value="/updateView.bo", method=RequestMethod.GET)
		public String noticeUpdateForm(@RequestParam String nBoardNo, Notice notice, Model model) throws Exception {
		//System.out.println("수정 : " + nBoardNo);
		model.addAttribute("noticeUpdate", ns.selectOne(notice.getnBoardNo()));
			
		return "board/notice/noticeUpdateForm";
		}
		
		//공지사항 수정
		@RequestMapping(value="/updateView.bo", method=RequestMethod.POST)
		public String noticeUpdate(Notice notice) throws Exception{
			System.out.println("수정완료 : " + notice);
		ns.updateNotice(notice);
			
		return "redirect:/noticeDetail.bo?nBoardNo=" + notice.getnBoardNo();
		}
		
		//공지사항 삭제
		@RequestMapping(value="/deleteNotice.bo", method= {RequestMethod.POST, RequestMethod.GET})
		public String noticeDelete(Notice notice) throws Exception{
			System.out.println("삭제완료 : " + notice);
		ns.deleteNotice(notice);
					
		return "redirect:/main.bo?nBoardNo=" + notice.getnBoardNo();
		}
	
//-----------------------------------------------------------	

		@Autowired
		AllBoardService as;
		
		//대시보드에서 전사게시판 갯수 조회하는 메소드
		@RequestMapping(value="/getAllBoardListCount.bo")
		public void getAllBoardListCount(HttpServletResponse response) throws Exception {
				
			//int count = ns.getAppWaitListCount(nBoardNo);
//			int listCount = as.getAllBoardListCount(aBoardNo);
//			System.out.println("listCount@@@ : " + listCount);
			
			int listCount = as.getAllBoardListCount();
			
			ObjectMapper mapper = new ObjectMapper();
					
			try {
				//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().print(mapper.writeValueAsString(listCount));
							
			} catch (JsonGenerationException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
					
				}
		
			//전사게시판 작성뷰
			@RequestMapping(value="/insertAllBoardForm.bo", method=RequestMethod.GET)
			public String insertAllBoardForm() throws Exception {
				
			return "board/allBoard/allBoardInsertForm";
			}
					
			//전사게시판 작성 완료
			@RequestMapping(value="/insertAllBoardForm.bo", method=RequestMethod.POST)
			public String insertAllBoard(HttpServletRequest request,AllBoard allBoard, @RequestParam(required=false) MultipartFile file) throws Exception {

				int result = 0;
				
				if(file.getOriginalFilename() == "") {
					//System.out.println(f);
					//System.out.println("파일없음");
					result = as.insertAllBoardForm(allBoard);
					
				}else {
				
				String root = request.getSession().getServletContext().getRealPath("resources");
						
				System.out.println("root : " + root);
				
				//파일이 저장될 경로를 지정한다.
				String filePath = root + "\\uploadFiles\\board";
				System.out.println("filePath : " + filePath);
				//for(int i=0; i < file.length; i++) {
				//	if(!file[i].getOriginalFilename().equals("")) {
						//Attachment attachment2 = new Attachment();
						//파일명 변경
						
						//파일 이름의 원본 이름을 가져오는 메소드
						String originName = file.getOriginalFilename();
						
						String ext = originName.substring(originName.lastIndexOf("."));
						
						String changeName = CommonsUtils.getRandomString();
						
						Attachment attachment = new Attachment();
						attachment.setOriginName(file.getOriginalFilename());
						attachment.setChangeName(changeName + ext);
						attachment.setFilePath(filePath + "\\" + changeName + ext);
						System.out.println("================== file start ======================");
						System.out.println("파일 실제 이름 : " + file.getOriginalFilename());
						System.out.println("파일 change 이름 : " + (changeName + ext));
						System.out.println("파일 경로 : " +( filePath + "\\" + changeName + ext) );
						System.out.println("파일 크기 : " + file.getSize());
						System.out.println(attachment);
						System.out.println("=================== file END =======================");
							
						try {
							file.transferTo(new File(attachment.getFilePath()));
							
							//attachment.add(attachment);
							//ns.insertNotice(allBoard);
							int result1 = as.insertAllBoardForm(allBoard,attachment);
						
						} catch (Exception e) {
							
							new File(filePath + "\\" + changeName + ext).delete();
						}
						
				}
						return "redirect:/selectListAllBoard.bo";
						
			}
					
				//	return "redirect:/main.bo";
						
//					}
//				}
			
			//댓글 생성
			@RequestMapping(value="/insertAllboardReply.bo")
			public void insertReply( @RequestParam String aBoardNo, @RequestParam String rWriter, @RequestParam String rContent, AllBoard allBoard, AllBoardReply aReply, HttpServletResponse response) throws Exception {
				System.out.println("aBoardNo : " + aBoardNo);
				System.out.println("rWriter : " + rWriter);
				System.out.println("rContent : " + rContent);
				
				aReply.setaBoardNo(aBoardNo);
				aReply.setrContent(rContent);
				aReply.setrWriter(rWriter);
				
				int result = as.insertReply(aReply);
				System.out.println("댓글 생성 : " + result);
				
				ObjectMapper mapper = new ObjectMapper();

				try { 
					response.setCharacterEncoding("UTF-8");
					response.setContentType("applicaiton/json");
					response.getWriter().print(mapper.writeValueAsString(result)); 
				
				} catch (JsonGenerationException e) { 
					e.printStackTrace(); 
				} catch(JsonMappingException e) { 
					e.printStackTrace(); 
				} catch (IOException e) {
					e.printStackTrace(); 
				}
				
			}
			
			//전사게시판 목록 조회
			@RequestMapping(value="/selectListAllBoard.bo", method=RequestMethod.GET)
			public String selectListAllBoardPaging(Model model, HttpServletRequest request) throws Exception {
			
			int currentPage = 1;

			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}		
				
			int listCount = as.getListCount();
			//System.out.println("올보드 리스트 갯수 : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<AllBoard> list2 = as.selectListAllBoardPaging(pi);
			
			model.addAttribute("list2", list2);
			model.addAttribute("pi", pi);
			
			return "board/allBoard/allBoardList";

			}
		
			//전사게시판 조회 / 댓글
			@RequestMapping(value="/selectOneAllBoard.bo", method=RequestMethod.GET)
			public String SelectOneAllBoard(AllBoard allBoard, AllBoardReply aReply, Model model) throws Exception {
				
				List<AllBoardReply> allBoardReplyList = as.readReply(aReply);
				model.addAttribute("allBoardReplyList", allBoardReplyList);
			
				Map<String,Object> map = as.SelectOneAllBoard(allBoard.getaBoardNo());
				//model.addAttribute("list2", as.SelectOneAllBoard(allBoard.getaBoardNo()));
				model.addAttribute("list2", map.get("list2"));
				model.addAttribute("file", map.get("file"));
				
			//전사게시판 댓글 조회
			//List<AllBoardReply> allBoardReplyList = rs.readReply(allBoard);
			//model.addAttribute("allBoardReplyList", allBoardReplyList);
			//model.addAttribute("AllBoardReply", new AllBoardReply());
			//System.out.println(allBoardReplyList);
			//rs.readReply(aBoardNo);

			
			return "board/allBoard/allBoardDetail";
			}
			
			@RequestMapping(value="/download.bo")
			public void Download(@RequestParam String attachmentNo,HttpServletResponse response) {

				Attachment attach = as.selectOneAttachmentBoard(attachmentNo);

			      try {
			         BufferedInputStream buf = null;
			         ServletOutputStream downOut = response.getOutputStream();

			         File downFile = new File(attach.getFilePath());

			         response.setContentType("text/plain; charset=UTF-8");
			         response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(attach.getOriginName().getBytes("UTF-8"),"ISO-8859-1") + "\"");
			         response.setContentLength((int) downFile.length());

			         FileInputStream fin = new FileInputStream(downFile);
			         buf = new BufferedInputStream(fin);

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
			
			//전사게시판 댓글조회
			@RequestMapping(value="/selectOneAllBoardReply.bo")
			public String SelectOneAllBoardReply(AllBoard allBoard, AllBoardReply aReply, Model model, HttpServletRequest request) throws Exception {
				List<AllBoardReply> allBoardReplyList = as.readReply(aReply);
				model.addAttribute("allBoardReplyList", allBoardReplyList);
				model.addAttribute("list2", as.SelectOneAllBoard(allBoard.getaBoardNo()));
				System.out.println("댓글작성으로 보낸 본문 내용 : " + allBoard);
				
				return "board/allBoard/allBoardDetail";
			}
			
			//전사게시판 수정뷰
			@RequestMapping(value="/allBoardUpdateView.bo", method=RequestMethod.GET)
			public String updateAllBoardForm(@RequestParam String aBoardNo, AllBoard allBoard, Model model) throws Exception {
			//System.out.println("전사 게시판 수정 : " + aBoardNo);
			model.addAttribute("updateAllBoard", as.SelectOneAllBoard(allBoard.getaBoardNo()));
			//System.out.println("전사 게시판 수정 값 : " + as.SelectOneAllBoard(allBoard.getaBoardNo()));
			return "board/allBoard/allBoardUpdateForm";
			}
			
			//전사게시판 수정
			@RequestMapping(value="/allBoardUpdateView.bo", method=RequestMethod.POST)
			public String updateAllBoard(AllBoard allBoard) throws Exception{
			as.updateAllBoardForm(allBoard);
			//System.out.println("전사 게시판 수정완료 : " + allBoard);
				
			return "redirect:/selectOneAllBoard.bo?aBoardNo=" + allBoard.getaBoardNo();
			}
			
			//전사게시판 삭제
			@RequestMapping(value="/deleteAllBoard.bo", method= {RequestMethod.POST, RequestMethod.GET})
			public String deleteAllBoard(AllBoard allBoard) throws Exception{
			//System.out.println("삭제완료 : " + allBoard);
			as.deleteAllBoard(allBoard);
						
			return "redirect:/selectListAllBoard.bo?selectListAllBoard=" + allBoard.getaBoardNo();
			}
	
//-----------------------------------------------------------
	
			@Autowired
			SurveyService ss;
			
			
			//설문 surveyInserForm
			@RequestMapping(value="/surveyInsertForm.bo", method=RequestMethod.GET)
			public String surveyInserForm(String surveyNo, Survey survey, Model model) throws Exception {
				
				//model.addAttribute("list3", ss.SelectOneSurvey(survey.getSurveyNo()));
				
			return "board/survey/surveyInsertForm";
			}
					
			//설문 작성 완료
			@RequestMapping(value="/surveyInsertForm.bo", method=RequestMethod.POST)
			public String insertSurvey(Survey survey, SurveyQuestion sq) throws Exception {
				//System.out.println("설문 작성 내용 : " + survey);
				//System.out.println("insert sq : " + sq);
				
				
				String[] surveyQuestionContent = sq.getSurveyQuestionContent().split(",");
				System.out.println("surveyQuestionContent : " + surveyQuestionContent);
				
				int result = ss.insertSurvey(survey);
				System.out.println("result : " + result);

	
				SurveyQuestion sQuestionContent = new SurveyQuestion();
				//List<SurveyQuestion> list4 = new ArrayList<SurveyQuestion>();
				
				if(result > 0) {
					for(int i = 0; i < surveyQuestionContent.length; i++) {
						sQuestionContent.setSurveyQuestionContent(surveyQuestionContent[i]);
						//list4.add(sQuestionContent);
						//System.out.println("surveyQuestionContent[i] : " + surveyQuestionContent[i]);
						int result2 = ss.insertSurveyQuestion(sQuestionContent);
						//System.out.println("result2 : " + result2);
					}
					//System.out.println("list4 : " + list4);
					
				}

				return "redirect:/survey.bo";
			}
			
			//설문 결과 작성
			@RequestMapping(value="/surveyDetail1.bo")
			public void insertSurveyAnswer(Survey survey, SurveyQuestion sq, SurveyAnswer sa, HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
				
				String surveyNo = request.getParameter("surveyNo");
				String surveyQuestionNo = request.getParameter("surveyQuestionNo");
				String empNo = request.getParameter("aWriter");
				//String surveyQuestionContent = request.getParameter("surveyQuestionContent");
				System.out.println("@@@surveyNo : " + surveyNo);
				System.out.println("@@@surveyQuestionNo : " + surveyQuestionNo);
				System.out.println("@@@empNo : " + empNo);
				
				sa.setSurveyNo(surveyNo);
				sa.setSurveyQuestionNo(surveyQuestionNo);
				sa.setsEmpNo(empNo);
				//sa.setSurveyQuestionContent(surveyQuestionContent);
				System.out.println("@@@@@ sa : " + sa);
				int result = ss.insertSurveyAnswer(sa);
				System.out.println(result);
				
				if(result > 0) {
//					
//					
//					Survey survey2 = ss.SelectOneSurvey(survey);
//					
//					model.addAttribute("list3", survey2);
//					System.out.println("list3 결과 화면으로 : " + survey2);
//					sq.setSurveyNo(surveyNo);
//					
					List<SurveyAnswer> list5 = ss.SelectOneSurveyAnswer(sa);
//				    System.out.println("설문 결과 list5 : " + list5);
//				    
				    model.addAttribute("list5", list5);

				    ObjectMapper mapper = new ObjectMapper();
				    
				    response.setCharacterEncoding("UTF-8");
				    response.setContentType("applicaiton/json");
				    response.getWriter().print(mapper.writeValueAsString(list5));
				    
				    
				}
			//return "redirect:/surveyDetail2.bo";
			//return "board/survey/surveyDetail1";
			}
			
			//대시보드에서 결재대기문서 5개 조회하는 메소드
			@RequestMapping(value="/selectListSurveyMain.bo")
			public void selectListSurveyMain(HttpServletResponse response) {
				
				List<Survey> selectListSurveyMain=null;
				try {
					selectListSurveyMain = ss.selectListSurveyMain();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				ObjectMapper mapper = new ObjectMapper();
				
				try {
					//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
					response.setCharacterEncoding("UTF-8");
					response.setContentType("application/json");
					response.getWriter().print(mapper.writeValueAsString(selectListSurveyMain));
						
				} catch (JsonGenerationException e) {
					e.printStackTrace();
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			//설문 목록 조회
			@RequestMapping(value="/survey.bo", method=RequestMethod.GET)
			public String selectListSurveyPaging(Model model, HttpServletRequest request) throws Exception {
			
			int currentPage = 1;

			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}		
				
			int listCount = ss.getListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Survey> list3 = ss.selectListSurveyPaging(pi);
			
			model.addAttribute("list3", list3);
			model.addAttribute("pi", pi);
			
			return "board/survey/surveyList";

			}			
		
			//설문 조회
			@RequestMapping(value="/surveyDetail1.bo", method=RequestMethod.GET)
			public String SelectOneSurvey(String surveyNo, Survey survey, SurveyQuestion sq, SurveyAnswer sa, Model model) throws Exception {
				
			model.addAttribute("list3", ss.SelectOneSurvey(survey));
			sq.setSurveyNo(surveyNo);
			
		    List<SurveyQuestion> list4 = ss.SelectOneSurveyQuestion(sq);
		    System.out.println("list4 : " + list4);
		    model.addAttribute("list4", list4);
		    	
		    	return "board/survey/surveyDetail1";
			}
			
			//설문 마감처리
			@RequestMapping(value="/deadLine.bo")
			public String DeadLine(Survey survey) throws Exception{
				System.out.println("설문 마감처리 : " + survey);
			
				ss.deadLine(survey);
				
			return "redirect:/survey.bo?surveyNo=" + survey.getSurveyNo();
			}
			
			//설문 결과 조회
//			@RequestMapping(value="/surveyDetail2.bo")
//			public String SelectOneSurveyAnswer(HttpServletRequest request, String surveyNo, Survey survey, SurveyQuestion sq, SurveyAnswer sa, Model model, String surveyQuestionNo) throws Exception {
//			    
//			return "board/survey/surveyDetail2";
//			}
		
			
			
			
			
//			//대시보드에서 결재대기문서 갯수 조회하는 메소드
//			@RequestMapping(value="/getAppWaitListCount.ap")
//			public void getAppWaitListCount(@RequestParam String empNo, HttpServletResponse response) {
//			
//				int count = as.getAppWaitListCount(empNo);
//				
//				ObjectMapper mapper = new ObjectMapper();
//				
//				try {
//					//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
//					response.setCharacterEncoding("UTF-8");
//					response.setContentType("application/json");
//					response.getWriter().print(mapper.writeValueAsString(count));
//						
//				} catch (JsonGenerationException e) {
//					e.printStackTrace();
//				} catch (JsonMappingException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//				
//			}
			
			
			
			
			
}
