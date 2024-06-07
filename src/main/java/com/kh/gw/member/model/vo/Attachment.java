package com.kh.gw.member.model.vo;

import java.sql.Date;

public class Attachment {

//	ATTACHMENT_NO	VARCHAR2(100 BYTE)
//	FOREIGN_NO VARCHER2(50 BYTE)	
//	ORIGIN_NAME	VARCHAR2(200 BYTE)
//	CHANGE_NAME	VARCHAR2(200 BYTE)
//	ENROLL_DATE	DATE
//	ATT_STATUS	VARCHAR2(30 BYTE)
	private String attachmentNo;
	private String foreignNo;
	private String originName;
	private String changeName;
	private Date enrollDate;
	private String attStatus;
	
	public Attachment() {}
	
	public Attachment(String attachmentNo, String foreignNo, String originName, String changeName, Date enrollDate,
			String attStatus) {
		super();
		this.attachmentNo = attachmentNo;
		this.foreignNo = foreignNo;
		this.originName = originName;
		this.changeName = changeName;
		this.enrollDate = enrollDate;
		this.attStatus = attStatus;
	}
	public String getAttachmentNo() {
		return attachmentNo;
	}
	public void setAttachmentNo(String attachmentNo) {
		this.attachmentNo = attachmentNo;
	}
	public String getForeignNo() {
		return foreignNo;
	}
	public void setForeignNo(String foreignNo) {
		this.foreignNo = foreignNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getAttStatus() {
		return attStatus;
	}
	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}

	@Override
	public String toString() {
		return "Attachment [attachmentNo=" + attachmentNo + ", foreignNo=" + foreignNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", enrollDate=" + enrollDate + ", attStatus=" + attStatus + "]";
	}
	
}
