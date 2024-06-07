package com.kh.gw.sales.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.gw.sales.model.dao.SalesDao;
import com.kh.gw.sales.model.exception.LoginException;
import com.kh.gw.sales.model.vo.Client;
import com.kh.gw.sales.model.vo.DayMoney;
import com.kh.gw.sales.model.vo.Payment;
import com.kh.gw.sales.model.vo.PaymentList;
import com.kh.gw.sales.model.vo.Request;

@Service
public class SalesServiceImpl implements SalesService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SalesDao sd;
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Client loginCheck(Client c) throws LoginException {
	
		Client loginClient = null;
		
		String encPassword = sd.selectEncPassword(sqlSession, c);
		System.out.println("encPassword : " + encPassword);
		
		if(!passwordEncoder.matches(c.getClientPwd(), encPassword)) {
			//일치하지 않으면 
			throw new LoginException("로그인 실패!");
		} else {
			loginClient = sd.loginCheck(sqlSession, c);
		}
		
		loginClient = sd.loginCheck(sqlSession, c);
		
		return loginClient;
	}

	@Override
	public int insertClient(Client c) {

		return sd.insertClient(sqlSession, c);
	}

	@Override
	public int insertRequest(Request r) {
		
		return sd.insertRequest(sqlSession, r);
	}

	@Override
	public List<Request> selectRequestList() {
		
		return sd.selectRequestList(sqlSession);
	}

	@Override
	public Client selectClientId(Client c) {
		
		return sd.selectClientId(sqlSession, c);
	}

	@Override
	public Request selectRequestDetail(Request r) {
		
		return sd.selectRequestDetail(sqlSession, r);
	}

	@Override
	public int insertPayment(Payment p) {
		
		return sd.insertPayment(sqlSession, p);
	}

	@Override
	public List<Payment> selectPaymentList(Payment p) {
		
		return sd.selectPaymentList(sqlSession, p);
	}

	@Override
	public List<DayMoney> selectDayMoney(DayMoney dm) {
		
		return sd.selectDayMoney(sqlSession, dm);
	}

	@Override
	public int deleteRequest(Request r) {
		
		return sd.deleteRequest(sqlSession, r);
	}
	
	

}
