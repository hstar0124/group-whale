package com.kh.gw.todo.model.vo;

public class Checklist implements java.io.Serializable {
	
	private String checklistNo;
	private String cardNo;
	private String checklistContent;
	private String checkYN;
	private String checklistDeleteYN;
	
	public Checklist() {}

	public Checklist(String checklistNo, String cardNo, String checklistContent, String checkYN,
			String checklistDeleteYN) {
		super();
		this.checklistNo = checklistNo;
		this.cardNo = cardNo;
		this.checklistContent = checklistContent;
		this.checkYN = checkYN;
		this.checklistDeleteYN = checklistDeleteYN;
	}

	public String getChecklistNo() {
		return checklistNo;
	}

	public void setChecklistNo(String checklistNo) {
		this.checklistNo = checklistNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getChecklistContent() {
		return checklistContent;
	}

	public void setChecklistContent(String checklistContent) {
		this.checklistContent = checklistContent;
	}

	public String getCheckYN() {
		return checkYN;
	}

	public void setCheckYN(String checkYN) {
		this.checkYN = checkYN;
	}

	public String getChecklistDeleteYN() {
		return checklistDeleteYN;
	}

	public void setChecklistDeleteYN(String checklistDeleteYN) {
		this.checklistDeleteYN = checklistDeleteYN;
	}

	@Override
	public String toString() {
		return "Checklist [checklistNo=" + checklistNo + ", cardNo=" + cardNo + ", checklistContent=" + checklistContent
				+ ", checkYN=" + checkYN + ", checklistDeleteYN=" + checklistDeleteYN + "]";
	}
}
