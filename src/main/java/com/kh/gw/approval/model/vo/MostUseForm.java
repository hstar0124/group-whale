package com.kh.gw.approval.model.vo;

public class MostUseForm implements java.io.Serializable {
	private String formNo;
	private String empNo;
	private String formName;
	
	public MostUseForm() {}

	public MostUseForm(String formNo, String empNo, String formName) {
		super();
		this.formNo = formNo;
		this.empNo = empNo;
		this.formName = formName;
	}

	public String getFormNo() {
		return formNo;
	}

	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	@Override
	public String toString() {
		return "MostUseForm [formNo=" + formNo + ", empNo=" + empNo + ", formName=" + formName + "]";
	}

}
