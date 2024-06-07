package com.kh.gw.mail.model.vo;

import java.util.Date;

public class Mail implements java.io.Serializable {
	
	private String mailNo;
	private String empNo;
	private String receiver;
	private String cc;
	private String from;
	private String mailSubject;
	private String mailContent;
	private String mailEnrollDate;
	private String mailStatus;
	private String eaSize;
	private int mailboxType;
	private String receiverType;
	private String empName;
	private String positionName;
	private String read;
	private AttachmentMail attachment;
	public Mail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mail(String mailNo, String empNo, String receiver, String cc, String from, String mailSubject,
			String mailContent, String mailEnrollDate, String mailStatus, String eaSize, int mailboxType,
			String receiverType, String empName, String positionName, String read, AttachmentMail attachment) {
		super();
		this.mailNo = mailNo;
		this.empNo = empNo;
		this.receiver = receiver;
		this.cc = cc;
		this.from = from;
		this.mailSubject = mailSubject;
		this.mailContent = mailContent;
		this.mailEnrollDate = mailEnrollDate;
		this.mailStatus = mailStatus;
		this.eaSize = eaSize;
		this.mailboxType = mailboxType;
		this.receiverType = receiverType;
		this.empName = empName;
		this.positionName = positionName;
		this.read = read;
		this.attachment = attachment;
	}
	public String getMailNo() {
		return mailNo;
	}
	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getMailSubject() {
		return mailSubject;
	}
	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	public String getMailEnrollDate() {
		return mailEnrollDate;
	}
	public void setMailEnrollDate(String mailEnrollDate) {
		this.mailEnrollDate = mailEnrollDate;
	}
	public String getMailStatus() {
		return mailStatus;
	}
	public void setMailStatus(String mailStatus) {
		this.mailStatus = mailStatus;
	}
	public String getEaSize() {
		return eaSize;
	}
	public void setEaSize(String eaSize) {
		this.eaSize = eaSize;
	}
	public int getMailboxType() {
		return mailboxType;
	}
	public void setMailboxType(int mailboxType) {
		this.mailboxType = mailboxType;
	}
	public String getReceiverType() {
		return receiverType;
	}
	public void setReceiverType(String receiverType) {
		this.receiverType = receiverType;
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
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public AttachmentMail getAttachment() {
		return attachment;
	}
	public void setAttachment(AttachmentMail attachment) {
		this.attachment = attachment;
	}
	@Override
	public String toString() {
		return "Mail [mailNo=" + mailNo + ", empNo=" + empNo + ", receiver=" + receiver + ", cc=" + cc + ", from="
				+ from + ", mailSubject=" + mailSubject + ", mailContent=" + mailContent + ", mailEnrollDate="
				+ mailEnrollDate + ", mailStatus=" + mailStatus + ", eaSize=" + eaSize + ", mailboxType=" + mailboxType
				+ ", receiverType=" + receiverType + ", empName=" + empName + ", positionName=" + positionName
				+ ", read=" + read + ", attachment=" + attachment + "]";
	}
	
	
	
	
	
}