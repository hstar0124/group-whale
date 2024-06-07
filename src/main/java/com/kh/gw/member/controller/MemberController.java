package com.kh.gw.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gw.common.CommonsUtils;
import com.kh.gw.member.model.exception.LoginException;
import com.kh.gw.member.model.exception.LoginUserException;
import com.kh.gw.member.model.service.MemberService;
import com.kh.gw.member.model.vo.Attachment;
import com.kh.gw.member.model.vo.ChangePwd;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.UpdateMember;



@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired // 자동으로 타입과 일치하는 bean 객체를 넣어주는 행위
	private MemberService ms;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
//	@RequestMapping("login.me")
//	public String loginCheck(Member m, Model model) {
//		
//		//System.out.println("memberController 불림");		
//		//로그인 하는 방법을 바꿔야 한다.
//		//service와 dao에서 암호 매칭하는 처리를 해줘야 한다.				
//		Member loginUser;
//		
//		loginUser = ms.loginMember(m);
//		
//		
//		model.addAttribute("loginUser", loginUser);						
//		//return "main/main";
//		return "redirect:/main.me";					
//	}
	
	@RequestMapping("noPwdLogin.me")
	public String login() {
		return "redirect:/main.me";	
	}
	
//	@RequestMapping("login.me")
//	public String loginCheck(Member m, Model model, HttpSession session) {
//		
//		//로그인 하는 방법을 바꿔야 한다.
//		//service와 dao에서 암호 매칭하는 처리를 해줘야 한다.
//				
//		Member loginUser;
//		LoginUser loginUserInfo = new LoginUser();
//		try {
//			loginUser = ms.loginMember(m);
//			loginUserInfo.setEmpNo(loginUser.getEmpNo());
//			loginUserInfo = ms.selectLoginUserInfo(loginUserInfo);
//			model.addAttribute("loginUser", loginUser);			
//			//model.addAttribute("loginUserInfo", loginUserInfo);
//			session.setAttribute("loginUserInfo", loginUserInfo);
//			return "redirect:/main.me";	
//			
//		} catch (LoginException e) {
//			//System.out.println(e.getMessage());
//			model.addAttribute("msg", e.getMessage());			
//			return "common/errorPage";
//		}		
//	}
	
	@RequestMapping("login.me")
	public String loginCheck(LoginUser m, Model model, HttpSession session) {
		
		//로그인 하는 방법을 바꿔야 한다.
		//service와 dao에서 암호 매칭하는 처리를 해줘야 한다.
				
		LoginUser loginUser;
		try {
			loginUser = ms.loginMember(m);
			model.addAttribute("loginUser", loginUser);			
			return "redirect:/main.me";	
			
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());			
			return "common/errorPage";
		}		
	}
	
	//정상 로그인시 redirect
	@RequestMapping("/main.me")
	public String  gomain(){	
		return "main/main";					
	}
	
	//직원 가입 메소드
