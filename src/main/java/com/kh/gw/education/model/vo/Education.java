package com.kh.gw.education.model.vo;

import java.sql.Timestamp;
import java.util.List;

import com.kh.gw.goodPlace.model.vo.ReplyPicture;

public class Education implements java.io.Serializable {
	private String eduNo;
	private String empNo;
	private String empName;
	private String positionName;
	private String eduTitle;
	private String eduContent;
	private int eduCount;
	private Timestamp eduDate;
	private String eduYn;
	private int likeCount;
	private String changeName;
	private List<ReplyEdu> educationReplyList;
	
	public Education() {}

	public Education(String eduNo, String empNo, String empName, String positionName, String eduTitle,
			String eduContent, int eduCount, Timestamp eduDate, String eduYn, int likeCount, String changeName,
			List<ReplyEdu> educationReplyList) {
		super();
		this.eduNo = eduNo;
		this.empNo = empNo;
		this.empName = empName;
		this.positionName = positionName;
		this.eduTitle = eduTitle;
		this.eduContent = eduContent;
		this.eduCount = eduCount;
		this.eduDate = eduDate;
		this.eduYn = eduYn;
		this.likeCount = likeCount;
		this.changeName = changeName;
		this.educationReplyList = educationReplyList;
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

	public String getEduTitle() {
		return eduTitle;
	}

	public void setEduTitle(String eduTitle) {
		this.eduTitle = eduTitle;
	}

	public String getEduContent() {
		return eduContent;
	}

	public void setEduContent(String eduContent) {
		this.eduContent = eduContent;
	}

	public int getEduCount() {
		return eduCount;
	}

	public void setEduCount(int eduCount) {
		this.eduCount = eduCount;
	}

	public Timestamp getEduDate() {
		return eduDate;
	}

	public void setEduDate(Timestamp eduDate) {
		this.eduDate = eduDate;
	}

	public String getEduYn() {
		return eduYn;
	}

	public void setEduYn(String eduYn) {
		this.eduYn = eduYn;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public List<ReplyEdu> getEducationReplyList() {
		return educationReplyList;
	}

	public void setEducationReplyList(List<ReplyEdu> educationReplyList) {
		this.educationReplyList = educationReplyList;
	}

	@Override
	public String toString() {
		return "Education [eduNo=" + eduNo + ", empNo=" + empNo + ", empName=" + empName + ", positionName="
				+ positionName + ", eduTitle=" + eduTitle + ", eduContent=" + eduContent + ", eduCount=" + eduCount
				+ ", eduDate=" + eduDate + ", eduYn=" + eduYn + ", likeCount=" + likeCount + ", changeName="
				+ changeName + ", educationReplyList=" + educationReplyList + "]";
	}

	
}
