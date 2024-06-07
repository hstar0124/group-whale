package com.kh.gw.messenger.model.vo;

public class Thema implements java.io.Serializable {
//	THEMA_NO	VARCHAR2(50 BYTE)	테마번호
//	THEMA_COLOR	VARCHAR2(100 BYTE)	지정한테마색상
//	EMP_NO		VARCHAR2(50 BYTE)	사원번호

	private String themaNo;
	private String themaColor;
	private String empNo;
	
	public Thema() {}

	public Thema(String themaNo, String themaColor, String empNo) {
		super();
		this.themaNo = themaNo;
		this.themaColor = themaColor;
		this.empNo = empNo;
	}

	public String getThemaNo() {
		return themaNo;
	}

	public void setThemaNo(String themaNo) {
		this.themaNo = themaNo;
	}

	public String getThemaColor() {
		return themaColor;
	}

	public void setThemaColor(String themaColor) {
		this.themaColor = themaColor;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "Thema [themaNo=" + themaNo + ", themaColor=" + themaColor + ", empNo=" + empNo + "]";
	}
	
	
}
