package com.kh.gw.settings.model.vo;

public class MemberDto {

//	EMP_NO
//  EMP_NAME
//  EMP_EMAIL
//  PHONE
//  DECODE(EMP_STATUS, '1', '재직', '2', '휴직', '3', '퇴사') "재직여부"
//  DUTY_NAME
//  POSITION_NAME
//  DEPT_NAME
	
	private String empNo;
	private String empName;
	private String empEmail;
	private String phone;
	private String status;
	private String dutyNo;
	private String dutyName;
	private String positionNo;
	private String positionName;
	private String deptNo;
	private String deptName;
	
	public MemberDto() {}

	public MemberDto(String empNo, String empName, String empEmail, String phone, String status, String dutyNo,
			String dutyName, String positionNo, String positionName, String deptNo, String deptName) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.empEmail = empEmail;
		this.phone = phone;
		this.status = status;
		this.dutyNo = dutyNo;
		this.dutyName = dutyName;
		this.positionNo = positionNo;
		this.positionName = positionName;
		this.deptNo = deptNo;
		this.deptName = deptName;
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

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
		return "MemberDto [empNo=" + empNo + ", empName=" + empName + ", empEmail=" + empEmail + ", phone=" + phone
				+ ", status=" + status + ", dutyNo=" + dutyNo + ", dutyName=" + dutyName + ", positionNo=" + positionNo
				+ ", positionName=" + positionName + ", deptNo=" + deptNo + ", deptName=" + deptName + "]";
	}
	
	
	
}
