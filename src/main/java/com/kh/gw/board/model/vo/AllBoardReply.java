package com.kh.gw.board.model.vo;

import java.sql.Date;

public class AllBoardReply implements java.io.Serializable{
	
	private String aBoardNo;
	private String replyNo;
	private String rWriter;
	private String empName;
	private String replyEmpPhoto;
	private String rContent;
	private Date rEnrollDate;
	private Date rModifyDate;
	private String rStatus;
	private String positionName;
	
	public AllBoardReply () {}

	public AllBoardReply(String aBoardNo, String replyNo, String rWriter, String empName, String replyEmpPhoto,
			String rContent, Date rEnrollDate, Date rModifyDate, String rStatus, String positionName) {
		super();
		this.aBoardNo = aBoardNo;
		this.replyNo = replyNo;
		this.rWriter = rWriter;
		this.empName = empName;
		this.replyEmpPhoto = replyEmpPhoto;
		this.rContent = rContent;
		this.rEnrollDate = rEnrollDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.positionName = positionName;
	}

	public String getaBoardNo() {
		return aBoardNo;
	}

	public void setaBoardNo(String aBoardNo) {
		this.aBoardNo = aBoardNo;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getReplyEmpPhoto() {
		return replyEmpPhoto;
	}

	public void setReplyEmpPhoto(String replyEmpPhoto) {
		this.replyEmpPhoto = replyEmpPhoto;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrEnrollDate() {
		return rEnrollDate;
	}

	public void setrEnrollDate(Date rEnrollDate) {
		this.rEnrollDate = rEnrollDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	@Override
	public String toString() {
		return "AllBoardReply [aBoardNo=" + aBoardNo + ", replyNo=" + replyNo + ", rWriter=" + rWriter + ", empName="
				+ empName + ", replyEmpPhoto=" + replyEmpPhoto + ", rContent=" + rContent + ", rEnrollDate="
				+ rEnrollDate + ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus + ", positionName="
				+ positionName + "]";
	}

	
	
}
