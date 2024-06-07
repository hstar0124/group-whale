package com.kh.gw.mail.model.vo;

public class searchCondition implements java.io.Serializable{

	private String subject;
	private String content;
	public searchCondition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public searchCondition(String subject, String content) {
		super();
		this.subject = subject;
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "searchCondition [subject=" + subject + ", content=" + content + "]";
	}
	
	
}
