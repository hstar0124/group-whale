package com.kh.gw.approval.model.vo;

public class Peruse implements java.io.Serializable {
	private String perNo;
	private String docNo;
	private int perKind;
	private int perType;
	private String empNo;
	private String deptNo;
	private String empName;
	private String positionName;
	private String readStatus;
	
	public Peruse() {}

	public Peruse(String perNo, String docNo, int perKind, int perType, String empNo, String deptNo, String empName,
			String positionName, String readStatus) {
		super();
		this.perNo = perNo;
		this.docNo = docNo;
		this.perKind = perKind;
		this.perType = perType;
		this.empNo = empNo;
		this.deptNo = deptNo;
		this.empName = empName;
		this.positionName = positionName;
		this.readStatus = readStatus;
	}

	public String getPerNo() {
		return perNo;
	}

	public void setPerNo(String perNo) {
		this.perNo = perNo;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public int getPerKind() {
		return perKind;
	}

	public void setPerKind(int perKind) {
		this.perKind = perKind;
	}

	public int getPerType() {
		return perType;
	}

	public void setPerType(int perType) {
		this.perType = perType;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
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

	public String getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
	}

	@Override
	public String toString() {
		return "Peruse [perNo=" + perNo + ", docNo=" + docNo + ", perKind=" + perKind + ", perType=" + perType
				+ ", empNo=" + empNo + ", deptNo=" + deptNo + ", empName=" + empName + ", positionName=" + positionName
				+ ", readStatus=" + readStatus + "]";
	}

}
