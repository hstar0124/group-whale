package com.kh.gw.todo.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Reply implements java.io.Serializable {

	private String replyNo;
	private String cardNo;
	private String replyCreateEmpNo;
	private String replyContent;
	private Timestamp enrollDate;
	private Timestamp modifyDate;
	private String replyDeleteYN;
	private String empName;
	private String positionName;
	
	public Reply() {}

	public Reply(String replyNo, String cardNo, String replyCreateEmpNo, String replyContent, Timestamp enrollDate,
			Timestamp modifyDate, String replyDeleteYN, String empName, String positionName) {
		super();
		this.replyNo = replyNo;
		this.cardNo = cardNo;
		this.replyCreateEmpNo = replyCreateEmpNo;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.replyDeleteYN = replyDeleteYN;
		this.empName = empName;
		this.positionName = positionName;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getReplyCreateEmpNo() {
		return replyCreateEmpNo;
	}

	public void setReplyCreateEmpNo(String replyCreateEmpNo) {
		this.replyCreateEmpNo = replyCreateEmpNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Timestamp getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getReplyDeleteYN() {
		return replyDeleteYN;
	}

	public void setReplyDeleteYN(String replyDeleteYN) {
		this.replyDeleteYN = replyDeleteYN;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", cardNo=" + cardNo + ", replyCreateEmpNo=" + replyCreateEmpNo
				+ ", replyContent=" + replyContent + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", replyDeleteYN=" + replyDeleteYN + ", empName=" + empName + ", positionName=" + positionName + "]";
	}
}
