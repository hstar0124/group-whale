package com.kh.gw.club.model.vo;

public class ClubMember implements java.io.Serializable {
	
	private String memberNo;
	private String clubNo;
	private String empNo;
	private String changeName;
	private String empName;
	private String positionName;
	private int totalMember;
	
	public ClubMember() {}

	public ClubMember(String memberNo, String clubNo, String empNo, String changeName, String empName,
			String positionName, int totalMember) {
		super();
		this.memberNo = memberNo;
		this.clubNo = clubNo;
		this.empNo = empNo;
		this.changeName = changeName;
		this.empName = empName;
		this.positionName = positionName;
		this.totalMember = totalMember;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getClubNo() {
		return clubNo;
	}

	public void setClubNo(String clubNo) {
		this.clubNo = clubNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public int getTotalMember() {
		return totalMember;
	}

	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}

	@Override
	public String toString() {
		return "ClubMember [memberNo=" + memberNo + ", clubNo=" + clubNo + ", empNo=" + empNo + ", changeName="
				+ changeName + ", empName=" + empName + ", positionName=" + positionName + ", totalMember="
				+ totalMember + "]";
	}
}
