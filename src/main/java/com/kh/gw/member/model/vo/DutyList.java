package com.kh.gw.member.model.vo;

public class DutyList {

	private String dutyNo;
	private String dutyName;
	private String count;
	
	public DutyList() {}
	public DutyList(String dutyNo, String dutyName, String count) {
		super();
		this.dutyNo = dutyNo;
		this.dutyName = dutyName;
		this.count = count;
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
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "DutyList [dutyNo=" + dutyNo + ", dutyName=" + dutyName + ", count=" + count + "]";
	}
	
	
	
}
