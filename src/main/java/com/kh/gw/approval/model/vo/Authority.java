package com.kh.gw.approval.model.vo;

import java.sql.Date;

public class Authority implements java.io.Serializable {
	private String autNo;
	private String docNo;
	private String startDate;
	private String endDate;
	private String absenceReason;
	private int autStatus;
	private String rejectReason;
	private String autEmpNo;
	private String empNo;
	private String autEmpName;
	private String positionName;
	
	public Authority() {}

	public Authority(String autNo, String docNo, String startDate, String endDate, String absenceReason, int autStatus,
			String rejectReason, String autEmpNo, String empNo, String autEmpName, String positionName) {
		super();
		this.autNo = autNo;
		this.docNo = docNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.absenceReason = absenceReason;
		this.autStatus = autStatus;
		this.rejectReason = rejectReason;
		this.autEmpNo = autEmpNo;
		this.empNo = empNo;
		this.autEmpName = autEmpName;
		this.positionName = positionName;
	}

	public String getAutNo() {
		return autNo;
	}

	public void setAutNo(String autNo) {
		this.autNo = autNo;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getAbsenceReason() {
		return absenceReason;
	}

	public void setAbsenceReason(String absenceReason) {
		this.absenceReason = absenceReason;
	}

	public int getAutStatus() {
		return autStatus;
	}

	public void setAutStatus(int autStatus) {
		this.autStatus = autStatus;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public String getAutEmpNo() {
		return autEmpNo;
	}

	public void setAutEmpNo(String autEmpNo) {
		this.autEmpNo = autEmpNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getAutEmpName() {
		return autEmpName;
	}

	public void setAutEmpName(String autEmpName) {
		this.autEmpName = autEmpName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	@Override
	public String toString() {
		return "Authority [autNo=" + autNo + ", docNo=" + docNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", absenceReason=" + absenceReason + ", autStatus=" + autStatus + ", rejectReason=" + rejectReason
				+ ", autEmpNo=" + autEmpNo + ", empNo=" + empNo + ", autEmpName=" + autEmpName + ", positionName="
				+ positionName + "]";
	}


}
