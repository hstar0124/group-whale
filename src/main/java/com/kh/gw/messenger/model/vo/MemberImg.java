package com.kh.gw.messenger.model.vo;

public class MemberImg implements java.io.Serializable {
	private String empNo;
	private String empImg;
	
	public MemberImg() {}

	public MemberImg(String empNo, String empImg) {
		super();
		this.empNo = empNo;
		this.empImg = empImg;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpImg() {
		return empImg;
	}

	public void setEmpImg(String empImg) {
		this.empImg = empImg;
	}

	@Override
	public String toString() {
		return "MemberImg [empNo=" + empNo + ", empImg=" + empImg + "]";
	}
	
	
}
