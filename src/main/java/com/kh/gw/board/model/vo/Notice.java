package com.kh.gw.board.model.vo;

import java.security.Timestamp;
import java.sql.Date;

public class Notice implements java.io.Serializable {

	private String nBoardNo;		//게시판번호
	private String nWriter;			//작성자 번호(사원번호)
	private String empName;			//작성자명(작성자명)
	private String empPhoto;
	private String nTitle;			//제목
	private Date nEnrollDate;		//등록일자
	private Date nModifyDate;		//수정일자
	private String nContent;		//내용
	private int nCount;				//조회수
	private String pin;				//상단고정
	private String nStatus;			//삭제여부
	
	public Notice () {}

	public Notice(String nBoardNo, String nWriter, String empName, String empPhoto, String nTitle, Date nEnrollDate,
			Date nModifyDate, String nContent, int nCount, String pin, String nStatus) {
		super();
		this.nBoardNo = nBoardNo;
		this.nWriter = nWriter;
		this.empName = empName;
		this.empPhoto = empPhoto;
		this.nTitle = nTitle;
		this.nEnrollDate = nEnrollDate;
		this.nModifyDate = nModifyDate;
		this.nContent = nContent;
		this.nCount = nCount;
		this.pin = pin;
		this.nStatus = nStatus;
	}

	public String getnBoardNo() {
		return nBoardNo;
	}

	public void setnBoardNo(String nBoardNo) {
		this.nBoardNo = nBoardNo;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
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

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public Date getnEnrollDate() {
		return nEnrollDate;
	}

	public void setnEnrollDate(Date nEnrollDate) {
		this.nEnrollDate = nEnrollDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nBoardNo=" + nBoardNo + ", nWriter=" + nWriter + ", empName=" + empName + ", empPhoto="
				+ empPhoto + ", nTitle=" + nTitle + ", nEnrollDate=" + nEnrollDate + ", nModifyDate=" + nModifyDate
				+ ", nContent=" + nContent + ", nCount=" + nCount + ", pin=" + pin + ", nStatus=" + nStatus + "]";
	}



}