package com.kh.gw.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class AllBoard implements java.io.Serializable {
	
	private String aBoardNo;		//게시판번호
	private String aWriter;			//작성자 번호(사원번호)
	private String empName;			//작성자명(작성자명)
	private String empPhoto;
	private String aTitle;			//제목
	private Date aEnrollDate;		//등록일자
	private Date aModifyDate;		//수정일자
	private String aContent;		//내용
	private int aCount;				//조회수
	private String aStatus;			//삭제여부
	private ArrayList<AllBoardReply> replyList;
	
	public AllBoard() {}

	public AllBoard(String aBoardNo, String aWriter, String empName, String empPhoto, String aTitle, Date aEnrollDate,
			Date aModifyDate, String aContent, int aCount, String aStatus, ArrayList<AllBoardReply> replyList) {
		super();
		this.aBoardNo = aBoardNo;
		this.aWriter = aWriter;
		this.empName = empName;
		this.empPhoto = empPhoto;
		this.aTitle = aTitle;
		this.aEnrollDate = aEnrollDate;
		this.aModifyDate = aModifyDate;
		this.aContent = aContent;
		this.aCount = aCount;
		this.aStatus = aStatus;
		this.replyList = replyList;
	}

	public String getaBoardNo() {
		return aBoardNo;
	}

	public void setaBoardNo(String aBoardNo) {
		this.aBoardNo = aBoardNo;
	}

	public String getaWriter() {
		return aWriter;
	}

	public void setaWriter(String aWriter) {
		this.aWriter = aWriter;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpPhoto() {
		return empPhoto;
	}

	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}

	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}

	public Date getaEnrollDate() {
		return aEnrollDate;
	}

	public void setaEnrollDate(Date aEnrollDate) {
		this.aEnrollDate = aEnrollDate;
	}

	public Date getaModifyDate() {
		return aModifyDate;
	}

	public void setaModifyDate(Date aModifyDate) {
		this.aModifyDate = aModifyDate;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public int getaCount() {
		return aCount;
	}

	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public ArrayList<AllBoardReply> getReplyList() {
		return replyList;
	}

	public void setReplyList(ArrayList<AllBoardReply> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "AllBoard [aBoardNo=" + aBoardNo + ", aWriter=" + aWriter + ", empName=" + empName + ", empPhoto="
				+ empPhoto + ", aTitle=" + aTitle + ", aEnrollDate=" + aEnrollDate + ", aModifyDate=" + aModifyDate
				+ ", aContent=" + aContent + ", aCount=" + aCount + ", aStatus=" + aStatus + ", replyList=" + replyList
				+ "]";
	}
	
	
	
}