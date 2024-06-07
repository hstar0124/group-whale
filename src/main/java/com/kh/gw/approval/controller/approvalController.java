package com.kh.gw.approval.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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

import com.kh.gw.approval.model.service.ApprovalService;
import com.kh.gw.approval.model.vo.ApprovalDocument;
import com.kh.gw.approval.model.vo.ApprovalLine;
import com.kh.gw.approval.model.vo.ApprovalStep;
import com.kh.gw.approval.model.vo.ApprovalVo;
import com.kh.gw.approval.model.vo.AttachmentApp;
import com.kh.gw.approval.model.vo.Authority;
import com.kh.gw.approval.model.vo.BoxList;
import com.kh.gw.approval.model.vo.CompanyDocumentBox;
import com.kh.gw.approval.model.vo.DocumentForm;
import com.kh.gw.approval.model.vo.ListCount;
import com.kh.gw.approval.model.vo.MostUseForm;
import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.approval.model.vo.Pagination;
import com.kh.gw.approval.model.vo.Peruse;
import com.kh.gw.approval.model.vo.SearchCondition;
import com.kh.gw.common.CommonsUtils;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.service.MemberService;
import com.kh.gw.member.model.service.MemberServiceImpl;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.settings.model.vo.Department;

@Controller
public class approvalController {
	@Autowired
	private ApprovalService as;
	
	//전자 결재 홈 조회
	@RequestMapping(value="/main.ap")
	public String moveSettingsMain(Model model, HttpServletRequest request) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		List<BoxList> waitList = as.selectTopThreeDraftList(empNo);
		List<BoxList> proceedList = as.selectTopThreeProceedList(empNo);
		List<BoxList> completeList = as.selectTopThreeCompleteList(empNo);
		
		model.addAttribute("waitList", waitList);
		model.addAttribute("proceedList", proceedList);
		model.addAttribute("completeList", completeList);
		
