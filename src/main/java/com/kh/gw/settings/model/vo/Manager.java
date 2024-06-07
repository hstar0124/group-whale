package com.kh.gw.settings.model.vo;

public class Manager {

    private String managerNo;
	private String empNo;
	private String empName;
	private String dutyNo;
	private String dutyName;
	private String positionNo;
	private String positionName;
	private String deptNo;
	private String deptName;
	
	public Manager() {}

	public Manager(String mangerNo, String empNo, String empName, String dutyNo, String dutyName, String positionNo,
			String positionName, String deptNo, String deptName) {
		super();
		this.managerNo = mangerNo;
		this.empNo = empNo;
		this.empName = empName;
		this.dutyNo = dutyNo;
		this.dutyName = dutyName;
		this.positionNo = positionNo;
		this.positionName = positionName;
		this.deptNo = deptNo;
		this.deptName = deptName;
	}

	public String getMangerNo() {
		return managerNo;
	}

	public void setMangerNo(String mangerNo) {
		this.managerNo = mangerNo;
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

	public String getDutyNo() {
		return dutyNo;
	}

	public void setDutyNo(String dutyNo) {
		this.dutyNo = dutyNo;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	public String getPositionNo() {
		return positionNo;
	}

	public void setPositionNo(String positionNo) {
		this.positionNo = positionNo;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "Manager [mangerNo=" + managerNo + ", empNo=" + empNo + ", empName=" + empName + ", dutyNo=" + dutyNo
				+ ", dutyName=" + dutyName + ", positionNo=" + positionNo + ", positionName=" + positionName
				+ ", deptNo=" + deptNo + ", deptName=" + deptName + "]";
	}
	
}
