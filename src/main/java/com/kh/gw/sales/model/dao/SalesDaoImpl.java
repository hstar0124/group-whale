package com.kh.gw.sales.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.sales.model.exception.LoginException;
import com.kh.gw.sales.model.vo.Client;
import com.kh.gw.sales.model.vo.DayMoney;
import com.kh.gw.sales.model.vo.Payment;
import com.kh.gw.sales.model.vo.PaymentList;
import com.kh.gw.sales.model.vo.Request;

@Repository
public class SalesDaoImpl implements SalesDao {
	
	@Override
	public Client loginCheck(SqlSessionTemplate sqlSession, Client c) throws LoginException {

		Client loginClient = sqlSession.selectOne("Sales.loginCheck", c);
		System.out.println("dao loginClient : " + loginClient);
		
		if(loginClient == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}		
		return loginClient;
	}

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Client c) {

		return sqlSession.selectOne("Sales.selectPwd", c.getClientId());
	}

	@Override
	public int insertClient(SqlSessionTemplate sqlSession, Client c) {
		
		return sqlSession.insert("Sales.insertClient", c);
	}

	@Override
	public int insertRequest(SqlSessionTemplate sqlSession, Request r) {
		
		return sqlSession.insert("Sales.insertRequest", r);
	}

	@Override
	public List<Request> selectRequestList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Sales.selectRequestList");
	}

	@Override
	public Client selectClientId(SqlSessionTemplate sqlSession, Client c) {
		
		return sqlSession.selectOne("Sales.selectClientId", c);
	}

	@Override
	public Request selectRequestDetail(SqlSessionTemplate sqlSession, Request r) {
		
		return sqlSession.selectOne("Sales.selectRequestDetail", r);
	}

	@Override
	public int insertPayment(SqlSessionTemplate sqlSession, Payment p) {

		return sqlSession.insert("Sales.insertPayment", p);
	}

	@Override
	public List<Payment> selectPaymentList(SqlSessionTemplate sqlSession, Payment p) {
		
		return sqlSession.selectList("Sales.selectPaymentList", p);
	}

	@Override
	public List<DayMoney> selectDayMoney(SqlSessionTemplate sqlSession, DayMoney dm) {
		
		return sqlSession.selectList("Sales.selectDayMoney", dm);
	}

	@Override
	public int deleteRequest(SqlSessionTemplate sqlSession, Request r) {
		
		return sqlSession.update("Sales.deleteRequest", r);
	}

	

}
