package com.kh.gw.todo.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable {
	
	private String attachNo;
	private String cardNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String attachDeleteYN;
	private String fileSize;
	
	public Attachment() {}

	public Attachment(String attachNo, String cardNo, String originName, String changeName, String filePath,
			Date uploadDate, String attachDeleteYN, String fileSize) {
		super();
		this.attachNo = attachNo;
		this.cardNo = cardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.attachDeleteYN = attachDeleteYN;
		this.fileSize = fileSize;
	}

	public String getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(String attachNo) {
		this.attachNo = attachNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getAttachDeleteYN() {
		return attachDeleteYN;
	}

	public void setAttachDeleteYN(String attachDeleteYN) {
		this.attachDeleteYN = attachDeleteYN;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "Attachment [attachNo=" + attachNo + ", cardNo=" + cardNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", attachDeleteYN=" + attachDeleteYN + ", fileSize=" + fileSize + "]";
	}

}
