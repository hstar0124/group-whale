package com.kh.gw.goodPlace.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class PictureBoard implements java.io.Serializable {
	private String pboardNo;
	private String empNo;
	private String title;
	private Timestamp enrollDate;
	private String content;
	private int views;
	private int likes;
	private String changeName;
	private String positionName;
	private String empName;
	private String deptName;
	private String writerPhoto;
	private List<ReplyPicture> pboardReplyList;
	
	public PictureBoard() {}

	public PictureBoard(String pboardNo, String empNo, String title, Timestamp enrollDate, String content, int views,
			int likes, String changeName, String positionName, String empName, String deptName, String writerPhoto,
			List<ReplyPicture> pboardReplyList) {
		super();
		this.pboardNo = pboardNo;
		this.empNo = empNo;
		this.title = title;
		this.enrollDate = enrollDate;
		this.content = content;
		this.views = views;
		this.likes = likes;
		this.changeName = changeName;
		this.positionName = positionName;
		this.empName = empName;
		this.deptName = deptName;
		this.writerPhoto = writerPhoto;
		this.pboardReplyList = pboardReplyList;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getWriterPhoto() {
		return writerPhoto;
	}

	public void setWriterPhoto(String writerPhoto) {
		this.writerPhoto = writerPhoto;
	}

	public List<ReplyPicture> getPboardReplyList() {
		return pboardReplyList;
	}

	public void setPboardReplyList(List<ReplyPicture> pboardReplyList) {
		this.pboardReplyList = pboardReplyList;
	}

	@Override
	public String toString() {
		return "PictureBoard [pboardNo=" + pboardNo + ", empNo=" + empNo + ", title=" + title + ", enrollDate="
				+ enrollDate + ", content=" + content + ", views=" + views + ", likes=" + likes + ", changeName="
				+ changeName + ", positionName=" + positionName + ", empName=" + empName + ", deptName=" + deptName
				+ ", writerPhoto=" + writerPhoto + ", pboardReplyList=" + pboardReplyList + "]";
	}

}
