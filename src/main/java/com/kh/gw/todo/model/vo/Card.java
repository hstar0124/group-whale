package com.kh.gw.todo.model.vo;

import java.sql.Date;

public class Card implements java.io.Serializable {
	
	private String folderNo;
	private String cardNo;
	private String listNo;
	private String cardCreateEmpNo;
	private String inchargeEmpNo;
	private String cardTitle;
	private String description;
	private String dueDate;
	private String cardDeleteYN;
	
	//담당자 사진
	private String changeName;
	
	public Card() {}

	public Card(String folderNo, String cardNo, String listNo, String cardCreateEmpNo, String inchargeEmpNo,
			String cardTitle, String description, String dueDate, String cardDeleteYN, String changeName) {
		super();
		this.folderNo = folderNo;
		this.cardNo = cardNo;
		this.listNo = listNo;
		this.cardCreateEmpNo = cardCreateEmpNo;
		this.inchargeEmpNo = inchargeEmpNo;
		this.cardTitle = cardTitle;
		this.description = description;
		this.dueDate = dueDate;
		this.cardDeleteYN = cardDeleteYN;
		this.changeName = changeName;
	}

	public String getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(String folderNo) {
		this.folderNo = folderNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getListNo() {
		return listNo;
	}

	public void setListNo(String listNo) {
		this.listNo = listNo;
	}

	public String getCardCreateEmpNo() {
		return cardCreateEmpNo;
	}

	public void setCardCreateEmpNo(String cardCreateEmpNo) {
		this.cardCreateEmpNo = cardCreateEmpNo;
	}

	public String getInchargeEmpNo() {
		return inchargeEmpNo;
	}

	public void setInchargeEmpNo(String inchargeEmpNo) {
		this.inchargeEmpNo = inchargeEmpNo;
	}

	public String getCardTitle() {
		return cardTitle;
	}

	public void setCardTitle(String cardTitle) {
		this.cardTitle = cardTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getCardDeleteYN() {
		return cardDeleteYN;
	}

	public void setCardDeleteYN(String cardDeleteYN) {
		this.cardDeleteYN = cardDeleteYN;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "Card [folderNo=" + folderNo + ", cardNo=" + cardNo + ", listNo=" + listNo + ", cardCreateEmpNo="
				+ cardCreateEmpNo + ", inchargeEmpNo=" + inchargeEmpNo + ", cardTitle=" + cardTitle + ", description="
				+ description + ", dueDate=" + dueDate + ", cardDeleteYN=" + cardDeleteYN + ", changeName=" + changeName
				+ "]";
	}
}
