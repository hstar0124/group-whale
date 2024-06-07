package com.kh.gw.todo.model.vo;

public class Folder implements java.io.Serializable {
	
	private String folderNo;
	private String empNo;
	private String folderName;
	private String folderDeleteYN;
	
	public Folder() {}

	public Folder(String folderNo, String empNo, String folderName, String folderDeleteYN) {
		super();
		this.folderNo = folderNo;
		this.empNo = empNo;
		this.folderName = folderName;
		this.folderDeleteYN = folderDeleteYN;
	}

	public String getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(String folderNo) {
		this.folderNo = folderNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public String getFolderDeleteYN() {
		return folderDeleteYN;
	}

	public void setFolderDeleteYN(String folderDeleteYN) {
		this.folderDeleteYN = folderDeleteYN;
	}

	@Override
	public String toString() {
		return "Folder [folderNo=" + folderNo + ", empNo=" + empNo + ", folderName=" + folderName + ", folderDeleteYN="
				+ folderDeleteYN + "]";
	}
}
