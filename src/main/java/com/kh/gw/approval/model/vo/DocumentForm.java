package com.kh.gw.approval.model.vo;

public class DocumentForm {
	private String formNo;
	private String cboxNo;
	private String cboxName;
	private String formName;
	private String formContent;
	private int formTerm;
	private int formDelegate;
	private int formUse;
	
	public DocumentForm() {}

	public DocumentForm(String formNo, String cboxNo, String cboxName, String formName, String formContent,
			int formTerm, int formDelegate, int formUse) {
		super();
		this.formNo = formNo;
		this.cboxNo = cboxNo;
		this.cboxName = cboxName;
		this.formName = formName;
		this.formContent = formContent;
		this.formTerm = formTerm;
		this.formDelegate = formDelegate;
		this.formUse = formUse;
	}

	public String getFormNo() {
		return formNo;
	}

	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}

	public String getCboxNo() {
		return cboxNo;
	}

	public void setCboxNo(String cboxNo) {
		this.cboxNo = cboxNo;
	}

	public String getCboxName() {
		return cboxName;
	}

	public void setCboxName(String cboxName) {
		this.cboxName = cboxName;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public String getFormContent() {
		return formContent;
	}

	public void setFormContent(String formContent) {
		this.formContent = formContent;
	}

	public int getFormTerm() {
		return formTerm;
	}

	public void setFormTerm(int formTerm) {
		this.formTerm = formTerm;
	}

	public int getFormDelegate() {
		return formDelegate;
	}

	public void setFormDelegate(int formDelegate) {
		this.formDelegate = formDelegate;
	}

	public int getFormUse() {
		return formUse;
	}

	public void setFormUse(int formUse) {
		this.formUse = formUse;
	}

	@Override
	public String toString() {
		return "DocumentForm [formNo=" + formNo + ", cboxNo=" + cboxNo + ", cboxName=" + cboxName + ", formName="
				+ formName + ", formContent=" + formContent + ", formTerm=" + formTerm + ", formDelegate="
				+ formDelegate + ", formUse=" + formUse + "]";
	}

	
}
