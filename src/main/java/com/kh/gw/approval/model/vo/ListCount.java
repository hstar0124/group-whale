package com.kh.gw.approval.model.vo;

public class ListCount implements java.io.Serializable {
	private String empNo;
	private int status;
	
	public ListCount() {}

	public ListCount(String empNo, int status) {
		super();
		this.empNo = empNo;
		this.status = status;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ListCount [empNo=" + empNo + ", status=" + status + "]";
	}
	
	
}
