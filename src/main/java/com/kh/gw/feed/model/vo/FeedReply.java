package com.kh.gw.feed.model.vo;

public class FeedReply {
	private String feedReplyNo;
	private String replyFboard;
	private String replyEmpNo;
	private String replyEmpName;
	private String replyEmpPhoto;
	private String replyPositionName;
	private String replyContent;
	private String replyEnrollDate;
	private String replyModifyDate;
	private String replyStatus;
	
	public FeedReply() {}

	public FeedReply(String feedReplyNo, String replyFboard, String replyEmpNo, String replyEmpName,
			String replyEmpPhoto, String replyPositionName, String replyContent, String replyEnrollDate,
			String replyModifyDate, String replyStatus) {
		super();
		this.feedReplyNo = feedReplyNo;
		this.replyFboard = replyFboard;
		this.replyEmpNo = replyEmpNo;
		this.replyEmpName = replyEmpName;
		this.replyEmpPhoto = replyEmpPhoto;
		this.replyPositionName = replyPositionName;
		this.replyContent = replyContent;
		this.replyEnrollDate = replyEnrollDate;
		this.replyModifyDate = replyModifyDate;
		this.replyStatus = replyStatus;
	}

	public String getFeedReplyNo() {
		return feedReplyNo;
	}

	public void setFeedReplyNo(String feedReplyNo) {
		this.feedReplyNo = feedReplyNo;
	}

	public String getReplyFboard() {
		return replyFboard;
	}

	public void setReplyFboard(String replyFboard) {
		this.replyFboard = replyFboard;
	}

	public String getReplyEmpNo() {
		return replyEmpNo;
	}

	public void setReplyEmpNo(String replyEmpNo) {
		this.replyEmpNo = replyEmpNo;
	}

	public String getReplyEmpName() {
		return replyEmpName;
	}

	public void setReplyEmpName(String replyEmpName) {
		this.replyEmpName = replyEmpName;
	}

	public String getReplyEmpPhoto() {
		return replyEmpPhoto;
	}

	public void setReplyEmpPhoto(String replyEmpPhoto) {
		this.replyEmpPhoto = replyEmpPhoto;
	}

	public String getReplyPositionName() {
		return replyPositionName;
	}

	public void setReplyPositionName(String replyPositionName) {
		this.replyPositionName = replyPositionName;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyEnrollDate() {
		return replyEnrollDate;
	}

	public void setReplyEnrollDate(String replyEnrollDate) {
		this.replyEnrollDate = replyEnrollDate;
	}

	public String getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(String replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "FeedReply [feedReplyNo=" + feedReplyNo + ", replyFboard=" + replyFboard + ", replyEmpNo=" + replyEmpNo
				+ ", replyEmpName=" + replyEmpName + ", replyEmpPhoto=" + replyEmpPhoto + ", replyPositionName="
				+ replyPositionName + ", replyContent=" + replyContent + ", replyEnrollDate=" + replyEnrollDate
				+ ", replyModifyDate=" + replyModifyDate + ", replyStatus=" + replyStatus + "]";
	}
	

	
}
