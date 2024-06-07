package com.kh.gw.approval.model.vo;

public class ApprovalStep implements java.io.Serializable {
	private String stepNo;
	private String lineNo;
	private int stepNum;
	private int stepType;
	private String empNo;
	private int agreeMethod;
	private String empName;
	private String positionName;
	private String deptName;
	
	public ApprovalStep() {}

	public ApprovalStep(String stepNo, String lineNo, int stepNum, int stepType, String empNo, int agreeMethod,
			String empName, String positionName, String deptName) {
		super();
		this.stepNo = stepNo;
		this.lineNo = lineNo;
		this.stepNum = stepNum;
		this.stepType = stepType;
		this.empNo = empNo;
		this.agreeMethod = agreeMethod;
		this.empName = empName;
		this.positionName = positionName;
		this.deptName = deptName;
	}

	public String getStepNo() {
		return stepNo;
	}

	public void setStepNo(String stepNo) {
		this.stepNo = stepNo;
	}

	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}

	public int getStepNum() {
		return stepNum;
	}

	public void setStepNum(int stepNum) {
		this.stepNum = stepNum;
	}

	public int getStepType() {
		return stepType;
	}

	public void setStepType(int stepType) {
		this.stepType = stepType;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public int getAgreeMethod() {
		return agreeMethod;
	}

	public void setAgreeMethod(int agreeMethod) {
		this.agreeMethod = agreeMethod;
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "ApprovalStep [stepNo=" + stepNo + ", lineNo=" + lineNo + ", stepNum=" + stepNum + ", stepType="
				+ stepType + ", empNo=" + empNo + ", agreeMethod=" + agreeMethod + ", empName=" + empName
				+ ", positionName=" + positionName + ", deptName=" + deptName + "]";
	}

	
}
