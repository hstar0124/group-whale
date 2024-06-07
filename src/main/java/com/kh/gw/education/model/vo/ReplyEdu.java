package com.kh.gw.education.model.vo;

import java.sql.Timestamp;

public class ReplyEdu implements java.io.Serializable {
	private String replyNo;
	private String eduNo;
	private String empNo;
	private String replyContent;
	private Timestamp replyDate;
	private String replyYn;
	private String empName;
	private String positionName;
	private String deptName;
	private String replyPhoto;
	
	public ReplyEdu() {}

	public ReplyEdu(String replyNo, String eduNo, String empNo, String replyContent, Timestamp replyDate,
			String replyYn, String empName, String positionName, String deptName, String replyPhoto) {
		super();
		this.replyNo = replyNo;
		this.eduNo = eduNo;
		this.empNo = empNo;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyYn = replyYn;
		this.empName = empName;
		this.positionName = positionName;
		this.deptName = deptName;
		this.replyPhoto = replyPhoto;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getEduNo() {
		return eduNo;
	}

	public void setEduNo(String eduNo) {
		this.eduNo = eduNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyYn() {
		return replyYn;
	}

	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
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
		return "ReplyEdu [replyNo=" + replyNo + ", eduNo=" + eduNo + ", empNo=" + empNo + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + ", replyYn=" + replyYn + ", empName=" + empName
				+ ", positionName=" + positionName + ", deptName=" + deptName + ", replyPhoto=" + replyPhoto + "]";
	}

}
