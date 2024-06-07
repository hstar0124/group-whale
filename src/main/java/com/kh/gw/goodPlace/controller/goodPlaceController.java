package com.kh.gw.goodPlace.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.common.CommonsUtils;
import com.kh.gw.goodPlace.model.service.goodPlaceService;
import com.kh.gw.goodPlace.model.vo.AttachmentPicture;
import com.kh.gw.goodPlace.model.vo.LikesPicture;
import com.kh.gw.goodPlace.model.vo.Pagination;
import com.kh.gw.goodPlace.model.vo.PictureBoard;
import com.kh.gw.goodPlace.model.vo.ReplyPicture;

@Controller
public class goodPlaceController {
	@Autowired // 자동으로 타입과 일치하는 bean 객체를 넣어주는 행위
	private goodPlaceService gs;
	
	@RequestMapping(value="/goPlace.gp")
	public String movePage(Model model, HttpServletRequest request) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		int listCount = gs.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<PictureBoard> list = new ArrayList<PictureBoard>();
		
		list = gs.selectPictureBoardList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "goodPlace/photoGalleryMain";
	}
	
	@RequestMapping(value="/goDetail.gp")
	public String moveDetail(Model model, HttpServletRequest request) {
		String pboardNo = request.getParameter("pboardNo");
		
		PictureBoard pboard = gs.selectOnePboard(pboardNo);
		
		model.addAttribute("pboard", pboard);
		
		return "goodPlace/photoGalleryDetail";
	}
	
	@RequestMapping(value="/goWrite.gp")
	public String moveWrite() {
		return "goodPlace/photoGalleryEnroll";
	}
	
	@RequestMapping(value="/insertPboard.gp") 
	public String insertPboard(PictureBoard pBoard, HttpServletRequest request,
			@RequestParam MultipartFile thumbnailImg) {
		int result = 0;

		String root = request.getSession().getServletContext().getRealPath("resources");		
		String filePath = root + "\\uploadFiles\\pictureBoard";
			
		String originName = thumbnailImg.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));			
		String changeName = CommonsUtils.getRandomString();
			
		AttachmentPicture ap = new AttachmentPicture();
		ap.setOriginName(originName);
		ap.setChangeName(changeName + ext);
			
		try {
			thumbnailImg.transferTo(new File(filePath + "\\" + changeName + ext));
				
			result = gs.insertPboardWithAttachment(pBoard, ap);
			
		} catch (Exception e) {				
			//실패시 사진 삭제
			new File(filePath + "\\" + changeName + ext).delete();						
		}
			
		return "redirect:/goPlace.gp";
	}
	
	@RequestMapping(value="/insertReply.gp")
	public void insertReply(ReplyPicture reply, HttpServletResponse response) {
		
		List<ReplyPicture> replyList = gs.insertReply(reply);
		
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
	
	@RequestMapping(value="/heartCheck.gp")
	public void heartCheck(LikesPicture check, HttpServletResponse response) {
		
		int count = 0;
		count = gs.heartCheck(check);
		
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
	
	@RequestMapping(value="/insertHeart.gp")
	public void insertHeart(LikesPicture check, HttpServletResponse response) {
		int result = gs.insertHeart(check);
		
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
	
	@RequestMapping(value="/deleteHeart.gp")
	public void deleteHeart(LikesPicture check, HttpServletResponse response) {
		int result = gs.deleteHeart(check);
		
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
	
	@RequestMapping(value="/goModify.gp")
	public String goModifyView(@RequestParam String pboardNo, Model model) {
		
		PictureBoard pboard = gs.selectOnePboardWithoutReply(pboardNo);
		
		model.addAttribute("pboard", pboard);
		
		return "goodPlace/photoGalleryModify";
	}
	
	@RequestMapping(value="/updatePboard.gp")
	public String updatePboard(PictureBoard pBoard, HttpServletRequest request,
			@RequestParam(required=false) MultipartFile thumbnailImg) {
		System.out.println("pBoard : " + pBoard);
		System.out.println("==================================");
		System.out.println("thumbnailImg : " + thumbnailImg);
		
		if(thumbnailImg.getOriginalFilename() == "") {
			gs.updatePboard(pBoard);
		} else {
			
			String root = request.getSession().getServletContext().getRealPath("resources");		
			String filePath = root + "\\uploadFiles\\pictureBoard";
			
			String originName = thumbnailImg.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));			
			String changeName = CommonsUtils.getRandomString();
			
			AttachmentPicture ap = new AttachmentPicture();
			ap.setOriginName(originName);
			ap.setChangeName(changeName + ext);
			ap.setPboardNo(pBoard.getPboardNo());
			
			try {
				thumbnailImg.transferTo(new File(filePath + "\\" + changeName + ext));
				
				gs.updatePboardWithAttachment(pBoard, ap);
				
			} catch (Exception e) {				
				//실패시 사진 삭제
				new File(filePath + "\\" + changeName + ext).delete();						
			}
		}
		return "redirect:/goPlace.gp";
	}
	
	@RequestMapping(value="/deletePboard.gp")
	public String deletePbaord(@RequestParam String pboardNo) {
		
		gs.deletePboard(pboardNo);
		
		return "redirect:/goPlace.gp";
	}
	
	@RequestMapping(value="/deletePboardReply.gp")
	public String deletePboardReply(HttpServletRequest request) {
		
		String pboardNo = request.getParameter("pboardNo");
		String preplyNo = request.getParameter("preplyNo");

		gs.deletePboardReply(preplyNo);
		
		return "redirect:/goDetail.gp?pboardNo=" + pboardNo;
	}
	
	@RequestMapping(value="/updatePboardReply.gp")
	public String updatePboardReply(HttpServletRequest request) {
		
		String pboardNo = request.getParameter("pboardNo");
		String preplyNo = request.getParameter("preplyNo");
		String content = request.getParameter("content");
		
		ReplyPicture reply = new ReplyPicture();
		reply.setPreplyNo(preplyNo);
		reply.setContent(content);
		
		gs.updatePboardReply(reply);
		
		return "redirect:/goDetail.gp?pboardNo=" + pboardNo;
	}
}
