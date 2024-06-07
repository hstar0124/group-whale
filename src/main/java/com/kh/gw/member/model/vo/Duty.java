package com.kh.gw.member.model.vo;

public class Duty {
//	DUTY_NO	VARCHAR2(50 BYTE)
//	DUTY_NAME	VARCHAR2(50 BYTE)
	
	private String dutyNo;
	private String dutyName;
	
	public Duty() {}

	public Duty(String dutyNo, String dutyName) {
		super();
		this.dutyNo = dutyNo;
		this.dutyName = dutyName;
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

	@Override
	public String toString() {
		return "Duty [dutyNo=" + dutyNo + ", dutyName=" + dutyName + "]";
	}
	
}
