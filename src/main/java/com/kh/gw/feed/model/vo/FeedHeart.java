package com.kh.gw.feed.model.vo;

public class FeedHeart {
	/*FBOARD_NO	VARCHAR2(50 BYTE)
	EMP_NO	VARCHAR2(50 BYTE)*/
	private String feedBoardNo;
	private String heartEmpNo;
	
	public FeedHeart() {}

	public FeedHeart(String feedBoardNo, String heartEmpNo) {
		super();
		this.feedBoardNo = feedBoardNo;
		this.heartEmpNo = heartEmpNo;
	}

	public String getFeedBoardNo() {
		return feedBoardNo;
	}

	public void setFeedBoardNo(String feedBoardNo) {
		this.feedBoardNo = feedBoardNo;
	}

	public String getHeartEmpNo() {
		return heartEmpNo;
	}

	public void setHeartEmpNo(String heartEmpNo) {
		this.heartEmpNo = heartEmpNo;
	}

	@Override
	public String toString() {
		return "FeedHeart [feedBoardNo=" + feedBoardNo + ", heartEmpNo=" + heartEmpNo + "]";
	}
	
	
}