//	@RequestMapping("insert.me")
//	public String insertMember(Model model, Member m) {
//		
//		System.out.println("controller Member : " + m);
//		
//		int result = ms.insertMember(m);
//		
//		return "redirect:/empList.me";
//	}
	
	
	
	@RequestMapping("insert.me")
	public String insertMember(Model model, Member m, HttpServletRequest request
				, @RequestParam MultipartFile picture) {
		
		//System.out.println("member : " + m);
		//System.out.println("photo : " + picture);
		
		//------------------------------------------------------------------
		//사진 업로드
		
		//webapp 밑에 있는 resources의 절대경로를 가져오는 방법
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		System.out.println("root : " + root);
		
		//파일이 저장될 경로를 지정한다.
		String filePath = root + "\\uploadFiles";
		
		
		//파일명 변경
		
		//파일 이름의 원본 이름을 가져오는 메소드
		String originName = picture.getOriginalFilename();
		//확장자만 가져와서 저장
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = CommonsUtils.getRandomString();
		
	
		/*
		 * Attachment(String attachmentNo, String foreignNo, String originName, String
		 * changeName, Date enrollDate, String attStatus)
		 */
		Attachment at = new Attachment();
		at.setOriginName(originName);
		at.setChangeName(changeName + ext);
		
		
		//------------------------------------------------------------------
		
		try {
			picture.transferTo(new File(filePath + "\\" + changeName + ext));
			
			//패스워드 암호화
			m.setEmpPwd(passwordEncoder.encode(m.getEmpPwd()));
			
			ms.insertMember(m, at);
			
			return "redirect:/selectMemberListPaging.st";
		
		} catch (Exception e) {
			
			//회원 가입 실패시 올라간 파일도 지워준다.
			new File(filePath + "\\" + changeName + ext).delete();
			
			model.addAttribute("msg", "회원 가입 실패!");
			
			return "common/errorPage";
		}
		
	}
	
	//정상 가입시 redirect
	@RequestMapping("/empList.me")
	public String  goEmpList(){	
		return "settings/memberList";					
	}
	
	//사번 유효성 검사
	@RequestMapping("/empNoCheck.me")
	public void empNoCheck(@RequestParam String empNo, HttpServletResponse response){	
		//System.out.println("empNo : " + empNo);
		
		Member empNoCheck = new Member();
		empNoCheck.setEmpNo(empNo);
		int result = ms.empNoCheck(empNoCheck);
		
		try {
			response.getWriter().print(result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//회원 리스트 Select
	@RequestMapping("/selectMemberList.me")
	public void selectMemberList(HttpServletResponse response) {
		
		List<Member> memberList = ms.selectMemberList();
		
		//System.out.println(memberList);	
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(memberList));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//	selectPositionList
	@RequestMapping("/selectPositionList.me")
	public void selectPositionList(HttpServletResponse response) {
		
		List<Position> positionList = ms.selectPositionList();
		//System.out.println(positionList);
		ObjectMapper mapper = new ObjectMapper();
			
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(positionList));
			
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/selectDutyList.me")
	public void selectDutyList(HttpServletResponse response) {
		
		List<Duty> dutyList = ms.selectDutyList();
		//System.out.println(positionList);
		ObjectMapper mapper = new ObjectMapper();
		
			
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("applicaiton/json");
				response.getWriter().print(mapper.writeValueAsString(dutyList));
			} catch (JsonGenerationException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
	}
	
	@RequestMapping("/updateMember.me")
	public String showUpdateForm() {
		
		return "common/changeInfo";
	}
	
	@RequestMapping("update.me")
	public String updateMember(Model model, UpdateMember u, HttpServletRequest request
			, @RequestParam MultipartFile cngPic) {
		
		System.out.println("updatemember : " + u);
		
		LoginUser loginUser;
		
		if(cngPic.getOriginalFilename().equals("")) {
			//사진을 새로 등록 안할때
			ms.updateMember(u);	
			
			loginUser = new LoginUser();
			loginUser.setEmpNo(u.getEmpNo());
			loginUser = ms.selectLoginUserInfo(loginUser);
			model.addAttribute("loginUser", loginUser);	
			
			return "redirect:/updateMember.me";
			
		}else {
			//사진을 새로 등록할 때
			
			String root = request.getSession().getServletContext().getRealPath("resources");	
			
			//파일이 저장될 경로를 지정한다.
			String filePath = root + "\\uploadFiles";		
			
			//파일명 변경
			
			//파일 이름의 원본 이름을 가져오는 메소드
			String originName = cngPic.getOriginalFilename();;
			//확장자만 가져와서 저장
			String ext = originName.substring(originName.lastIndexOf("."));			
			String changeName = CommonsUtils.getRandomString();			
		
			/*
			 * Attachment(String attachmentNo, String foreignNo, String originName, String
			 * changeName, Date enrollDate, String attStatus)
			 */
			Attachment at = new Attachment();
			at.setOriginName(originName);
			at.setChangeName(changeName + ext);
						
			//------------------------------------------------------------------
			
			try {
				cngPic.transferTo(new File(filePath + "\\" + changeName + ext));				
				ms.updateMember(u, at);						
				//사진을 새로 정상적으로 입력한 후에는 원래 사진은 지워준다.
				new File(filePath + "\\" + u.getOriginPicture()).delete();
				
				loginUser = new LoginUser();
				loginUser.setEmpNo(u.getEmpNo());
				loginUser = ms.selectLoginUserInfo(loginUser);
				model.addAttribute("loginUser", loginUser);	
				
				return "redirect:/updateMember.me";
			
			} catch (Exception e) {				
				//회원 가입 실패시 올라간 파일도 지워준다.
				new File(filePath + "\\" + changeName + ext).delete();				
				model.addAttribute("msg", "회원 가입 실패!");				
				return "common/errorPage";
			}
		}
	}

	@RequestMapping("/showChangePwd.me")
	public String showChangePwd() {
		return "common/changePwd";
	}

	@RequestMapping("/empPwdCheck.me")
	public void empPwdCheck(@RequestParam String empNo, @RequestParam String empPwd
			, HttpServletResponse response) {
		
		//System.out.println(empPwd);
		
		LoginUser changePwd = new LoginUser();
		changePwd.setEmpNo(empNo);
		changePwd.setEmpPwd(empPwd);
		
		int result = ms.pwdCheck(changePwd);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/changePwd.me")
	public String changePwd(ChangePwd changePwd, HttpServletResponse response, Model model) {
		//System.out.println(changePwd);
		
		changePwd.setChangePwd(passwordEncoder.encode(changePwd.getChangePwd()));		
		
		int result = ms.changePwd(changePwd);
		
		model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		
		return "common/alertPage";
	}
	
	@RequestMapping(value = "/empInfo.me")
	public String empInfo(HttpServletRequest request, Model model) {
		
		//System.out.println("새창");
		String empNo = request.getQueryString().split("=")[1]; 
		//System.out.println(empNo);
		LoginUser empInfo = new LoginUser();
		empInfo.setEmpNo(empNo);
		
		LoginUser userInfo = ms.selectLoginUserInfo(empInfo);
		//System.out.println(userInfo);
		model.addAttribute("userInfo", userInfo);
		
		return "settings/empInfo";
	}
	
	@RequestMapping("/updateDetail.me")
	public String updateDetail(Model model, UpdateMember u, HttpServletRequest request
			, @RequestParam MultipartFile cngPic) {
		
		System.out.println("updateDetailmember : " + u);
		
		LoginUser loginUser;
		
		if(cngPic.getOriginalFilename().equals("")) {
			//사진을 새로 등록 안할때
			ms.updateDetailMember(u);	
			
			LoginUser currentLoginUser = (LoginUser) request.getSession().getAttribute("loginUser");
			
			loginUser = new LoginUser();
			loginUser.setEmpNo(u.getEmpNo());
			
			if(currentLoginUser.getEmpNo() == u.getEmpNo()) {				
				loginUser = ms.selectLoginUserInfo(loginUser);
				model.addAttribute("loginUser", loginUser);	
			}
						
			return "redirect:/empInfo.me?empNo=" + loginUser.getEmpNo();
			
		}else {
			//사진을 새로 등록할 때			
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			//파일이 저장될 경로를 지정한다.
			String filePath = root + "\\uploadFiles";		
			
			//파일명 변경
			
			//파일 이름의 원본 이름을 가져오는 메소드
			String originName = cngPic.getOriginalFilename();;
			//확장자만 가져와서 저장
			String ext = originName.substring(originName.lastIndexOf("."));			
			String changeName = CommonsUtils.getRandomString();			
		
			/*
			 * Attachment(String attachmentNo, String foreignNo, String originName, String
			 * changeName, Date enrollDate, String attStatus)
			 */
			Attachment at = new Attachment();
			at.setOriginName(originName);
			at.setChangeName(changeName + ext);
						
			//------------------------------------------------------------------
			
			try {
				cngPic.transferTo(new File(filePath + "\\" + changeName + ext));				
				ms.updateDetailMember(u, at);						
				//사진을 새로 정상적으로 입력한 후에는 원래 사진은 지워준다.
				new File(filePath + "\\" + u.getOriginPicture()).delete();
				
//				loginUser = new LoginUser();
//				loginUser.setEmpNo(u.getEmpNo());
//				loginUser = ms.selectLoginUserInfo(loginUser);
//				model.addAttribute("loginUser", loginUser);	
				
				LoginUser currentLoginUser = (LoginUser) request.getSession().getAttribute("loginUser");
				
				loginUser = new LoginUser();
				loginUser.setEmpNo(u.getEmpNo());
				
				if(currentLoginUser.getEmpNo() == u.getEmpNo()) {				
					loginUser = ms.selectLoginUserInfo(loginUser);
					model.addAttribute("loginUser", loginUser);	
				}
				
				return "redirect:/empInfo.me?empNo=" + loginUser.getEmpNo();
			
			} catch (Exception e) {				
				//회원 가입 실패시 올라간 파일도 지워준다.
				new File(filePath + "\\" + changeName + ext).delete();				
				model.addAttribute("msg", "회원 정보 변경 실패");				
				return "common/errorPage";
			}
		}
		
	}
	
}
