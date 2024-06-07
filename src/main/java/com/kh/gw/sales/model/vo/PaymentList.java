package com.kh.gw.sales.model.vo;

import java.sql.Date;

public class PaymentList implements java.io.Serializable {

	private String paymentNo;
	private String productName;
	private String productPrice;
	private Date productDate;
	private Date startDay;
	private Date endDay;
	
	public PaymentList() {}

	public PaymentList(String paymentNo, String productName, String productPrice, Date productDate, Date startDay,
			Date endDay) {
		super();
		this.paymentNo = paymentNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDate = productDate;
		this.startDay = startDay;
		this.endDay = endDay;
	}

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getEndDay() {
		return endDay;
	}

	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}

	@Override
	public String toString() {
		return "PaymentList [paymentNo=" + paymentNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDate=" + productDate + ", startDay=" + startDay + ", endDay=" + endDay + "]";
	}

	
	
}
