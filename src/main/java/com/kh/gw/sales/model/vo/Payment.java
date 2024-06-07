package com.kh.gw.sales.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {
	private String paymentNo;
	private String clientNo;
	private String productNo;
	private String productName;
	private String productPrice;
	private Date paymentDate;
	private String paymentStatus;
	private String note;
	private Date startDay;
	private Date endDay;
	
	public Payment() {}

	public Payment(String paymentNo, String clientNo, String productNo, String productName, String productPrice,
			Date paymentDate, String paymentStatus, String note, Date startDay, Date endDay) {
		super();
		this.paymentNo = paymentNo;
		this.clientNo = clientNo;
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.paymentDate = paymentDate;
		this.paymentStatus = paymentStatus;
		this.note = note;
		this.startDay = startDay;
		this.endDay = endDay;
	}

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getClientNo() {
		return clientNo;
	}

	public void setClientNo(String clientNo) {
		this.clientNo = clientNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
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

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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
		return "Payment [paymentNo=" + paymentNo + ", clientNo=" + clientNo + ", productNo=" + productNo
				+ ", productName=" + productName + ", productPrice=" + productPrice + ", paymentDate=" + paymentDate
				+ ", paymentStatus=" + paymentStatus + ", note=" + note + ", startDay=" + startDay + ", endDay="
				+ endDay + "]";
	}

	
}
