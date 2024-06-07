package com.kh.gw.sales.model.service;

import java.util.List;

import com.kh.gw.sales.model.exception.LoginException;
import com.kh.gw.sales.model.vo.Client;
import com.kh.gw.sales.model.vo.DayMoney;
import com.kh.gw.sales.model.vo.Payment;
import com.kh.gw.sales.model.vo.PaymentList;
import com.kh.gw.sales.model.vo.Request;

public interface SalesService {

	Client loginCheck(Client c) throws LoginException;

	int insertClient(Client c);

	int insertRequest(Request r);

	List<Request> selectRequestList();

	Client selectClientId(Client c);

	Request selectRequestDetail(Request r);

	int insertPayment(Payment p);

	List<Payment> selectPaymentList(Payment p);

	List<DayMoney> selectDayMoney(DayMoney dm);

	int deleteRequest(Request r);



}
