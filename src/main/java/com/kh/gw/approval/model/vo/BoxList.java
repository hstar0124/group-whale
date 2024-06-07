package com.kh.gw.approval.model.vo;

import java.sql.Timestamp;

public class BoxList implements java.io.Serializable {
	private String docNo; //문서번호
	private Timestamp enrollDate; //기안일
	private String formName; //결재양식
	private int docUrgent;	//긴급여부
	private String docTitle;	//제목
	private int fileCount;	//첨부파일 수
	private String empName;	//기안자
	private int docStatus;	//문서상태
	private Timestamp appDate; //결재일
	private String completeDate; //완료일
	private int perKind; //구분 (0 : 열람, 1: 참조)
	private int num; //ROWNUM
	
	public BoxList() {}

	public BoxList(String docNo, Timestamp enrollDate, String formName, int docUrgent, String docTitle, int fileCount,
			String empName, int docStatus, Timestamp appDate, String completeDate, int perKind, int num) {
		super();
		this.docNo = docNo;
		this.enrollDate = enrollDate;
		this.formName = formName;
		this.docUrgent = docUrgent;
		this.docTitle = docTitle;
		this.fileCount = fileCount;
		this.empName = empName;
		this.docStatus = docStatus;
		this.appDate = appDate;
		this.completeDate = completeDate;
		this.perKind = perKind;
		this.num = num;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public Timestamp getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public int getDocUrgent() {
		return docUrgent;
	}

	public void setDocUrgent(int docUrgent) {
		this.docUrgent = docUrgent;
	}

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getDocStatus() {
		return docStatus;
	}

	public void setDocStatus(int docStatus) {
		this.docStatus = docStatus;
	}

	public Timestamp getAppDate() {
		return appDate;
	}

	public void setAppDate(Timestamp appDate) {
		this.appDate = appDate;
	}

	public String getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}

	public int getPerKind() {
		return perKind;
	}

	public void setPerKind(int perKind) {
		this.perKind = perKind;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "BoxList [docNo=" + docNo + ", enrollDate=" + enrollDate + ", formName=" + formName + ", docUrgent="
				+ docUrgent + ", docTitle=" + docTitle + ", fileCount=" + fileCount + ", empName=" + empName
				+ ", docStatus=" + docStatus + ", appDate=" + appDate + ", completeDate=" + completeDate + ", perKind="
				+ perKind + ", num=" + num + "]";
	}

}
