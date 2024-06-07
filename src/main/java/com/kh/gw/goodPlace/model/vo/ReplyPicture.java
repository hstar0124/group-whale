package com.kh.gw.goodPlace.model.vo;

import java.sql.Timestamp;

public class ReplyPicture implements java.io.Serializable {
	private String preplyNo;
	private String pboardNo;
	private String empNo;
	private String content;
	private Timestamp replyDate;
	private String status;
	private String empName;
	private String positionName;
	private String deptName;
	private String replyPhoto;
	
	public ReplyPicture() {}

	public ReplyPicture(String preplyNo, String pboardNo, String empNo, String content, Timestamp replyDate,
			String status, String empName, String positionName, String deptName, String replyPhoto) {
		super();
		this.preplyNo = preplyNo;
		this.pboardNo = pboardNo;
		this.empNo = empNo;
		this.content = content;
		this.replyDate = replyDate;
		this.status = status;
		this.empName = empName;
		this.positionName = positionName;
		this.deptName = deptName;
		this.replyPhoto = replyPhoto;
	}

	public String getPreplyNo() {
		return preplyNo;
	}

	public void setPreplyNo(String preplyNo) {
		this.preplyNo = preplyNo;
	}

	public String getPboardNo() {
		return pboardNo;
	}

	public void setPboardNo(String pboardNo) {
		this.pboardNo = pboardNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getReplyPhoto() {
		return replyPhoto;
	}

	public void setReplyPhoto(String replyPhoto) {
		this.replyPhoto = replyPhoto;
	}

	@Override
	public String toString() {
		return "ReplyPicture [preplyNo=" + preplyNo + ", pboardNo=" + pboardNo + ", empNo=" + empNo + ", content="
				+ content + ", replyDate=" + replyDate + ", status=" + status + ", empName=" + empName
				+ ", positionName=" + positionName + ", deptName=" + deptName + ", replyPhoto=" + replyPhoto + "]";
	}


}
