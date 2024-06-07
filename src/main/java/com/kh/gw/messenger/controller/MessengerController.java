package com.kh.gw.messenger.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.gw.common.CommonsUtils;
import com.kh.gw.messenger.model.service.MessengerService;
import com.kh.gw.messenger.model.vo.AttachmentMs;
import com.kh.gw.messenger.model.vo.MemberImg;
import com.kh.gw.messenger.model.vo.Message;
import com.kh.gw.messenger.model.vo.Room;
import com.kh.gw.messenger.model.vo.RoomList;
import com.kh.gw.messenger.model.vo.Thema;

@Controller
public class MessengerController {
	@Autowired // 자동으로 타입과 일치하는 bean 객체를 넣어주는 행위
	private MessengerService ms;
	
	@RequestMapping(value="/loading.ms")
	public String moveLoading() {
		return "messenger/messengerLoading";
	}

	@RequestMapping(value="/chattingList.ms")
	public String moveChattingList() {
		return "messenger/messengerChattingList";
	}

	@RequestMapping(value="/chattingDetail.ms")
	public ModelAndView moveChattingDetail(@RequestParam String roomNo, ModelAndView mv) {
		mv.setViewName("messenger/messengerChattingDetail");
		
		return mv;
	}

	@RequestMapping(value="/addMember.ms")
	public ModelAndView moveAddMember(@RequestParam String roomNo, ModelAndView mv) {
		mv.setViewName("messenger/messengerAddMember2");
		
		return mv;
	}
	
	@RequestMapping(value="/addMember2.ms")
	public String moveAddMember2() {
		return "messenger/messengerAddMember";
	}
	
	
	@RequestMapping(value="/memberList.ms")
	public String moveMemberList() {
		return "messenger/messengerMemberList2";
	}

	@RequestMapping(value="/settings.ms")
	public String moveSettingThema() {
		return "messenger/messengerSettings";
	}

