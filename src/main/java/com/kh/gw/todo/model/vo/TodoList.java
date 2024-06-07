package com.kh.gw.todo.model.vo;

public class TodoList implements java.io.Serializable {
	
	private String listNo;
	private String folderNo;
	private String listCreateEmpNo;
	private String listTitle;
	private String listDeleteYN;
	
	public TodoList() {}

	public TodoList(String listNo, String folderNo, String listCreateEmpNo, String listTitle, String listDeleteYN) {
		super();
		this.listNo = listNo;
		this.folderNo = folderNo;
		this.listCreateEmpNo = listCreateEmpNo;
		this.listTitle = listTitle;
		this.listDeleteYN = listDeleteYN;
	}

	public String getListNo() {
		return listNo;
	}

	public void setListNo(String listNo) {
		this.listNo = listNo;
	}

	public String getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(String folderNo) {
		this.folderNo = folderNo;
	}

	public String getListCreateEmpNo() {
		return listCreateEmpNo;
	}

	public void setListCreateEmpNo(String listCreateEmpNo) {
		this.listCreateEmpNo = listCreateEmpNo;
	}

	public String getListTitle() {
		return listTitle;
	}

	public void setListTitle(String listTitle) {
		this.listTitle = listTitle;
	}

	public String getListDeleteYN() {
		return listDeleteYN;
	}

	public void setListDeleteYN(String listDeleteYN) {
		this.listDeleteYN = listDeleteYN;
	}

	@Override
	public String toString() {
		return "List [listNo=" + listNo + ", folderNo=" + folderNo + ", listCreateEmpNo=" + listCreateEmpNo
				+ ", listTitle=" + listTitle + ", listDeleteYN=" + listDeleteYN + "]";
	}

	
}
