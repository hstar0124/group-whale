package com.kh.gw.sales.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.sales.model.exception.LoginException;
import com.kh.gw.sales.model.vo.Client;
import com.kh.gw.sales.model.vo.DayMoney;
import com.kh.gw.sales.model.vo.Payment;
import com.kh.gw.sales.model.vo.PaymentList;
import com.kh.gw.sales.model.vo.Request;

public interface SalesDao {

	Client loginCheck(SqlSessionTemplate sqlSession, Client c) throws LoginException;

	String selectEncPassword(SqlSessionTemplate sqlSession, Client c);

	int insertClient(SqlSessionTemplate sqlSession, Client c);

	int insertRequest(SqlSessionTemplate sqlSession, Request r);

	List<Request> selectRequestList(SqlSessionTemplate sqlSession);

	Client selectClientId(SqlSessionTemplate sqlSession, Client c);

	Request selectRequestDetail(SqlSessionTemplate sqlSession, Request r);

	int insertPayment(SqlSessionTemplate sqlSession, Payment p);

	List<Payment> selectPaymentList(SqlSessionTemplate sqlSession, Payment p);

	List<DayMoney> selectDayMoney(SqlSessionTemplate sqlSession, DayMoney dm);

	int deleteRequest(SqlSessionTemplate sqlSession, Request r);


}
