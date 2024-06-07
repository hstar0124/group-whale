package com.kh.gw.feed.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.kh.gw.common.CommonsUtils;
import com.kh.gw.common.Pagination;
import com.kh.gw.feed.model.service.FeedService;
import com.kh.gw.feed.model.vo.Attachment;
import com.kh.gw.feed.model.vo.FeedBoard;
import com.kh.gw.feed.model.vo.FeedHeart;
import com.kh.gw.feed.model.vo.FeedHeartCount;
import com.kh.gw.feed.model.vo.FeedReply;
import com.kh.gw.settings.model.vo.PageInfo;

@Controller
public class FeedController {

	@Autowired
	FeedService fs;
	
//	@RequestMapping("/feedMain.fd")
//	public String FeedMain() {
//		
//		return "board/feedBoard/feedMain";
//	}
	
//	@RequestMapping("/feedMain.fd")
//	public String FeedMain(Model model, HttpServletRequest request) {
//		
//		int currentPage = 1;
//
//		if(request.getParameter("currentPage") != null) {
//			currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		}		
//		
//		int listCount = fs.getListCount();		
//		System.out.println("listCount : " + listCount);		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		
//		List<FeedBoard> feedList = fs.selectFeedList(pi);
//		System.out.println("feedList : " + feedList);
//		model.addAttribute("list", feedList);
//		model.addAttribute("pi", pi);
//		
//		
//		return "board/feedBoard/feedMain";
//	}
	
	@RequestMapping("/feedMain.fd")
	public String FeedMain(Model model, HttpServletRequest request) {
		
		List<FeedBoard> feedList = fs.selectFeedList();
		System.out.println("feedList : " + feedList);
		model.addAttribute("list", feedList);		
		
		return "board/feedBoard/feedMain";
	}
	
	
	@RequestMapping("/heartCheck.fd")
	public void heartCheck(HttpServletResponse response) {
		
		//좋아요 리스트 호출
		List<FeedHeart> heartList = fs.selectHeartList();
		System.out.println(heartList);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(heartList));			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	@RequestMapping("insert.fd")
	public String insertFeed(Model model, FeedBoard f, HttpServletRequest request
				, @RequestParam(required=false) MultipartFile picture) {
		int result = 0;
		
		if(picture.getOriginalFilename() == "") {
			//System.out.println(f);
			//System.out.println("파일없음");
			result = fs.insertFeed(f);
			
		}else {
			//System.out.println(f);
			//System.out.println(picture.getOriginalFilename());
			
			String root = request.getSession().getServletContext().getRealPath("resources");		
			String filePath = root + "\\uploadFiles";
			
			String originName = picture.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));			
			String changeName = CommonsUtils.getRandomString();
			
			Attachment at = new Attachment();
			at.setOriginName(originName);
			at.setChangeName(changeName + ext);
			
			try {
				picture.transferTo(new File(filePath + "\\" + changeName + ext));
				
				result = fs.insertFeedWithAttachment(f, at);
						
			} catch (Exception e) {				
				//실패시 사진 삭제
				new File(filePath + "\\" + changeName + ext).delete();						
			}
		}
		
		return "redirect:/feedMain.fd";
	}
	
	@RequestMapping("insertReply.fd")
	public String insertReply(FeedReply r) {
		
		//System.out.println(r);
		
		int result = fs.insertReply(r);
		
		return "redirect:/feedMain.fd";
	}
	
	@RequestMapping("deleteFeed.fd")
	public String deleteFeed(HttpServletRequest request) {
		String feedNo =  request.getQueryString(); 
		//System.out.println("feedNo : " + feedNo);		
		
		int result = fs.deleteFeed(feedNo);
		
		Attachment at = null;
		
		at = fs.selectFeedAttachemt(feedNo);
		
		//System.out.println("feed No : " + feedNo);
		//System.out.println("select Att : " + at);
		if(at != null) {
			String root = request.getSession().getServletContext().getRealPath("resources");		
			String filePath = root + "\\uploadFiles";
			new File(filePath + "\\" + at.getChangeName()).delete();
		}			
		
		return "redirect:/feedMain.fd";
	}
	
	@RequestMapping("deleteReply.fd")
	public String deleteReply(HttpServletRequest request) {
		
		String replyNo = request.getQueryString(); 
		
		int result = fs.deleteReplyOne(replyNo);
		
		return "redirect:/feedMain.fd";
	}
	
	@RequestMapping("heartInsert.fd")
	public void heartInsert(HttpServletResponse response, @RequestParam String feedBoardNo
			, @RequestParam String heartEmpNo) {
//		System.out.println("insert");
//		System.out.println(feedBoardNo);
//		System.out.println(heartEmpNo);
		
		FeedHeart heart = new FeedHeart();
		heart.setFeedBoardNo(feedBoardNo);
		heart.setHeartEmpNo(heartEmpNo);
		
		int result = fs.insertHeart(heart);
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(result));			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	@RequestMapping("heartDelete.fd")
	public void heartDelete(HttpServletResponse response, @RequestParam String feedBoardNo
			, @RequestParam String heartEmpNo) {
//		System.out.println("delete");
//		System.out.println(feedBoardNo);
//		System.out.println(heartEmpNo);
		
		FeedHeart heart = new FeedHeart();
		heart.setFeedBoardNo(feedBoardNo);
		heart.setHeartEmpNo(heartEmpNo);
		
		int result = fs.deleteHeart(heart);		
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(result));			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	
	@RequestMapping("feedEdit.fd")
	public String feedEdit(Model model, FeedBoard f) {
			
		//System.out.println("edit form : " + f);
		int result = fs.updateFeed(f);
				
		return "redirect:/feedMain.fd";
	}
	
	@RequestMapping("replyEdit.fd")
	public String replyEdit(Model model, FeedReply r) {
			
		//System.out.println("edit form : " + r);
		int result = fs.updateReply(r);

		return "redirect:/feedMain.fd";
	}
}
