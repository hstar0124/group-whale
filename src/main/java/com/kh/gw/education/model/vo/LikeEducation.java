package com.kh.gw.education.model.vo;

import java.io.Serializable;

public class LikeEducation implements Serializable{
	private String eduNo;
	private String empNo;
	
	public LikeEducation() {}

	public LikeEducation(String eduNo, String empNo) {
		super();
		this.eduNo = eduNo;
		this.empNo = empNo;
	}

	public String getEduNo() {
		return eduNo;
	}

	public void setEduNo(String eduNo) {
		this.eduNo = eduNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "LikeEducation [eduNo=" + eduNo + ", empNo=" + empNo + "]";
	}
	
	
	
}
