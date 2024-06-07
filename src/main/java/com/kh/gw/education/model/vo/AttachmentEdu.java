package com.kh.gw.education.model.vo;

public class AttachmentEdu implements java.io.Serializable {
	private String attachmentNo;
	private String eduNo;
	private String originName;
	private String changeName;
	
	public AttachmentEdu() {}

	public AttachmentEdu(String attachmentNo, String eduNo, String originName, String changeName) {
		super();
		this.attachmentNo = attachmentNo;
		this.eduNo = eduNo;
		this.originName = originName;
		this.changeName = changeName;
	}

	public String getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(String attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public String getEduNo() {
		return eduNo;
	}

	public void setEduNo(String eduNo) {
		this.eduNo = eduNo;
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
		return "AttachmentEdu [attachmentNo=" + attachmentNo + ", eduNo=" + eduNo + ", originName=" + originName
				+ ", changeName=" + changeName + "]";
	}
	
}
