package com.kh.gw.education.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.kh.gw.approval.model.vo.BoxList;
import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.approval.model.vo.Pagination;
import com.kh.gw.common.CommonsUtils;
import com.kh.gw.education.model.service.educationService;
import com.kh.gw.education.model.vo.AttachmentEdu;
import com.kh.gw.education.model.vo.Education;
import com.kh.gw.education.model.vo.LikeEducation;
import com.kh.gw.education.model.vo.ReplyEdu;
import com.kh.gw.goodPlace.model.vo.ReplyPicture;

@Controller
public class educationController {
	@Autowired // 자동으로 타입과 일치하는 bean 객체를 넣어주는 행위
	private educationService es;
	
	@RequestMapping("/goEducation.ed")
	public String moveMain(Model model, HttpServletRequest request) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = es.getEducationListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		pi.setLimit(6);
		System.out.println("====== pi : " + pi);
		
		List<Education> list = es.selectEducationList(pi);
		System.out.println("====== list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount", listCount);
		
		return "education/educationMain";
	}
	
	@RequestMapping("/showEduDetail.ed")
	public String moveDetail() {
		return "education/educationDetail";
	}
	
	@RequestMapping("/showEduEnroll.ed")
	public String moveEnroll() {
		return "education/educationEnroll";
	}
	
	// 게시글 작성
	@RequestMapping("/enrollEdu.ed")
	public String enrollEdu(Model model, Education e, HttpServletRequest request,
			@RequestParam MultipartFile photo) {
		
		// 현재 시간 구하기
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp sendDate = Timestamp.valueOf(today);
		// 객체에 담기
		e.setEduDate(sendDate);
		
		// 파일 첨부
		String root = request.getSession().getServletContext().getRealPath("resources");
		//System.out.println("root : " + root);
		
		// 파일 저장경로
		String filePath = root + "\\uploadFiles\\education";
		System.out.println("filePath : " + filePath);
		
		// 파일명 변경
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonsUtils.getRandomString();		
		System.out.println("originFileName : " + originFileName);
		System.out.println("changeName : " + changeName);
		
		AttachmentEdu file = new AttachmentEdu();
		file.setOriginName(originFileName);
		file.setChangeName(changeName + ext);
		
		try {
			photo.transferTo(new File(filePath + "\\" + changeName + ext));
			
			int result = es.enrollEdu(e);
			
			if(result > 0) {
				es.insertFile(file);
			}
			
		} catch (Exception e1) {
			new File(filePath + "\\" + changeName + ext).delete();
		} 
		
		return "redirect:/goEducation.ed";
		
	}
	
	// 게시글 상세보기
	@RequestMapping("/selectEduDetail.ed")
	public String selectEduDetail(@RequestParam String eduNo, Model model, HttpServletRequest request) {
		//System.out.println("==== eduNo : " + eduNo);

		Education e = new Education();
		e.setEduNo(eduNo);		
		
		// 조회수 증가
		int result = es.plusViewsCount(e);
		if(result > 0) {
			Education eduDetail = es.selectEducationDetail(e);
			System.out.println("==== eduDetail : " + eduDetail);
			
			model.addAttribute("eduDetail", eduDetail);
		}
		
		return "education/educationDetail";
	}
	
	// 좋아요 체크여부 확인
	@RequestMapping("/heartCheck.ed")
	public void heartCheck(LikeEducation check , HttpServletResponse response) {
		int count = 0;
		count = es.heartCheck(check);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
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
	
	// 좋아요 증가
	@RequestMapping("/insertHeart.ed")
	public void insertHeart(LikeEducation check , HttpServletResponse response) {
		int result = es.insertHeart(check);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 좋아요 취소
	@RequestMapping("/deleteHeart.ed")
	public void deleteHeart(LikeEducation check , HttpServletResponse response) {
		int result = es.deleteHeart(check);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 댓글 추가
	@RequestMapping(value="/insertReply.ed")
	public void insertReply(ReplyEdu reply, HttpServletResponse response) {
		
		List<ReplyEdu> replyList = es.insertReply(reply);
		
		ObjectMapper mapper = new ObjectMapper();
		
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(replyList));
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
