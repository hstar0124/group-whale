package com.kh.gw.goodPlace.model.vo;

public class LikesPicture implements java.io.Serializable {
	private String pboardNo;
	private String empNo;
	
	public LikesPicture() {}

	public LikesPicture(String pboardNo, String empNo) {
		super();
		this.pboardNo = pboardNo;
		this.empNo = empNo;
	}

	public String getPboardNo() {
		return pboardNo;
	}

	public void setPboardNo(String pboardNo) {
		this.pboardNo = pboardNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "LikesPicture [pboardNo=" + pboardNo + ", empNo=" + empNo + "]";
	}
	
	
}
