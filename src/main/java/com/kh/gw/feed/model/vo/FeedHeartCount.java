package com.kh.gw.feed.model.vo;

public class FeedHeartCount {
	private String feedBoardNo;
	private String heartCount;
	
	public FeedHeartCount() {}

	public FeedHeartCount(String feedBoardNo, String heartCount) {
		super();
		this.feedBoardNo = feedBoardNo;
		this.heartCount = heartCount;
	}

	public String getFeedBoardNo() {
		return feedBoardNo;
	}

	public void setFeedBoardNo(String feedBoardNo) {
		this.feedBoardNo = feedBoardNo;
	}

	public String getHeartCount() {
		return heartCount;
	}

	public void setHeartCount(String heartCount) {
		this.heartCount = heartCount;
	}

	@Override
	public String toString() {
		return "FeedHeartCount [feedBoardNo=" + feedBoardNo + ", heartCount=" + heartCount + "]";
	}
	
	
}
