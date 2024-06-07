package com.kh.gw.settings.model.vo;

import java.sql.Date;

public class MoveDepartment {
//	DEPT_HISTORY_NO	VARCHAR2(50 BYTE)
//	EMP_NO	VARCHAR2(50 BYTE)
//	ORIGIN_DEP	VARCHAR2(50 BYTE)
//	CHANGE_DEP	VARCHAR2(50 BYTE)
//	DEPT_CHANGE_DATE	DATE
	
	private String deptHistoryNo;
	private String empNo;
	private String originDep;
	private String changeDep;
	private Date deptChangeDate;
	
	public MoveDepartment() {}
	
	public MoveDepartment(String deptHistoryNo, String empNo, String originDep, String changeDep, Date deptChangeDate) {
		super();
		this.deptHistoryNo = deptHistoryNo;
		this.empNo = empNo;
		this.originDep = originDep;
		this.changeDep = changeDep;
		this.deptChangeDate = deptChangeDate;
	}

	public String getDeptHistoryNo() {
		return deptHistoryNo;
	}

	public void setDeptHistoryNo(String deptHistoryNo) {
		this.deptHistoryNo = deptHistoryNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getOriginDep() {
		return originDep;
	}

	public void setOriginDep(String originDep) {
		this.originDep = originDep;
	}

	public String getChangeDep() {
		return changeDep;
	}

	public void setChangeDep(String changeDep) {
		this.changeDep = changeDep;
	}

	public Date getDeptChangeDate() {
		return deptChangeDate;
	}

	public void setDeptChangeDate(Date deptChangeDate) {
		this.deptChangeDate = deptChangeDate;
	}

	@Override
	public String toString() {
		return "MoveDepartment [deptHistoryNo=" + deptHistoryNo + ", empNo=" + empNo + ", originDep=" + originDep
				+ ", changeDep=" + changeDep + ", deptChangeDate=" + deptChangeDate + "]";
	}
	
	
	
}
