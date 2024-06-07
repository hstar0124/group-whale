package com.kh.gw.member.model.vo;

import java.sql.Date;

public class UpdateMember {
	
	private String empNo;
	private String empPwd;
	private String empName;
	private Date entryDate;
	private String empEmail;
	private String phone;
	private String zipCode;
	private String address;
	private int empStatus;
	private String dutyNo;
	private String positionNo;
	private String deptNo;
	private String originPicture;
	private String changePicture;
	
	public UpdateMember() {}

	public UpdateMember(String empNo, String empPwd, String empName, Date entryDate, String empEmail, String phone,
			String zipCode, String address, int empStatus, String dutyNo, String positionNo, String deptNo,
			String originPicture, String changePicture) {
		super();
		this.empNo = empNo;
		this.empPwd = empPwd;
		this.empName = empName;
		this.entryDate = entryDate;
		this.empEmail = empEmail;
		this.phone = phone;
		this.zipCode = zipCode;
		this.address = address;
		this.empStatus = empStatus;
		this.dutyNo = dutyNo;
		this.positionNo = positionNo;
		this.deptNo = deptNo;
		this.originPicture = originPicture;
		this.changePicture = changePicture;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
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

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(int empStatus) {
		this.empStatus = empStatus;
	}

	public String getDutyNo() {
		return dutyNo;
	}

	public void setDutyNo(String dutyNo) {
		this.dutyNo = dutyNo;
	}

	public String getPositionNo() {
		return positionNo;
	}

	public void setPositionNo(String positionNo) {
		this.positionNo = positionNo;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getOriginPicture() {
		return originPicture;
	}

	public void setOriginPicture(String originPicture) {
		this.originPicture = originPicture;
	}

	public String getChangePicture() {
		return changePicture;
	}

	public void setChangePicture(String changePicture) {
		this.changePicture = changePicture;
	}

	@Override
	public String toString() {
		return "UpdateMember [empNo=" + empNo + ", empPwd=" + empPwd + ", empName=" + empName + ", entryDate="
				+ entryDate + ", empEmail=" + empEmail + ", phone=" + phone + ", zipCode=" + zipCode + ", address="
				+ address + ", empStatus=" + empStatus + ", dutyNo=" + dutyNo + ", positionNo=" + positionNo
				+ ", deptNo=" + deptNo + ", originPicture=" + originPicture + ", changePicture=" + changePicture + "]";
	}
	

}
