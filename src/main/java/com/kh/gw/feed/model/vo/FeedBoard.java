package com.kh.gw.feed.model.vo;

import java.sql.Date;
import java.util.List;

public class FeedBoard {
	
	private String fboardNo;
	private String empNo;
	private String empName;
	private String photo;
	private String positioName;
	private Date feedEnrollDate;
	private Date feedModifyDate;
	private String feedContent;
	private String feedCount;
	private String feedStatus;
	private List<FeedReply> feedReplyList;
	private List<Attachment> feedAttachmentList;
	
	public FeedBoard() {}

	public FeedBoard(String fboardNo, String empNo, String empName, String photo, String positioName,
			Date feedEnrollDate, Date feedModifyDate, String feedContent, String feedCount, String feedStatus,
			List<FeedReply> feedReplyList, List<Attachment> feedAttachmentList) {
		super();
		this.fboardNo = fboardNo;
		this.empNo = empNo;
		this.empName = empName;
		this.photo = photo;
		this.positioName = positioName;
		this.feedEnrollDate = feedEnrollDate;
		this.feedModifyDate = feedModifyDate;
		this.feedContent = feedContent;
		this.feedCount = feedCount;
		this.feedStatus = feedStatus;
		this.feedReplyList = feedReplyList;
		this.feedAttachmentList = feedAttachmentList;
	}

	public String getFboardNo() {
		return fboardNo;
	}

	public void setFboardNo(String fboardNo) {
		this.fboardNo = fboardNo;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPositioName() {
		return positioName;
	}

	public void setPositioName(String positioName) {
		this.positioName = positioName;
	}

	public Date getFeedEnrollDate() {
		return feedEnrollDate;
	}

	public void setFeedEnrollDate(Date feedEnrollDate) {
		this.feedEnrollDate = feedEnrollDate;
	}

	public Date getFeedModifyDate() {
		return feedModifyDate;
	}

	public void setFeedModifyDate(Date feedModifyDate) {
		this.feedModifyDate = feedModifyDate;
	}

	public String getFeedContent() {
		return feedContent;
	}

	public void setFeedContent(String feedContent) {
		this.feedContent = feedContent;
	}

	public String getFeedCount() {
		return feedCount;
	}

	public void setFeedCount(String feedCount) {
		this.feedCount = feedCount;
	}

	public String getFeedStatus() {
		return feedStatus;
	}

	public void setFeedStatus(String feedStatus) {
		this.feedStatus = feedStatus;
	}

	public List<FeedReply> getFeedReplyList() {
		return feedReplyList;
	}

	public void setFeedReplyList(List<FeedReply> feedReplyList) {
		this.feedReplyList = feedReplyList;
	}

	public List<Attachment> getFeedAttachmentList() {
		return feedAttachmentList;
	}

	public void setFeedAttachmentList(List<Attachment> feedAttachmentList) {
		this.feedAttachmentList = feedAttachmentList;
	}

	@Override
	public String toString() {
		return "FeedBoard [fboardNo=" + fboardNo + ", empNo=" + empNo + ", empName=" + empName + ", photo=" + photo
				+ ", positioName=" + positioName + ", feedEnrollDate=" + feedEnrollDate + ", feedModifyDate="
				+ feedModifyDate + ", feedContent=" + feedContent + ", feedCount=" + feedCount + ", feedStatus="
				+ feedStatus + ", feedReplyList=" + feedReplyList + ", feedAttachmentList=" + feedAttachmentList + "]";
	}
	
	
}
