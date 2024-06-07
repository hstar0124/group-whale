package com.kh.gw.member.model.vo;

public class Position {
	
//	POSITION_NO	VARCHAR2(50 BYTE)
//	POSITION_NAME	VARCHAR2(50 BYTE)
	private String positionNo;
	private String positionName;
	
	public Position() {}
	public Position(String positionNo, String positionName) {
		super();
		this.positionNo = positionNo;
		this.positionName = positionName;
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
	public void setPositionName(String posttionName) {
		this.positionName = posttionName;
	}
	@Override
	public String toString() {
		return "Position [positionNo=" + positionNo + ", posttionName=" + positionName + "]";
	}
	
	

}
