package com.kh.gw.todo.model.vo;

public class Member implements java.io.Serializable {
	
	private String folderNo;
	private String memberEmpNo;
	private String folderName;
	private String memberNo;
	//프로필사진
	private String changeName;
	private String empName;
	private String positionName;
	
	public Member() {}

	public Member(String folderNo, String memberEmpNo, String folderName, String memberNo, String changeName,
			String empName, String positionName) {
		super();
		this.folderNo = folderNo;
		this.memberEmpNo = memberEmpNo;
		this.folderName = folderName;
		this.memberNo = memberNo;
		this.changeName = changeName;
		this.empName = empName;
		this.positionName = positionName;
	}

	public String getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(String folderNo) {
		this.folderNo = folderNo;
	}

	public String getMemberEmpNo() {
		return memberEmpNo;
	}

	public void setMemberEmpNo(String memberEmpNo) {
		this.memberEmpNo = memberEmpNo;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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

	@Override
	public String toString() {
		return "Member [folderNo=" + folderNo + ", memberEmpNo=" + memberEmpNo + ", folderName=" + folderName
				+ ", memberNo=" + memberNo + ", changeName=" + changeName + ", empName=" + empName + ", positionName="
				+ positionName + "]";
	}

}
