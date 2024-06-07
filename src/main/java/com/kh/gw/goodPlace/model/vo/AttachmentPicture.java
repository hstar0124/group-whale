package com.kh.gw.goodPlace.model.vo;

public class AttachmentPicture implements java.io.Serializable {
	private String attpicNo;
	private String pboardNo;
	private String originName;
	private String changeName;
	
	public AttachmentPicture() {}

	public AttachmentPicture(String attpicNo, String pboardNo, String originName, String changeName) {
		super();
		this.attpicNo = attpicNo;
		this.pboardNo = pboardNo;
		this.originName = originName;
		this.changeName = changeName;
	}

	public String getAttpicNo() {
		return attpicNo;
	}

	public void setAttpicNo(String attpicNo) {
		this.attpicNo = attpicNo;
	}

	public String getPboardNo() {
		return pboardNo;
	}

	public void setPboardNo(String pboardNo) {
		this.pboardNo = pboardNo;
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
		return "AttachmentPicture [attpicNo=" + attpicNo + ", pboardNo=" + pboardNo + ", originName=" + originName
				+ ", changeName=" + changeName + "]";
	}
	
}
