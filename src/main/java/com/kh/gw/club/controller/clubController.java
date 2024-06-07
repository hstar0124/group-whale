package com.kh.gw.club.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.kh.gw.club.model.service.ClubService;
import com.kh.gw.club.model.vo.Club;
import com.kh.gw.club.model.vo.ClubMember;
import com.kh.gw.member.model.vo.LoginUser;

@Controller
public class clubController {
	@Autowired //자동으로 타입과 일치하는 bean 객체를 넣어주는 행위
	private ClubService service;
	
	//동호회 게시판 홈 (전체 동호회 목록)
	@RequestMapping(value="/goClub.cu")
	public String movePage(Model model) {
		
		List<Club> list = new ArrayList<Club>();
		
		list = service.selectTotalClubList();
		
		model.addAttribute("list", list);
		
		return "club/clubMain";
	}
	
	//전체 동호회 목록
	@RequestMapping(value="/totalClubList.cu")
	public void totalClubList(HttpServletRequest request, HttpServletResponse response) {
		
		List<Club> list = new ArrayList<Club>();
		
		list = service.selectTotalClubList();
		
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
	
	//가입한 동호회 목록 
	@RequestMapping(value="/joinedClubList.cu")
	public void joinedClubList(HttpServletRequest request, HttpServletResponse response) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		List<Club> list = new ArrayList<Club>();
		
		list = service.selectjoinedClubList(empNo);
		
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
	
	@RequestMapping(value="/clubDetail.cu")
	public String clubDetail() {
		return "club/clubDetail";
	}
	
	//동호회 등록	
	@RequestMapping(value="/insertClub.cu")
	public String insertClub(HttpServletRequest request, Club c) {
		
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		
		c.setMasterEmpNo(empNo);
		
		//CLUB_BOARD에 insert
		int result = service.insertClub(c);
		
		String clubNo = c.getClubNo();
		c.setClubNo(clubNo);

		//CLUB_MEMBER에 insert
		int result2 = service.insertMember(c);
		
		return "redirect:/goClub.cu";
	}
	
	//멤버 목록
	@RequestMapping(value="/selectMemberList.cu")
	public void selectMemberList(@RequestParam String clubNo, HttpServletRequest request, HttpServletResponse response) {
		clubNo = clubNo.replaceAll(" ", "");
		
		Club c = new Club();
		c.setClubNo(clubNo);
		
		List<ClubMember> member = service.selectMemberList(c);
		
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
	
	//멤버 추가
	@RequestMapping(value="/addClubMember.cu")
	public void addClubMember(@RequestParam String clubNo, @RequestParam List<String> memberList, HttpServletRequest request, HttpServletResponse response) {
		clubNo = clubNo.replaceAll(" ", "");
		
		String memberNo = null;
		
		for(int i = 0; i < memberList.size(); i++) {
			memberNo = memberList.get(i);
			
			ClubMember cm = new ClubMember();
			cm.setEmpNo(memberNo);
			cm.setClubNo(clubNo);
			
			int result = service.addClubMember(cm);
			
			//멤버 수 증가
			int result2 = service.increaseNumberOfMember(cm);
		}
		
		Club c = new Club();
		c.setClubNo(clubNo);
		
		List<ClubMember> member = service.selectMemberList(c);
		
		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(member));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
