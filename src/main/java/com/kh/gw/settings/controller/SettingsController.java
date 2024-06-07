package com.kh.gw.settings.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.gw.approval.model.vo.CompanyDocumentBox;
import com.kh.gw.approval.model.vo.DocumentForm;
import com.kh.gw.common.Pagination;
import com.kh.gw.member.model.service.MemberService;
import com.kh.gw.member.model.vo.ChangePwd;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.DutyList;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.PositionList;
import com.kh.gw.settings.model.service.SettingsService;
import com.kh.gw.settings.model.vo.CountMember;
import com.kh.gw.settings.model.vo.Department;
import com.kh.gw.settings.model.vo.Manager;
import com.kh.gw.settings.model.vo.MemberDto;
import com.kh.gw.settings.model.vo.MoveDepartment;
import com.kh.gw.settings.model.vo.PageInfo;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Controller
public class SettingsController {
	
	@Autowired // 자동으로 타입과 일치하는 bean 객체를 넣어주는 행위
	private SettingsService ss;
	
	@RequestMapping(value="/main.st")
	public String moveSettingsMain() {
		//System.out.println("memberController 불림");
		return "settings/settingMain";
	}
	
	//조직도 관리로 이동
	@RequestMapping(value="/depTree.st")
	public String moveDepTree() {
		//System.out.println("memberController 불림");
		return "settings/settingMain";
	}
	
	//계정 추가 페이지로 
	@RequestMapping(value="/addMember.st")
	public String moveAddMember() {
		//System.out.println("memberController 불림");
		return "settings/addMember";
	}
	
	//계정 추가 페이지로 
	@RequestMapping(value="/addManager.st")
	public String moveAddManager() {
		//System.out.println("memberController 불림");
		return "settings/managerList";
	}
		
	//문서서식 관리 페이지로
	@RequestMapping(value="/docFormat.st")
	public String moveDocFormat() {
		return "settings/docFormat";
	}
	
	//문서양식 추가 페이지로
	@RequestMapping(value="/addDocForm.st")
	public String moveAddDocForm(@RequestParam String cboxNo, Model model) {
		
		model.addAttribute("cboxNo", cboxNo);
		
		return "settings/addDocForm";
	}
	
