package com.kh.gw.messenger.model.vo;

import java.sql.Date;

public class AttachmentMs implements java.io.Serializable {
//	ATTACHMENT_NO	VARCHAR2(50 BYTE)	첨부파일번호
//	MESSAGE_NO		VARCHAR2(50 BYTE)	메시지번호
//	ORIGIN_NAME		VARCHAR2(200 BYTE)	원본파일명
//	CHANGE_NAME		VARCHAR2(200 BYTE)	저장된파일명
//	FILE_PATH		VARCHAR2(200 BYTE)	파일경로
//	UPLOAD_DATE		DATE				등록일
//	DELETE_YN		VARCHAR2(10 BYTE)	삭제여부(Y : 미삭제 N : 삭제)

	private String attachmentNo; 
	private String messageNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String deleteYn;
	
	public AttachmentMs() {}

	public AttachmentMs(String attachmentNo, String messageNo, String originName, String changeName, String filePath,
			Date uploadDate, String deleteYn) {
		super();
		this.attachmentNo = attachmentNo;
		this.messageNo = messageNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.deleteYn = deleteYn;
	}

	public String getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(String attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public String getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(String messageNo) {
		this.messageNo = messageNo;
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

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	@Override
	public String toString() {
		return "Attachment_MS [attachmentNo=" + attachmentNo + ", messageNo=" + messageNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", deleteYn="
				+ deleteYn + "]";
	}
	
	
}
