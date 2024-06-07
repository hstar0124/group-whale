package com.kh.gw.sales.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.gw.sales.model.exception.LoginException;
import com.kh.gw.sales.model.service.SalesService;
import com.kh.gw.sales.model.vo.Client;
import com.kh.gw.sales.model.vo.DayMoney;
import com.kh.gw.sales.model.vo.Payment;
import com.kh.gw.sales.model.vo.PaymentList;
import com.kh.gw.sales.model.vo.Request;


@Controller
@SessionAttributes("loginClient")
public class SalesController {
	@Autowired // 자동으로 타입과 일치하는 bean 객체를 넣어주는 행위
	private SalesService ss;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/goSalesSite.sa")
	public String moveSite() {
		return "redirect:/selectRequestList.sa";
	}
	@RequestMapping("/goLogin.sa")
	public String moveLogin() {
		return "sales/salesLogin";
	}
	@RequestMapping("/goSignUp.sa")
	public String moveSignUp() {
		return "sales/salesSignUp";
	}
	@RequestMapping("/goWhale.sa")
	public String moveWhale() {
		return "redirect:/index.jsp";
	}

	@RequestMapping("logout.sa")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:/selectRequestList.sa";
	}
	
	
	@RequestMapping("login.sa")
	public String loginCheck(Client c, Model model, HttpSession session) {
		Client loginClient;
		//System.out.println("Client : " + c);
		try {
			loginClient = ss.loginCheck(c);
			model.addAttribute("loginClient", loginClient);		
			
			return "redirect:/selectRequestList.sa";
			
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("insertClient.sa")
	public String insertClient(Client c, @RequestParam String clientId, @RequestParam String clientPwd, 
			@RequestParam String clientEmail, @RequestParam String clientPhone, HttpServletRequest request) {
		
		try {
			c.setClientId(clientId);
			c.setClientEmail(clientEmail);
			c.setClientPhone(clientPhone);
			//패스워드 암호화
			c.setClientPwd(passwordEncoder.encode(c.getClientPwd()));
			ss.insertClient(c);
			
			return "redirect:/selectRequestList.sa";
			
		} catch (Exception e) {
			
			return "common/errorPage";
		}
	}

	@RequestMapping("insertRequest.sa")
	public String insertRequest(@RequestParam String requestType, @RequestParam String requestContent, 
			@RequestParam String requestName, @RequestParam String requestPhone, @RequestParam String requestEmail, 
			HttpServletRequest request) {
		Request r = new Request();
		r.setRequestType(requestType);
		r.setRequestContent(requestContent);
		r.setRequestName(requestName);
		r.setRequestPhone(requestPhone);
		r.setRequestEmail(requestEmail);
		
		System.out.println("Request : " + r);
		
		ss.insertRequest(r);
		
		return "redirect:/selectRequestList.sa";
	}
	
	@RequestMapping("selectRequestList.sa")
	public String loginCheck(Model model, HttpServletRequest request) {
		
		List<Request> requestList = ss.selectRequestList();
		System.out.println(requestList);
		
		model.addAttribute("list", requestList);
		return "sales/salesMain";
	}

	@RequestMapping("/selectClientId.sa")
	public void selectClientId(@RequestParam String clientId, HttpServletResponse response) {
		//System.out.println(clientId);

		Client c = new Client();
		c.setClientId(clientId);
		
		Client checkId = ss.selectClientId(c);
		//System.out.println("checkId : " + checkId);
		
		int result = 0;
		if(checkId != null) {
			result = 1;
		} else {
			result = 2;
		}
		
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
	
	@RequestMapping("/selectRequestDetail.sa")
	public void selectRequestDetail(@RequestParam String requestNo, HttpServletResponse response) {
		//System.out.println(requestNo);

		Request r = new Request();
		r.setRequestNo(requestNo);
		
		Request detail = ss.selectRequestDetail(r);
		//System.out.println("detail : " + detail);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(detail)); 
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch(JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
		
	}
	
	@RequestMapping("/insertPayment.sa")
	public void insertPayment(@RequestParam String clientNo, @RequestParam String productNo, HttpServletResponse response) {
		System.out.println(clientNo);
		System.out.println(productNo);
		
		Payment p = new Payment();
		p.setClientNo(clientNo);
		p.setProductNo(productNo);
		
		int result = ss.insertPayment(p);
		
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
	
	@RequestMapping("/selectPayment.sa")
	public void selectPayment(@RequestParam Date startDay, @RequestParam Date endDay, HttpServletResponse response) {
		//System.out.println(startDay);
		//System.out.println(endDay);
		
		Payment p = new Payment();
		p.setStartDay(startDay);
		p.setEndDay(endDay);
		
		List<Payment> plist = ss.selectPaymentList(p); 
		//System.out.println("plist : " + plist);
		
		
		ObjectMapper mapper = new ObjectMapper();

		try { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(plist)); 
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch(JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
		
	}
	
	@RequestMapping("/selectDayMoney.sa")
	public void selectDayMoney(@RequestParam Date startDay, @RequestParam Date endDay, HttpServletResponse response) {
		System.out.println(startDay);
		System.out.println(endDay);
		
		DayMoney dm = new DayMoney();
		dm.setStartDay(startDay);
		dm.setEndDay(endDay);
		
		List<DayMoney> dmlist = ss.selectDayMoney(dm); 
		//System.out.println("plist : " + plist);
		
		
		ObjectMapper mapper = new ObjectMapper();

		try { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("applicaiton/json");
			response.getWriter().print(mapper.writeValueAsString(dmlist)); 
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch(JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
		
	}
	
	
	@RequestMapping("/deleteRequest.sa")
	public String deleteRequest(@RequestParam String requestNo, HttpServletResponse response) {
		Request r = new Request();
		r.setRequestNo(requestNo);
		System.out.println("Request : " + r);
		
		int result = ss.deleteRequest(r);
		
		return "redirect:/selectRequestList.sa";
		
	}
	
	
}