	@RequestMapping(value="/test.ms")
	public String moveTestView() {
		return "messenger/testView";
	}

	
	// 메시지 저장
	@RequestMapping("/saveMessage.ms")
	public void saveMessage(@RequestParam String roomNo, @RequestParam String empNo, @RequestParam String message, 
			@RequestParam int messageType, @RequestParam Timestamp sendDate, HttpServletResponse response) {
		Message m = new Message();
		m.setRoomNo(roomNo);
		m.setEmpNo(empNo);
		m.setMessageContent(message);
		m.setMessageType(messageType);
		m.setSendDate(sendDate);
		
		System.out.println(m);

		int result = ms.insertMessage(m);

		ObjectMapper mapper = new ObjectMapper();

		try { response.getWriter().print(mapper.writeValueAsString(result)); 
		
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch(JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
		
	}

	// 채팅방 히스토리 불러오기
	@RequestMapping("/messageHistory.ms")
	public void messageHistory(@RequestParam String roomNo, HttpServletResponse response) {
		Message m = new Message();
		m.setRoomNo(roomNo);
		
		List<Message> messageHistory = ms.selectHistory(m);
		//System.out.println(messageHistory);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(messageHistory));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 채팅방 리스트 조회
	@RequestMapping("/selectRoomList.ms")
	public void selectRoomList (@RequestParam String empNo, @RequestParam String roomNo, HttpServletResponse response) {
		Room r = new Room();
		r.setEmpNo(empNo);
		r.setRoomNo(roomNo);
		//System.out.println("Room : " + r );
		
		List<Room> roomList = ms.selectRoomList(r);
		//System.out.println("RoomList : " + roomList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(roomList));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 채팅방 리스트 조회2
	@RequestMapping("/selectRoomList2.ms")
	public void selectRoomList2 (@RequestParam String empNo, HttpServletResponse response) {
		Room r = new Room();
		r.setEmpNo(empNo);
		
		List<Room> roomList = ms.selectRoomList2(r);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(roomList));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 채팅방 생성
	@RequestMapping("/insertRoom.ms")
	public String insertRoom (RoomList rl, @RequestParam String roomName, @RequestParam String addMember, 
			@RequestParam String empNo, @RequestParam Timestamp sendDate, Model model, HttpSession session) {
		String changeName = "";
		String[] addMemberList = addMember.split(",");
		
		MemberImg mi = new MemberImg();
		mi.setEmpNo(addMemberList[0]);
		
		MemberImg smi = ms.selectMemberImg(mi);
		smi.getEmpImg();
		
		
		// 문자열 끝에 2글자 자르기
		if (roomName.length() > 0) {
			changeName = roomName.substring(0, roomName.length()-2);
		}
		//System.out.println("changeName : " + changeName);
		
		Room r = new Room();
		r.setRoomName(changeName); // 채팅방이름
		r.setEmpNo(empNo);		   // 생성한 사원번호
		r.setRoomImg(smi.getEmpImg());
		
		int result = ms.insertRoom(r);
		RoomList sRoom = new RoomList();
		
		if(result > 0) {
			Message m = new Message();
			m.setEmpNo(empNo);
			m.setSendDate(sendDate);
			int result2 = ms.insertMessage2(m);
			
			if(result2 > 0) {
				int result3 = ms.insertRoomList(r);
				
				if(result3 > 0) {
					// 사번 번호 배열로 나누기
					for(int i = 0; i < addMemberList.length; i++) {
						//System.out.println("addMemberList[i] : " + addMemberList[i] );
						r.setEmpNo(addMemberList[i]);
						int result4 = ms.insertRoomList(r);

						if(result4 > 0) {
							rl.setEmpNo(empNo);
							sRoom = ms.selectRoomNo(rl);
							
							//System.out.println("sRoom : " + sRoom);
							//System.out.println("sRoom.getRoomNo() : " + sRoom.getRoomNo());
							session.setAttribute("roomNo", sRoom.getRoomNo());
						}
						
					}
				}
				
			}
			
		}
		return "messenger/messengerChattingList";
	}
	
	// 채팅방 나가기
	@RequestMapping("/exitRoom.ms")
	public String exitRoom(@RequestParam String roomNo, @RequestParam String empNo, Model model, HttpSession session) {
		RoomList rl = new RoomList();
		rl.setRoomNo(roomNo);
		rl.setEmpNo(empNo);
		int result = ms.exitRoom(rl);
		
		if(result > 0) {
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = null;
			today = formatter.format(cal.getTime());
			Timestamp sendDate = Timestamp.valueOf(today);
			
			Message m = new Message();
			m.setRoomNo(roomNo);
			m.setEmpNo(empNo);
			m.setSendDate(sendDate);
			
			int result2 = ms.exitMessage(m);
		}
			
		return "messenger/messengerChattingList";
	}
	
	// 테마설정
	@RequestMapping("/settingThema.ms")
	public void settingThema(@RequestParam String color, @RequestParam String empNo, HttpServletResponse response) {
		Thema t = new Thema();
		t.setThemaColor(color);
		t.setEmpNo(empNo);
		
		int result = ms.insertThema(t);

		ObjectMapper mapper = new ObjectMapper();

		try { 
			response.getWriter().print(mapper.writeValueAsString(t.getThemaColor())); 
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch(JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
		
	}
	
	// 저장된 테마 조회
	@RequestMapping("/selectThema.ms")
	public void selectThema(@RequestParam String empNo, HttpServletResponse response) {
		Thema t = new Thema();
		t.setEmpNo(empNo);
		
		Thema nt = ms.selectThema(t);
		if(nt != null) {
			ObjectMapper mapper = new ObjectMapper();
			
			try { response.getWriter().print(mapper.writeValueAsString(nt.getThemaColor())); 
			
			} catch (JsonGenerationException e) { 
				e.printStackTrace(); 
			} catch(JsonMappingException e) { 
				e.printStackTrace(); 
			} catch (IOException e) {
				e.printStackTrace(); 
			}
		} else {
			ObjectMapper mapper = new ObjectMapper();
			
			try { response.getWriter().print(mapper.writeValueAsString("#0871B9")); 
			
			} catch (JsonGenerationException e) { 
				e.printStackTrace(); 
			} catch(JsonMappingException e) { 
				e.printStackTrace(); 
			} catch (IOException e) {
				e.printStackTrace(); 
			}
		}
		
	}
	
	// 채팅방에 있는 멤버 조회
	@RequestMapping("/selectRoomMember.ms")
	public void selectRoomMember(@RequestParam String roomNo, @RequestParam String empNo, HttpServletResponse response) {
		//System.out.println("roomNo : " + roomNo);
		//System.out.println("empNo : " + empNo);
		
		RoomList rl = new RoomList();
		rl.setRoomNo(roomNo);
		rl.setEmpNo(empNo);
		
		List<RoomList> roomMemberList = ms.selectRoomMember(rl);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(roomMemberList)); 
		
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch(JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
	}
	
	// 이미지 저장
	@RequestMapping("/insertFile.ms")
	public void insertFile(Model model, AttachmentMs attchment, @RequestParam MultipartFile picture,
			HttpServletRequest request, HttpServletResponse response) {
		
		// 파일 첨부
		String root = request.getSession().getServletContext().getRealPath("resources");
		//System.out.println("root : " + root);
		
		// 파일 저장경로
		String filePath = root + "\\uploadFiles\\messenger";
		System.out.println("filePath : " + filePath);
		
		// 파일명 변경
		String originFileName = picture.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonsUtils.getRandomString();		
		System.out.println("originFileName : " + originFileName);
		System.out.println("changeName : " + changeName);
		
		AttachmentMs file = new AttachmentMs();
		file.setOriginName(originFileName);
		file.setChangeName(changeName + ext);
		file.setFilePath(filePath);
		
		int result = 0;
		try {
			picture.transferTo(new File(filePath + "\\" + changeName + ext));
			
			result = ms.insertFile(file);
			
		} catch (Exception e1) {
			e1.printStackTrace();
		} 
		

		String str = "";
		if(result == 1) {
			str = "이미지 저장 성공";
		} else {
			str = "이미지 저장 실패";
		}
		
		ObjectMapper mapper = new ObjectMapper();

		try { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(str)); 
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch(JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
		
	}
	
	// 저장된 파일 조회
	@RequestMapping("/selectFile.ms")
	public void selectFile(AttachmentMs at, HttpServletResponse response) {
		AttachmentMs file = ms.selectFile(at);
		System.out.println(file.getChangeName());
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(file.getChangeName()));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 파일 다운로드
	@RequestMapping("/downloadFile.ms")
	public void downloadFile(@RequestParam String src, AttachmentMs at, HttpServletRequest request, HttpServletResponse response) {
		//System.out.println(src);
		String fileName = src.substring(src.lastIndexOf("/") + 1).replace(";", "");
		
		at.setChangeName(fileName);
		
		AttachmentMs attach = ms.selectAttachment(at);
		//System.out.println("at : " + at);
		//System.out.println("attach : " + attach);
		
		try {
			//폴더에서 파일을 읽을 스트림 생성
			BufferedInputStream buf = null;

			//클라이언트로 내보낼 출력 스트림 생성
			ServletOutputStream downOut = response.getOutputStream();
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println("root : " + root);
		    
			// 로컬 path가 아닌 사용자의 path를 읽어온다.
		    String filePath = root + "\\uploadFiles\\messenger\\" + attach.getChangeName();
		    
		    //스트림으로 전송할 파일 객체 생성
		    File downFile = new File(filePath);
			//File downFile = new File(attach.getFilePath() + "\\" + attach.getChangeName());
			//System.out.println("downFile : " + downFile);
			
			//응답 헤더 설정
			response.setContentType("text/plain; charset=UTF-8");
			//파일 링크를 클릭했을 때 다운로드 저장화면이 출력되게 처리하는 부분 (한글 인코딩)
			response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(attach.getOriginName().getBytes("UTF-8"),"ISO-8859-1") + "\"");
			response.setContentLength((int) downFile.length());
			
			FileInputStream fin = new FileInputStream(downFile);
			buf = new BufferedInputStream(fin);
			//System.out.println("fin : " + fin);
			//System.out.println("buf : " + buf);
			
			
			int readBytes = 0;
			while((readBytes = buf.read()) != -1) {
				downOut.write(readBytes);
			}
			
			downOut.close();
			buf.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		//System.out.println("attach : " + attach);
		
	}
	
	// 채팅방 초대
	@RequestMapping("/insertAddMember.ms")
	public String insertAddMember(@RequestParam String roomNo, @RequestParam String empNo, Model model, HttpSession session) {
		RoomList rl = new RoomList();
		rl.setRoomNo(roomNo);
		rl.setEmpNo(empNo);
		int result = ms.insertAddMember(rl);
		
		if(result > 0) {
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = null;
			today = formatter.format(cal.getTime());
			Timestamp sendDate = Timestamp.valueOf(today);
			
			Message m = new Message();
			m.setRoomNo(roomNo);
			m.setEmpNo(empNo);
			m.setSendDate(sendDate);
			
			int result2 = ms.insertMessage3(m);
			
			
		}
		
		return "messenger/messengerChattingList";
	}
	
}
