package com.kh.gw.approval.model.vo;

import java.sql.Timestamp;

public class ApprovalVo implements java.io.Serializable {
	private String appNo;
	private String docNo;
	private int appType;
	private int appResult;
	private String appOpinion;
	private Timestamp appDate;
	private String empNo;
	private String absenceStatus;
	private String autEmpNo;
	private String lineNo;
	private String empName;
	private String deptName;
	private String positionName;
	private String autEmpName;
	private String autDeptName;
	private String autPositionName;
	
	public ApprovalVo() {}

	public ApprovalVo(String appNo, String docNo, int appType, int appResult, String appOpinion, Timestamp appDate,
			String empNo, String absenceStatus, String autEmpNo, String lineNo, String empName, String deptName,
			String positionName, String autEmpName, String autDeptName, String autPositionName) {
		super();
		this.appNo = appNo;
		this.docNo = docNo;
		this.appType = appType;
		this.appResult = appResult;
		this.appOpinion = appOpinion;
		this.appDate = appDate;
		this.empNo = empNo;
		this.absenceStatus = absenceStatus;
		this.autEmpNo = autEmpNo;
		this.lineNo = lineNo;
		this.empName = empName;
		this.deptName = deptName;
		this.positionName = positionName;
		this.autEmpName = autEmpName;
		this.autDeptName = autDeptName;
		this.autPositionName = autPositionName;
	}

	public String getAppNo() {
		return appNo;
	}

	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public int getAppType() {
		return appType;
	}

	public void setAppType(int appType) {
		this.appType = appType;
	}

	public int getAppResult() {
		return appResult;
	}

	public void setAppResult(int appResult) {
		this.appResult = appResult;
	}

	public String getAppOpinion() {
		return appOpinion;
	}

	public void setAppOpinion(String appOpinion) {
		this.appOpinion = appOpinion;
	}

	public Timestamp getAppDate() {
		return appDate;
	}

	public void setAppDate(Timestamp appDate) {
		this.appDate = appDate;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getAbsenceStatus() {
		return absenceStatus;
	}

	public void setAbsenceStatus(String absenceStatus) {
		this.absenceStatus = absenceStatus;
	}

	public String getAutEmpNo() {
		return autEmpNo;
	}

	public void setAutEmpNo(String autEmpNo) {
		this.autEmpNo = autEmpNo;
	}

	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getAutEmpName() {
		return autEmpName;
	}

	public void setAutEmpName(String autEmpName) {
		this.autEmpName = autEmpName;
	}

	public String getAutDeptName() {
		return autDeptName;
	}

	public void setAutDeptName(String autDeptName) {
		this.autDeptName = autDeptName;
	}

	public String getAutPositionName() {
		return autPositionName;
	}

	public void setAutPositionName(String autPositionName) {
		this.autPositionName = autPositionName;
	}

	@Override
	public String toString() {
		return "ApprovalVo [appNo=" + appNo + ", docNo=" + docNo + ", appType=" + appType + ", appResult=" + appResult
				+ ", appOpinion=" + appOpinion + ", appDate=" + appDate + ", empNo=" + empNo + ", absenceStatus="
				+ absenceStatus + ", autEmpNo=" + autEmpNo + ", lineNo=" + lineNo + ", empName=" + empName
				+ ", deptName=" + deptName + ", positionName=" + positionName + ", autEmpName=" + autEmpName
				+ ", autDeptName=" + autDeptName + ", autPositionName=" + autPositionName + "]";
	}

}