		return "approval/approvalMain";
	}
	
	//결재문 상세페이지 조회
	@RequestMapping(value="/goApprovalDetail.ap")
	public String goApprovalDetail(@RequestParam String docNo, Model model) {
		
		ApprovalDocument adoc = as.selectOneApprovalDocument(docNo);
		
		List<ApprovalStep> stepList = as.selectApprovalStepList(docNo); 
		
		List<AttachmentApp> attachList = as.selectAttachmentAppList(docNo);
		
		List<ApprovalVo> logList = as.selectApprovalVoList(docNo);
		
		List<Peruse> peruseList = as.selectPeruseList(docNo);
		
		ApprovalLine line = as.selectApprovalLine(docNo);
		
		String currentEmp = as.selectCurrentLineTurnEmp(docNo);
		
		String autEmp = as.selectAuthorityEmp(docNo);
		
		model.addAttribute("adoc", adoc);
		model.addAttribute("stepList", stepList);
		model.addAttribute("attachList", attachList);
		model.addAttribute("logList", logList);
		model.addAttribute("currentEmp", currentEmp);
		model.addAttribute("peruseList", peruseList);
		model.addAttribute("autEmp", autEmp);
		model.addAttribute("line", line);
		
		return "approval/approvalDetail";
	}
	
	//양식 선택 후 확인 버튼 클릭시
	@RequestMapping(value="/goWriteForm.ap")
	public String goWriteForm(@RequestParam String formNo, HttpServletRequest request) {

		DocumentForm form = as.selectOneDocumentForm(formNo);
		request.setAttribute("form", form);
		
		return "approval/approvalWriteForm";
	}
	
	//결재 요청함 조회(페이징)
	@RequestMapping(value="/goAppDraft.ap")
	public String goAppDraft(Model model, HttpServletRequest request) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		int listCount = as.getListCount(empNo);
		
		//System.out.println("listCount : " + listCount);
		//System.out.println("empNo : " + empNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectDraftBoxList(empNo, pi);
		
		//System.out.println("boxList : " + boxList);
		
		model.addAttribute("boxList", boxList);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount", listCount);
		
		return "approval/appDraftBox";
	}
	
	//결재 대기함 조회(페이징)
	@RequestMapping(value="/goAppWait.ap")
	public String goAppWait(Model model, HttpServletRequest request) {
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getAppWaitListCount(empNo);
		//System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectAppWaitBoxList(empNo, pi);
		
		//System.out.println("boxList : " + boxList);
		
		model.addAttribute("boxList", boxList);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount", listCount);
		
		return "approval/appWaitBox";
	}
	
	//결재 진행함 조회
	@RequestMapping(value="/goAppProceed.ap")
	public String goAppProceed(Model model, HttpServletRequest request) {
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getAppProceedListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectAppProceedBoxList(empNo, pi);
		
		model.addAttribute("boxList", boxList);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount", listCount);
		
		return "approval/appProceedBox";
	}
	
	//완료 문서함 조회
	@RequestMapping(value="/goAppComplete.ap")
	public String goAppComplete(Model model, HttpServletRequest request) {
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getAppCompleteListCount(empNo);
		
		
		 PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		 
		 List<BoxList> boxList = as.selectAppCompleteBoxList(empNo, pi);
		 
		 model.addAttribute("boxList", boxList); 
		 
		 model.addAttribute("pi", pi);
		 
		 model.addAttribute("listCount", listCount);
		 
		return "approval/appCompleteBox";
	}
	
	//반려 문서함 조회
	@RequestMapping(value="/goAppReject.ap")
	public String goAppReject(Model model, HttpServletRequest request) {
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getAppRejectListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectAppRejectBoxList(empNo, pi);
		
		model.addAttribute("boxList", boxList); 
		 
		model.addAttribute("pi", pi);
		
		model.addAttribute("listCount", listCount);
		
		return "approval/appRejectBox";
	}
	
	//참조/열람 문서함 조회
	@RequestMapping(value="/goAppRef.ap")
	public String goAppRef(Model model, HttpServletRequest request) {
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getAppRefListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectAppRefBoxList(empNo, pi);
		
		model.addAttribute("boxList", boxList);
		
		model.addAttribute("pi", pi);
		
		model.addAttribute("listCount", listCount);
		
		return "approval/appRefBox";
	}
	
	//결재 예정 문서함 조회
	@RequestMapping(value="/goAppPlan.ap")
	public String goAppPlan(Model model, HttpServletRequest request) {
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getAppPlanListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectAppPlanBoxList(empNo, pi);
		
		model.addAttribute("boxList", boxList);
		
		model.addAttribute("pi", pi);
		
		model.addAttribute("listCount", listCount);
		
		return "approval/appPlanBox";
	}
	
	//전자결재 환경설정 조회
	@RequestMapping(value="/goAppSetting.ap")
	public String goAppSetting(Model model, HttpServletRequest request) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getAuthorityListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Authority> list = as.selectAuthorityList(empNo, pi);
		
			
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "approval/approvalSetting";
	}
	
	@RequestMapping(value="/addAbsence.ap")
	public String goAddAbsence() {
		return "approval/addAbsence";
	}
	
	@RequestMapping(value="/goDeptDoc.ap")
	public String goDeptDoc() {
		return "approval/deptDocBox";
	}
	
	@RequestMapping(value="/goPerDoc.ap")
	public String goPerDoc() {
		return "approval/perDocBox";
	}
	
	//임시문서함 조회(페이징)
	@RequestMapping(value="/goTempDoc.ap")
	public String goTempDoc(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ListCount lc = new ListCount(empNo, 0);
		
		int listCount = as.getListCount(lc);
		
		//System.out.println("listCount : " + listCount);
		//System.out.println("empNo : " + empNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectTempBoxList(empNo, pi);
		
		//System.out.println("boxList : " + boxList);
		
		model.addAttribute("boxList", boxList);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount", listCount);
		
		return "approval/tempDocBox";
	}
	
	//전사문서함 조회
	@RequestMapping(value="/selectCompanyDocList.ap")
	public void selectCompanyDocList(HttpServletResponse response){	
			
		List<CompanyDocumentBox> companyDocList = as.selectCompanyDocList();
		//System.out.println(companyDocList);
			
		ObjectMapper mapper = new ObjectMapper();
			
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(companyDocList));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//결재양식 조회
	@RequestMapping(value="/selectDocumentFormList.ap")
	public void selectDocumentFormList(@RequestParam String cboxNo, HttpServletResponse response) {
		
		List<DocumentForm> documentFormList = as.selectDocumentFormList(cboxNo);
		//System.out.println("documentFormList : " + documentFormList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(documentFormList));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//결재양식 조회 (관리자용)
	@RequestMapping(value="/selectDocumentFormListForAdmin.ap")
	public void selectDocumentFormListForAdmin(@RequestParam String cboxNo, HttpServletResponse response) {
		
		List<DocumentForm> documentFormList = as.selectDocumentFormListForAdmin(cboxNo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(documentFormList));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//결재양식 상세 조회
	@RequestMapping(value="/selectOneDocumentForm.ap")
	public void selectOneDocumentForm(@RequestParam String formNo, HttpServletResponse response) {
		
		DocumentForm form = as.selectOneDocumentForm(formNo);
		//System.out.println("form : " + form);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(form));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//기안문 추가
	@RequestMapping(value="/insertApproval.ap")
	public String insertApprovalForm(Model model, ApprovalDocument adoc, HttpServletRequest request
			, @RequestParam(required=false) MultipartFile[] file) {
		System.out.println("ad : " + adoc);
		String[] arrEmp = request.getParameter("arrEmpNoInput").split(",");
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		//결재단계
		List<ApprovalStep> list = new ArrayList<ApprovalStep>();
		
		//결재선
		ApprovalLine line = new ApprovalLine();
		line.setEmpNo(empNo);
		
		for(int i=0; i < arrEmp.length; i++) {
			ApprovalStep astep = new ApprovalStep();
			astep.setStepNum(i);
			astep.setStepType(0);
			astep.setEmpNo(arrEmp[i]);
			list.add(astep);
		}
		
		//참조자&열람자
		String arrRefNo[] = request.getParameter("arrRefEmpNoInput").split(",");
		String arrOpenNo[] = request.getParameter("arrOpenEmpNoInput").split(",");
		List<Peruse> peruseList = new ArrayList<Peruse>();
		
		for(int i = 1; i < arrRefNo.length; i++) {
			Peruse peruse = new Peruse();
			peruse.setPerKind(1);
			peruse.setPerType(0);
			peruse.setEmpNo(arrRefNo[i]);
			peruseList.add(peruse);
		}
		
		for(int i = 1; i < arrOpenNo.length; i++) {
			Peruse peruse = new Peruse();
			peruse.setPerKind(0);
			peruse.setPerType(0);
			peruse.setEmpNo(arrOpenNo[i]);
			peruseList.add(peruse);
		}
		
		for(int i = 0; i < peruseList.size(); i++) {
			System.out.println(peruseList.get(i));
		}
		List<AttachmentApp> attachList = new ArrayList<AttachmentApp>();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
				
		System.out.println("root : " + root);
				
		String filePath = root + "\\uploadFiles\\approval";
		
		System.out.println("filePath : " + filePath);
		for(int i=0; i < file.length; i++) {
			if(!file[i].getOriginalFilename().equals("")) {
				AttachmentApp attachment = new AttachmentApp();
				
				String originName = file[i].getOriginalFilename();
				
				String ext = originName.substring(originName.lastIndexOf("."));
				
				String changeName = CommonsUtils.getRandomString();
				
				attachment.setOriginName(file[i].getOriginalFilename());
				attachment.setChangeName(changeName + ext);
				attachment.setFilePath(filePath + "\\" + changeName + ext);
				attachment.setFileSize(Long.toString(file[i].getSize()));
				
//				System.out.println("================== file start ======================");
//				System.out.println("파일 실제 이름 : " + file[i].getOriginalFilename());
//				System.out.println("파일 change 이름 : " + (changeName + ext));
//				System.out.println("파일 경로 : " +( filePath + "\\" + changeName + ext) );
//				System.out.println("파일 크기 : " + file[i].getSize());
//				System.out.println(attachment);
//				System.out.println("=================== file END =======================");
			
				try {
					file[i].transferTo(new File(filePath + "\\" + changeName + ext));
					
					attachList.add(attachment);
				} catch (Exception e) {
					new File(filePath + "\\" + changeName + ext).delete();
				} 
				
				
			}
		}
		
		
		
		as.insertApprovalForm(line, list, adoc, attachList, peruseList);
		
		return "redirect:/main.ap";
	}
	
	//자주쓰는 양식 추가
	@RequestMapping(value="/insertMostUseForm.ap")
	public void insertMostUseForm(@RequestParam String formNo, HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("formNo : "  + formNo);
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		MostUseForm form = new MostUseForm();
		form.setEmpNo(empNo);
		form.setFormNo(formNo);
		
		//중복체크 조회
		int result = as.mostUseFormCheck(form);
		int data = 0;
		if(result == 0) {
			as.insertMostUseForm(form);
			data = 1;
		} 
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//자주쓰는 양식 조회
	@RequestMapping(value="/selectMostUseForm.ap")
	public void selectMostUseForm(HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		List<MostUseForm> list = as.selectMostUseForm(empNo);
		
		//System.out.println("list : " + list);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//자주쓰는 양식 삭제
	@RequestMapping(value="/deleteMostUseForm.ap")
	public String deleteMostUseForm(@RequestParam String formNo, HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		formNo = formNo.replaceAll(" ", "");
		MostUseForm form = new MostUseForm();
		form.setEmpNo(empNo);
		form.setFormNo(formNo);
		
		//System.out.println("form : " + form);
		int result = as.deleteMostUseForm(form);
		//System.out.println("result : " + result);
		
		return "redirect:/main.ap";
		
	}
	
	//결재라인에서 사원 클릭시 정보 조회
	@RequestMapping(value="/selectOneMember.ap")
	public void selectOneMember(@RequestParam String empNo, HttpServletResponse response) {
		
		LoginUser employee = as.selectEmployeeInfo(empNo);
		//System.out.println("employee : " + employee);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(employee));
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	//결재문에서 첨부파일 다운로드
	@RequestMapping(value="/downloadAttachment.ap")
	public void downloadAttachmentApp(@RequestParam String fileNo, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("fileNo : " + fileNo);
		
		AttachmentApp attach = as.selectOneAttachmentApp(fileNo);
		
		try {
			BufferedInputStream buf = null;
			ServletOutputStream downOut = response.getOutputStream();
			
			String root = request.getSession().getServletContext().getRealPath("resources");
		    
		    System.out.println("root : " + root);
		          
		    String filePath = root + "\\uploadFiles\\approval\\" + attach.getChangeName();
		    
		    File downFile = new File(filePath);
			
			//File downFile = new File(attach.getFilePath());
			
			System.out.println(attach.getFilePath());
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
		//System.out.println("attach : " + attach);
	}
	
	//결재 진행
	@RequestMapping(value="/insertApprovalVo.ap")
	public String insertApproval(ApprovalVo app, HttpServletRequest request) {
		String formNo = request.getParameter("formNo");

		//System.out.println("app : " + app); 

		as.insertApproval(app, formNo);
		
		return "redirect:/goApprovalDetail.ap?docNo=" + app.getDocNo();
	}
	
	
	//결재양식 검색
	@RequestMapping(value="/searchFormName.ap")
	public void searchFormName(@RequestParam String formTitle, HttpServletResponse response) {
		System.out.println("formName : " + formTitle);
		
		List<DocumentForm> list = as.searchFormName(formTitle);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/goAuthority.ap")
	public String goAuthorityApproval(Authority at, Model model) {
		System.out.println("at : " + at);
		
		model.addAttribute("aut", at);
		return "approval/AuthorityApprovalForm";
	}
	
	//부재/위임 관련 결재 추가
	@RequestMapping(value="/insertAuthorityApproval.ap")
	public String insertAuthorityApproval(Model model, ApprovalDocument adoc, Authority aut, HttpServletRequest request
			, @RequestParam(required=false) MultipartFile[] file) {
		
		adoc.setFormNo("25");
		adoc.setDocDelegate(1);
		
		String[] arrEmp = request.getParameter("arrEmpNoInput").split(",");
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		//결재단계
		List<ApprovalStep> list = new ArrayList<ApprovalStep>();
		
		//결재선
		ApprovalLine line = new ApprovalLine();
		line.setEmpNo(empNo);
		
		for(int i=0; i < arrEmp.length; i++) {
			ApprovalStep astep = new ApprovalStep();
			astep.setStepNum(i);
			astep.setStepType(0);
			astep.setEmpNo(arrEmp[i]);
			list.add(astep);
		}
		
		//참조자&열람자
		String arrRefNo[] = request.getParameter("arrRefEmpNoInput").split(",");
		String arrOpenNo[] = request.getParameter("arrOpenEmpNoInput").split(",");
		List<Peruse> peruseList = new ArrayList<Peruse>();
		
		for(int i = 1; i < arrRefNo.length; i++) {
			Peruse peruse = new Peruse();
			peruse.setPerKind(1);
			peruse.setPerType(0);
			peruse.setEmpNo(arrRefNo[i]);
			peruseList.add(peruse);
		}
		
		for(int i = 1; i < arrOpenNo.length; i++) {
			Peruse peruse = new Peruse();
			peruse.setPerKind(0);
			peruse.setPerType(0);
			peruse.setEmpNo(arrOpenNo[i]);
			peruseList.add(peruse);
		}
		
		List<AttachmentApp> attachList = new ArrayList<AttachmentApp>();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
				
				
		String filePath = root + "\\uploadFiles\\approval";
		
		System.out.println("filePath : " + filePath);
		for(int i=0; i < file.length; i++) {
			if(!file[i].getOriginalFilename().equals("")) {
				AttachmentApp attachment = new AttachmentApp();
				
				String originName = file[i].getOriginalFilename();
				
				String ext = originName.substring(originName.lastIndexOf("."));
				
				String changeName = CommonsUtils.getRandomString();
				
				attachment.setOriginName(file[i].getOriginalFilename());
				attachment.setChangeName(changeName + ext);
				attachment.setFilePath(filePath + "\\" + changeName + ext);
				attachment.setFileSize(Long.toString(file[i].getSize()));
				
				try {
					file[i].transferTo(new File(filePath + "\\" + changeName + ext));
					
					attachList.add(attachment);
				} catch (Exception e) {
					new File(filePath + "\\" + changeName + ext).delete();
				} 
				
				
			}
		}
		
		
		
		as.insertAuthorityApproval(line, list, adoc, attachList, peruseList, aut);
		
		return "redirect:/main.ap";
	}
	
	@RequestMapping(value="/insertAfterRead.ap")
	public String insertAfterRead(ApprovalVo app, Peruse pu) {
		
		as.insertAfterRead(app, pu);
		
		return "redirect:/goApprovalDetail.ap?docNo=" + app.getDocNo();
	}
	
	//대시보드에서 결재대기문서 5개 조회하는 메소드
	@RequestMapping(value="/selectTopFiveDraftList.ap")
	public void selectTopFiveDraftList(@RequestParam String empNo, HttpServletResponse response) {
		//System.out.println("empNo : " + empNo);
		
		List<BoxList> approvalList = as.selectTopFiveDraftList(empNo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(approvalList));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//대시보드에서 결재대기문서 갯수 조회하는 메소드
	@RequestMapping(value="/getAppWaitListCount.ap")
	public void getAppWaitListCount(@RequestParam String empNo, HttpServletResponse response) {
	
		int count = as.getAppWaitListCount(empNo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(count));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//완료문서함 검색
	@RequestMapping(value="/searchComplete.ap")
	public String searchCompleteList(@RequestParam String searchCondition, @RequestParam String searchValue, Model model,
									HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		SearchCondition sc = new SearchCondition();
		sc.setEmpNo(empNo);
		
		if(searchCondition.equals("writer")) {
			sc.setWriter(searchValue);
		}
		
		if(searchCondition.equals("title")) {
			sc.setTitle(searchValue);
		}
		
		if(searchCondition.equals("form")) {
			sc.setForm(searchValue);
		}
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getSearchCompleteListCount(sc);
		//System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<BoxList> boxList = as.selectSearchCompleteBoxList(sc, pi);
		 
		 model.addAttribute("boxList", boxList); 
		 
		 model.addAttribute("pi", pi);
		 
		 model.addAttribute("listCount", listCount);
		 
		return "approval/appCompleteBox";
		
	}
	
	//저장된 결재선 조회
	@RequestMapping(value="/selectSaveLine.ap")
	public void selectSaveLine(@RequestParam String empNo, HttpServletResponse response) {
		//System.out.println("empNo : " + empNo);
		
		List<ApprovalLine> lineList = as.selectSaveLineList(empNo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(lineList));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/selectOneMyLine.ap")
	public void selectOneMyLine(@RequestParam String lineNo, HttpServletResponse response) {
		
		List<ApprovalStep> stepList = as.selectOneMyLine(lineNo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(stepList));
				
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/insertSaveMyLine.ap")
	public void insertSaveMyLine(
			@RequestParam(value="saveName") String saveName,
			@RequestParam(value="arrEmpNo[]") List<String> arrEmpNo, 
			HttpServletRequest request, HttpServletResponse response) {

		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		ApprovalLine line = new ApprovalLine();
		line.setLineName(saveName);
		line.setLineSave(1);
		line.setEmpNo(empNo);
		line.setLineTurn(1);
		
		List<ApprovalStep> list = new ArrayList<ApprovalStep>();
		
		for(int i = 0; i < arrEmpNo.size(); i++) {
			ApprovalStep astep = new ApprovalStep();
			astep.setStepNum(i);
			astep.setStepType(0);
			astep.setEmpNo(arrEmpNo.get(i));
			list.add(astep);
		}
		
		as.insertSaveMyLine(line, list);
	
	}
	
	@RequestMapping(value="/updateApprovalDocument.ap")
	public String updateApprovalDocument(ApprovalDocument doc, HttpServletRequest request) {
		//System.out.println("doc : " + doc);
		as.updateApprovalDocument(doc);
		
		return "redirect:/main.ap";
	}
	
	//임시저장 수정 페이지
	@RequestMapping(value="/modifyTemporary.ap")
	public String modifyTemporary(@RequestParam String docNo, Model model) {
		//System.out.println("docNo : " + docNo);
		
		ApprovalDocument adoc = as.selectOneApprovalDocument(docNo);
		
		List<ApprovalStep> stepList = as.selectApprovalStepList(docNo); 
		
		List<AttachmentApp> attachList = as.selectAttachmentAppList(docNo);
		
		List<ApprovalVo> logList = as.selectApprovalVoList(docNo);
		
		List<Peruse> peruseList = as.selectPeruseList(docNo);
		
		ApprovalLine line = as.selectApprovalLine(docNo);
		
		String currentEmp = as.selectCurrentLineTurnEmp(docNo);
		
		String autEmp = as.selectAuthorityEmp(docNo);
		
		model.addAttribute("adoc", adoc);
		model.addAttribute("stepList", stepList);
		model.addAttribute("attachList", attachList);
		model.addAttribute("logList", logList);
		model.addAttribute("currentEmp", currentEmp);
		model.addAttribute("peruseList", peruseList);
		model.addAttribute("autEmp", autEmp);
		model.addAttribute("line", line);
		return "approval/tempUpdateForm";
	}
}
