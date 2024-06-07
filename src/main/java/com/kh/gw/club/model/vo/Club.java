package com.kh.gw.club.model.vo;

import java.sql.Date;

public class Club implements java.io.Serializable  {

	private String clubNo;
	private String masterEmpNo;
	private String clubName;
	private Date enrollDate;
	private String deleteYN;
	private int totalMember;
	private int totalPost;
	private String empName;

	public Club() {}

	public Club(String clubNo, String masterEmpNo, String clubName, Date enrollDate, String deleteYN, int totalMember,
			int totalPost, String empName) {
		super();
		this.clubNo = clubNo;
		this.masterEmpNo = masterEmpNo;
		this.clubName = clubName;
		this.enrollDate = enrollDate;
		this.deleteYN = deleteYN;
		this.totalMember = totalMember;
		this.totalPost = totalPost;
		this.empName = empName;
	}

	public String getClubNo() {
		return clubNo;
	}

	public void setClubNo(String clubNo) {
		this.clubNo = clubNo;
	}

	public String getMasterEmpNo() {
		return masterEmpNo;
	}

	public void setMasterEmpNo(String masterEmpNo) {
		this.masterEmpNo = masterEmpNo;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	public int getTotalMember() {
		return totalMember;
	}

	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}

	public int getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "Club [clubNo=" + clubNo + ", masterEmpNo=" + masterEmpNo + ", clubName=" + clubName + ", enrollDate="
				+ enrollDate + ", deleteYN=" + deleteYN + ", totalMember=" + totalMember + ", totalPost=" + totalPost
				+ ", empName=" + empName + "]";
	}
}
