package com.kh.gw.approval.model.vo;

public class AttachmentApp implements java.io.Serializable {
	private String attachmentNo;
	private String docNo;
	private String filePath;
	private String fileSize;
	private String originName;
	private String changeName;
	
	public AttachmentApp() {}

	public AttachmentApp(String attachmentNo, String docNo, String filePath, String fileSize, String originName,
			String changeName) {
		super();
		this.attachmentNo = attachmentNo;
		this.docNo = docNo;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.originName = originName;
		this.changeName = changeName;
	}

	public String getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(String attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
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

	@Override
	public String toString() {
		return "AttachmentApp [attachmentNo=" + attachmentNo + ", docNo=" + docNo + ", filePath=" + filePath
				+ ", fileSize=" + fileSize + ", originName=" + originName + ", changeName=" + changeName + "]";
	}
	
	
}
