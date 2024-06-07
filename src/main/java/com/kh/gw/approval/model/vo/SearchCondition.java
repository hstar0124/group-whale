package com.kh.gw.approval.model.vo;

public class SearchCondition implements java.io.Serializable {
	private String title;
	private String form;
	private String writer;
	private String empNo;
	
	public SearchCondition() {}

	public SearchCondition(String title, String form, String writer, String empNo) {
		super();
		this.title = title;
		this.form = form;
		this.writer = writer;
		this.empNo = empNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "SearchCondition [title=" + title + ", form=" + form + ", writer=" + writer + ", empNo=" + empNo + "]";
	}

}
