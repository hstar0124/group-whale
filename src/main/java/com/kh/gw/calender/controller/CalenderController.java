package com.kh.gw.calender.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gw.calender.model.service.CalenderService;
import com.kh.gw.calender.model.vo.Calender;
import com.kh.gw.calender.model.vo.CalenderJSON;
import com.kh.gw.calender.model.vo.CalenderRepeat;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.settings.model.vo.Department;

@Controller
public class CalenderController {
	
	@Autowired
	private CalenderService cs;
	
	//calCategory,title,startDate,startTime,endDate,endTime,allDayChk,repeatChk(+modal)
	//,calKinds,참석자 선택 modal,place,contnet,alertSelect,calAlert
	
	//일정관리로 이동(월간 캘린더)
	@RequestMapping(value="/main.cl")
	public String moveCalenderMain(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("일정관리 페이지");
		return "calender/calenderMain";
	}
	
	//일정 등록 뷰
	@RequestMapping(value="/addCalender.cl")
	public String moveAddCalender() {
		System.out.println("일정등록뷰입니다");
		return "calender/addCalender";
	}
	
	//일정 등록
	@RequestMapping(value="/insert.cl")
	public String insertCalender(Model model,Calender c,CalenderRepeat cr,HttpServletRequest request) {

		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		//String empNo = "admin";
		c.setEmpNo(empNo);
		//알림여부랑,반복여부 존재할때 insert 추가 되게 해야함
		//일단 둘다 N인거 부터 집어 넣자
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		System.out.println("Calendar c : " + c);
		System.out.println("CalenderRepeat cr!!!!!!! : " + cr);
		
	
		if(c.getCalRepeat() == null) {
			c.setCalRepeat("N");
		}
		
		String realCycle = cr.getCycle().replace(",", "");
		System.out.println("몇번 마다 ? : " + realCycle); //넘어 간다.
		
		if(c.getCalRepeat().equals("N")) {
		int result = cs.insertCalender(c);
		System.out.println("반복없이 삽입완료 : " + result);
		}else if (c.getCalRepeat().equals("Y")){
			String realCycleWeek = cr.getCycleWeek().substring(0, cr.getCycleWeek().length());
			String realCycleMonty = cr.getCycleMonty().replace(",", "");
			String realEndOptionDay = cr.getEndOptionDay().replace(",", "");
			System.out.println("realCycleWeek : " + realCycleWeek);
		cr.setCycle(realCycle);
		cr.setCycleWeek(realCycleWeek);
		cr.setCycleMonty(realCycleMonty);
		cr.setEndOptionDay(realEndOptionDay);
		int result1 = cs.insertCalender(c);
		int result2 = cs.insertCalenderRepeat(cr);
		System.out.println("반복있게 삽입 완료" + result1 + "," + result2);
		}
		
		return "redirect:/main.cl";
	}
	
	//내 일정
	@RequestMapping(value="/selectMy.cl")
	public void selectMyCalenderList(HttpServletResponse response,HttpServletRequest request) {
		
		System.out.println("일정관리 페이지 내 일정 ajax");
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		//String empNo = "admin"; //위에걸로 바꿔야함
		System.out.println("empNo : " + empNo);
		
		List<Calender> calenderList = cs.selectMyCalenderList(empNo);
		System.out.println("encode 전 calenderList : " + calenderList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(calenderList));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//전사일정
	@RequestMapping(value="/selectAll.cl")
	public void selectAllCalenderList(HttpServletResponse response,HttpServletRequest request) {
		
		System.out.println("일정관리 페이지 전사 일정 ajax");
		//없어도되긴해 empNo 전사일정이니까 모든 전사일정불러오면대니까
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		//String empNo = "admin"; //위에걸로 바꿔야함
		
		List<Calender> calenderList = cs.selectAllCalenderList(empNo);
		System.out.println("encode 전 calenderList : " + calenderList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(calenderList));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//selectEx.cl 임원 일정
	@RequestMapping(value="/selectEx.cl")
	public void selectExCalenderList(HttpServletResponse response,HttpServletRequest request) {
		
		System.out.println("일정관리 페이지 내 팀 일정 ajax");
		//없어도되긴해 empNo 전사일정이니까 모든 전사일정불러오면대니까
		String dutyNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getDutyNo();
		//String empNo = "admin"; //위에걸로 바꿔야함
		
		List<Calender> calenderList = cs.selectExCalenderList(dutyNo);
		System.out.println("encode 전 calenderList : " + calenderList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(calenderList));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//selectMyTeam.cl 팀 일정
	@RequestMapping(value="/selectMyTeam.cl")
	public void selectMyTeamCalendarList(HttpServletResponse response,HttpServletRequest request) {
		
		System.out.println("일정관리 페이지 전사 일정 ajax");
		//없어도되긴해 empNo 전사일정이니까 모든 전사일정불러오면대니까
		String deptNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getDeptNo();
		//String empNo = "admin"; //위에걸로 바꿔야함
		
		List<Calender> calenderList = cs.selectMyTeamCalendarList(deptNo);
		System.out.println("encode 전 calenderList : " + calenderList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(calenderList));
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/detail.cl")
	public String selectOneCalender(HttpServletRequest request,Calender c) {
		
		System.out.println("상세보기 페이지 입니다.");
		
		String no = request.getParameter("no");
		c.setCalNo(no);
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		c.setEmpNo(empNo);
		
		
		System.out.println(no);
		
		Calender calender = cs.selectOneCalender(c);
		
		request.setAttribute("c", calender);

		return "calender/calenderDetail";
	}
	
	@RequestMapping("/update.cl")
	public String updateCalender(Calender c) {
		
		System.out.println("잘 들어 있나? : " + c);
		
		int result = cs.updateCalender(c);
		
		/*
		 * Timestamp ts1 = c.getCalEnd(); Timestamp ts2 = c.getCalStart()
		 */
		return "redirect:/main.cl";
	}
	
	@RequestMapping("/delete.cl")
	public String deleteCalender(HttpServletRequest request, String no) {
		
		String calNo = request.getParameter("no");
		System.out.println("calNo 잘 있나 ?? : " + calNo);
		
		int result = cs.deleteCalender(calNo);
		
		return "redirect:/main.cl";
	}
	
}
	
	
	