	//조직도 조회
	@RequestMapping(value="/selectDeptList.st")
	public void empNoCheck(HttpServletResponse response){	
		
		List<Department> deptList = ss.selectDeptList();
		//System.out.println(deptList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(deptList));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//부서 이름 중복 체크
	@RequestMapping("/deptNameCheck.st")
	public void deptNameCheck(@RequestParam String deptName, HttpServletResponse response) {
		
		Department deptNameCheck = new Department();
		deptNameCheck.setDeptName(deptName);
		
		int result = ss.DeptNameCheck(deptNameCheck);
		
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/insertDept.st")
	public String insertDept(Department d) {
		
		//System.out.println("controller dept : " + d);
		
		int result = ss.insertDept(d);
		
		return "redirect:/main.st";
	}

	@RequestMapping("/removeDept.st")
	public String deleteDept(Department d) {

		//System.out.println(d);
		int result = ss.deleteDept(d);
		
		return "redirect:/main.st";		
	}
	
	//회원 리스트 Select
	@RequestMapping("/selectMemberList.st")
	public void selectMemberList(HttpServletResponse response) {
		
		List<MemberDto> memberList = ss.selectMemberList();
		
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
	
	@RequestMapping("/selectMemberListInDept.st")
	public void selectMemberListInDept(@RequestParam String deptName, HttpServletResponse response) {
		
		MemberDto mdt = new MemberDto();
		mdt.setDeptName(deptName);
		List<MemberDto> memberList = ss.selectMemberListInDept(mdt);
		
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
	
	
	@RequestMapping("/moveEmpDept.st")
	public String moveEmpDept(MoveDepartment m) {
		
		
		//받아온 이름과 부서를 테이블에서 조회하여 사번과 부서번호로 바꾸는 작업
		List<MoveDepartment> list = new ArrayList<MoveDepartment>();
		String[] deptHistoryNo = m.getDeptHistoryNo().split(",");
		String[] empNo = m.getEmpNo().split(",");
		String[] originDep = m.getOriginDep().split(",");
		String[] changeDep = m.getChangeDep().split(",");
		//System.out.println("empName : " + empName);
		if(deptHistoryNo[0].equals("1")) {
			for(int i = 0 ; i < empNo.length; i++) {
				MoveDepartment md = new MoveDepartment();
				md.setEmpNo(ss.selectOneEmpNo(empNo[i]));
				md.setOriginDep(ss.selectOneDeptNo(originDep[i]));
				md.setChangeDep(ss.selectOneDeptNo(changeDep[i]));				
				list.add(md);
			}			
		}else {
			for(int i = 0 ; i < empNo.length; i++) {
				MoveDepartment md = new MoveDepartment();
				md.setEmpNo(empNo[i]);
				md.setOriginDep(originDep[i]);
				md.setChangeDep(changeDep[i]);				
				list.add(md);
			}		
		}
				
		int result = ss.updateEmpDept(list);
		
		return "redirect:/main.st";
	}
	
	//회원 리스트 Select 페이징 처리
	@RequestMapping("/selectMemberListPaging.st")
	public String selectMemberListPaging(Model model, HttpServletRequest request) {
			
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}		
		
		int listCount = ss.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<MemberDto> memberList = ss.selectMemberList(pi);
		CountMember cm = ss.selectMemberCount();
		
		System.out.println(memberList);
		
		model.addAttribute("list", memberList);
		model.addAttribute("CountMember", cm);
		model.addAttribute("pi", pi);
		
		return "settings/memberList";
	}
	

	@RequestMapping(value="/classList.st")
	public String moveClassList(Model model, HttpServletRequest request) {
		
		
		//position 리스트 select
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}		
		
		int listCount = ss.getPositionListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<PositionList> positionList = ss.selectPositionList(pi);
		
		//System.out.println(positionList);
		
		model.addAttribute("positionList", positionList);
		model.addAttribute("pi", pi);
		
		//duty 리스트 select
		List<DutyList> dutyList = ss.selectDutyList();
		model.addAttribute("dutyList", dutyList);
				
		return "settings/classList";
	}
	
	@RequestMapping(value="/positionNoCheck.st")
	public void positionNoCheck(@RequestParam String positionNo, HttpServletResponse response) {
		
		//System.out.println(positionNo);
		Position position = new Position();
		position.setPositionNo(positionNo);		
		int result = ss.positionNoCheck(position);
		
		//System.out.println(result);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/positionNameCheck.st")
	public void positionNameCheck(@RequestParam String positionName, HttpServletResponse response) {
		
		//System.out.println(positionNo);
		Position position = new Position();
		position.setPositionName(positionName);		
		int result = ss.positionNameCheck(position);
		
		//System.out.println(result);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/insertPosition.st")
	public String insertPosition(Position position, HttpServletResponse response) {
		
		//System.out.println(position);
		int result = ss.insertPosition(position);
		
		return "redirect:classList.st";
	}
	
	@RequestMapping("/removePosition.st")
	public String deletePosition(Position position) {
		int result = ss.deletePosition(position);
		return "redirect:classList.st";
	}
	
	@RequestMapping("/dutyNoCheck.st")
	public void dutyNoCheck(@RequestParam String dutyNo, HttpServletResponse response) {
		//System.out.println(dutyNo);
		Duty duty = new Duty();
		duty.setDutyNo(dutyNo);
		int result = ss.dutyCheck(duty);
		
		//System.out.println(result);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/dutyNameCheck.st")
	public void dutyNameCheck(@RequestParam String dutyName, HttpServletResponse response) {
		
		//System.out.println(dutyNo);
		Duty duty = new Duty();
		duty.setDutyName(dutyName);
		int result = ss.dutyCheck(duty);
		
		//System.out.println(result);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/addDuty.st")
	public String addDuty(Duty duty) {
		
		int result = ss.insertDuty(duty); 
		
		return "redirect:classList.st";
	}
	
	@RequestMapping("/dutyRemove.st")
	public String removeDuty(Duty duty) {
		int result = ss.deleteDuty(duty);
		return "redirect:classList.st";		
	}
	
	@RequestMapping("managerList.st")
	public String managerList(Model model, HttpServletRequest request) {
		
		List<Manager> managerList = ss.selectManagerList();
		
		int result = ss.selectManagerCount();
		
		//System.out.println(managerList);
		model.addAttribute("managerList", managerList);
		model.addAttribute("managerCount", result);
		
		return "settings/managerList";
	}
	
	@RequestMapping("insertManager.st")
	public String insertManager(Manager manager) {
		
		System.out.println(manager);
		
		String[] empNo = manager.getEmpNo().split(",");

		List<Manager> list = new ArrayList<Manager>();
		
		for(int i = 0 ; i < empNo.length ; i++) {
			Manager m = new Manager();
			m.setEmpNo(empNo[i]);
			list.add(m);
		}
		int result = ss.insertManager(list);
		
		return "redirect:/managerList.st";
	}
	
	@RequestMapping("removeManager.st")
	public String deleteManager(Manager manager) {
		
		System.out.println(manager);
		
		String[] empNo = manager.getEmpNo().split(",");

		List<Manager> list = new ArrayList<Manager>();
		
		for(int i = 0 ; i < empNo.length ; i++) {
			Manager m = new Manager();
			m.setEmpNo(empNo[i]);
			list.add(m);
		}
		
		//System.out.println(list);
		int result = ss.deleteManager(list);
		
		return "redirect:/managerList.st";
	}
	
	
	@RequestMapping("searchEmpInfo.st")
	public void searchEmpCheck(MemberDto m, HttpServletResponse response) {
		System.out.println(m);
		
		int result = ss.selectMatching(m);
	
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/sendSms.st")
	public void sendSms(MemberDto m, HttpServletResponse response){

		String api_key = "NCSWLVCGCJAVLUJX";
		String api_secret = "YQ1RZYNQP1MZLZ1DXUHD8I5GUOODH06I";
		Message coolsms = new Message(api_key, api_secret);
		    
	    int random = new Random().nextInt(8998)+1001;
	    
	    String random1 = Integer.toString(random);
	    
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", m.getPhone()); // 수신번호
	    params.put("from", "01035690420"); // 발신번호
	    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
	    params.put("text", random1); // 문자내용    
	    params.put("app_version", "JAVA SDK v1.2"); // application name and version
	    
	    ObjectMapper mapper = new ObjectMapper();
		
	    try {
			JSONObject result = coolsms.send(params);			
			//System.out.println(result.get("success_count"));
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			//response.getWriter().print(mapper.writeValueAsString(result));
			response.getWriter().print(mapper.writeValueAsString(random1));				
			
			
		} catch (CoolsmsException e) {
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	@RequestMapping("removeEmp.st")
	public String removeEmp(HttpServletRequest request) {
		
		String[] empNo = request.getQueryString().split(","); 
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		for(int i = 0 ; i < empNo.length ; i++) {
			MemberDto m = new MemberDto();
			m.setEmpNo(empNo[i]);
			list.add(m);
		}
		
		int result = ss.deleteMember(list);
		
		return "redirect:/selectMemberListPaging.st";		
	}
	
	//폴더 이름 중복 체크
	@RequestMapping("folderNameCheck.st")
	public void folderNameCheck(@RequestParam String folderName, HttpServletResponse response) {

		int result = ss.folderNameCheck(folderName);
				
		ObjectMapper mapper = new ObjectMapper();
				
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
					
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//폴더 추가
	@RequestMapping("insertcboxName.st")
	public String insertFolderName(CompanyDocumentBox box) {
		
		box.setDepth(2);
		box.setPath("결재양식^"+box.getCboxName());
		box.setParentNo("1");
		box.setChildExist(0);
		
		ss.insertcboxName(box);
		return "redirect:/docFormat.st";
	}
	
	//삭제할 폴더에 기존 문서 존재 여부 체크
	@RequestMapping("delFolderChk.st")
	public void delFolderCheck(@RequestParam String cboxNo, HttpServletResponse response) {
		
		int result = ss.delFolderCheck(cboxNo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
					
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//폴더 삭제
	@RequestMapping("deletecboxName.st")
	public String deleteCboxName(CompanyDocumentBox box) {

		ss.deleteCboxName(box.getCboxNo());
		
		return "redirect:/docFormat.st";
	}
	
	//문서 양식 추가
	@RequestMapping("insertDocumentForm.st")
	public String insertDocumentForm(DocumentForm form) {
		
		ss.insertDocumentForm(form);
		
		return "redirect:/docFormat.st";
	}
	
	//문서 양식 삭제
	@RequestMapping("deleteDocumentForm.st")
	public String deleteDocumentForm(HttpServletRequest request) {
		String[] formNoList = request.getParameter("formNoList").split(",");
		
		ss.deleteDocumentForm(formNoList);
		
		return "redirect:/docFormat.st";
	}
	
	//문서양식 하나 조회
	@RequestMapping("selectOneDocumentForm.st")
	public String selectOneDocumentForm(HttpServletRequest request, Model model) {
		String formNo = request.getParameter("so_formNo");
		
		DocumentForm form = ss.selectOneDocumentForm(formNo);

		model.addAttribute("form", form);
		
		return "settings/addUpdateForm";
	}
	
	//문서양식 수정
	@RequestMapping("updateDocumentForm.st")
	public String updateDocumentForm(DocumentForm form) {

		ss.updateDocumentForm(form);
		
		return "redirect:/docFormat.st";
	}
	
	@RequestMapping("inDeptCheck.st")
	public void inDeptCheck(@RequestParam String deptName, HttpServletResponse response) {
		//System.out.println(deptName);
		int result = ss.selectMemberMatchingInDept(deptName);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
					
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	//폴더 수정
	@RequestMapping("updatecboxName.st")
	public String updatecboxName(CompanyDocumentBox box) {

		ss.updatecboxName(box);
		return "redirect:/docFormat.st";
	}
	
	@RequestMapping("managerCheck.st")
	public void managerCheck(@RequestParam String empNo, HttpServletResponse response) {
		
		int result = ss.selectManagerCheck(empNo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(result));
					
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
