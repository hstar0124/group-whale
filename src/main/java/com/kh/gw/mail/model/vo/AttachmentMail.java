package com.kh.gw.mail.model.vo;

public class AttachmentMail implements java.io.Serializable{
	private String eaNo;
	private String mailNo;
	private String originName;
	private String changeName;
	private String eaSize;
	private String filePath;
	public AttachmentMail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AttachmentMail(String eaNo, String mailNo, String originName, String changeName, String eaSize,
			String filePath) {
		super();
		this.eaNo = eaNo;
		this.mailNo = mailNo;
		this.originName = originName;
		this.changeName = changeName;
		this.eaSize = eaSize;
		this.filePath = filePath;
	}
	public String getEaNo() {
		return eaNo;
	}
	public void setEaNo(String eaNo) {
		this.eaNo = eaNo;
	}
	public String getMailNo() {
		return mailNo;
	}
	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
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
	public String getEaSize() {
		return eaSize;
	}
	public void setEaSize(String eaSize) {
		this.eaSize = eaSize;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "Attachment [eaNo=" + eaNo + ", mailNo=" + mailNo + ", originName=" + originName + ", changeName="
				+ changeName + ", eaSize=" + eaSize + ", filePath=" + filePath + "]";
	}
	
	
}
