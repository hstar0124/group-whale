package com.kh.gw.settings.model.vo;

public class Department {

	private String deptNo;
	private String deptName;
	private String parentDept;
	private String depth;
	
	public Department() {}

	public Department(String deptNo, String deptName, String parentDept, String depth) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.parentDept = parentDept;
		this.depth = depth;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getParentDept() {
		return parentDept;
	}

	public void setParentDept(String parentDept) {
		this.parentDept = parentDept;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "Department [deptNo=" + deptNo + ", deptName=" + deptName + ", parentDept=" + parentDept + ", depth="
				+ depth + "]";
	}	
		
}
