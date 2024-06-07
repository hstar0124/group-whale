package com.kh.gw.member.model.vo;

public class ChangePwd {
	
	private String empNo;
	private String changePwd;
	
	public ChangePwd() {}

	public ChangePwd(String empNo, String changePwd) {
		this.empNo = empNo;
		this.changePwd = changePwd;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getChangePwd() {
		return changePwd;
	}

	public void setChangePwd(String changePwd) {
		this.changePwd = changePwd;
	}

	@Override
	public String toString() {
		return "ChangePwd [empNo=" + empNo + ", changePwd=" + changePwd + "]";
	}
	
}
