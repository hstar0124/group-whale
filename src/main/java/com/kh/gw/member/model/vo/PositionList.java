package com.kh.gw.member.model.vo;

public class PositionList {

	private String positionNo;
	private String positionName;
	private String count;
	
	public PositionList() {}
	public PositionList(String positionNo, String positionName, String count) {
		super();
		this.positionNo = positionNo;
		this.positionName = positionName;
		this.count = count;
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
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "PositionList [positionNo=" + positionNo + ", positionName=" + positionName + ", count=" + count + "]";
	}
	
	
	
}
