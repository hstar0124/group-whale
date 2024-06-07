package com.kh.gw.approval.model.vo;

import java.sql.Timestamp;

import org.mybatis.spring.SqlSessionTemplate;

public class ApprovalDocument implements java.io.Serializable {
	private String docNo;
	private String formNo;
	private String lineNo;
	private String docName;
	private String docTitle;
	private String docContent;
	private int docStatus;
	private int docDelete;
	private Timestamp enrollDate;
	private String draftDeptNo;
	private String deptName;
	private int docUrgent;
	private int docDelegate;
	private String empNo;
	private String empName;
	private String draftOpinion;
	private String formName;
	private String positionName;
	
	
	public ApprovalDocument() {}


	public ApprovalDocument(String docNo, String formNo, String lineNo, String docName, String docTitle,
			String docContent, int docStatus, int docDelete, Timestamp enrollDate, String draftDeptNo, String deptName,
			int docUrgent, int docDelegate, String empNo, String empName, String draftOpinion, String formName,
			String positionName) {
		super();
		this.docNo = docNo;
		this.formNo = formNo;
		this.lineNo = lineNo;
		this.docName = docName;
		this.docTitle = docTitle;
		this.docContent = docContent;
		this.docStatus = docStatus;
		this.docDelete = docDelete;
		this.enrollDate = enrollDate;
		this.draftDeptNo = draftDeptNo;
		this.deptName = deptName;
		this.docUrgent = docUrgent;
		this.docDelegate = docDelegate;
		this.empNo = empNo;
		this.empName = empName;
		this.draftOpinion = draftOpinion;
		this.formName = formName;
		this.positionName = positionName;
	}


	public String getDocNo() {
		return docNo;
	}


	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}


	public String getFormNo() {
		return formNo;
	}


	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}


	public String getLineNo() {
		return lineNo;
	}


	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}


	public String getDocName() {
		return docName;
	}


	public void setDocName(String docName) {
		this.docName = docName;
	}


	public String getDocTitle() {
		return docTitle;
	}


	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}


	public String getDocContent() {
		return docContent;
	}


	public void setDocContent(String docContent) {
		this.docContent = docContent;
	}


	public int getDocStatus() {
		return docStatus;
	}


	public void setDocStatus(int docStatus) {
		this.docStatus = docStatus;
	}


	public int getDocDelete() {
		return docDelete;
	}


	public void setDocDelete(int docDelete) {
		this.docDelete = docDelete;
	}


	public Timestamp getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getDraftDeptNo() {
		return draftDeptNo;
	}


	public void setDraftDeptNo(String draftDeptNo) {
		this.draftDeptNo = draftDeptNo;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public int getDocUrgent() {
		return docUrgent;
	}


	public void setDocUrgent(int docUrgent) {
		this.docUrgent = docUrgent;
	}


	public int getDocDelegate() {
		return docDelegate;
	}


	public void setDocDelegate(int docDelegate) {
		this.docDelegate = docDelegate;
	}


	public String getEmpNo() {
		return empNo;
	}


	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public String getDraftOpinion() {
		return draftOpinion;
	}


	public void setDraftOpinion(String draftOpinion) {
		this.draftOpinion = draftOpinion;
	}


	public String getFormName() {
		return formName;
	}


	public void setFormName(String formName) {
		this.formName = formName;
	}


	public String getPositionName() {
		return positionName;
	}


	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}


	@Override
	public String toString() {
		return "ApprovalDocument [docNo=" + docNo + ", formNo=" + formNo + ", lineNo=" + lineNo + ", docName=" + docName
				+ ", docTitle=" + docTitle + ", docContent=" + docContent + ", docStatus=" + docStatus + ", docDelete="
				+ docDelete + ", enrollDate=" + enrollDate + ", draftDeptNo=" + draftDeptNo + ", deptName=" + deptName
				+ ", docUrgent=" + docUrgent + ", docDelegate=" + docDelegate + ", empNo=" + empNo + ", empName="
				+ empName + ", draftOpinion=" + draftOpinion + ", formName=" + formName + ", positionName="
				+ positionName + "]";
	}


}
