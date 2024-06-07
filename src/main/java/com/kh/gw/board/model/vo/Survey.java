package com.kh.gw.board.model.vo;

import java.sql.Date;

public class Survey implements java.io.Serializable {

//	SURVEY_NO
//	EMP_NO
//	STITLE
//	SCONTENT
//	SENROLL_DATE
//	SMODIFY_DATE
//	START_DATE
//	END_DATE
//	MULTI_SELECT
//	END_STATUS
//	SSTATUS
	
	private String surveyNo;		//설문 번호
	private String sWriter;			//작성자 번호(사원번호)
	private String empName;			//작성자명(작성자명)
	private String empPhoto;
	private String sTitle;			//제목
	private String sContent;		//내용
	private Date sEnrollDate;		//등록일자
	private Date sModifyDate;		//수정일자
	private Date startDate;			//설문시작일자
	private Date endDate;			//설문종료일자
	private String multiSelect;		//복수 선택
	private String endStatus;		//마감여부
	private String sStatus;			//삭제여부
	private int sCount;				//조회수
	private Date surveyJoinDate;	//설문 참여일
	
	public Survey() {}

	public Survey(String surveyNo, String sWriter, String empName, String empPhoto, String sTitle, String sContent,
			Date sEnrollDate, Date sModifyDate, Date startDate, Date endDate, String multiSelect, String endStatus,
			String sStatus, int sCount, Date surveyJoinDate) {
		super();
		this.surveyNo = surveyNo;
		this.sWriter = sWriter;
		this.empName = empName;
		this.empPhoto = empPhoto;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sEnrollDate = sEnrollDate;
		this.sModifyDate = sModifyDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.multiSelect = multiSelect;
		this.endStatus = endStatus;
		this.sStatus = sStatus;
		this.sCount = sCount;
		this.surveyJoinDate = surveyJoinDate;
	}

	public String getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(String surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getsWriter() {
		return sWriter;
	}

	public void setsWriter(String sWriter) {
		this.sWriter = sWriter;
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

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public Date getsEnrollDate() {
		return sEnrollDate;
	}

	public void setsEnrollDate(Date sEnrollDate) {
		this.sEnrollDate = sEnrollDate;
	}

	public Date getsModifyDate() {
		return sModifyDate;
	}

	public void setsModifyDate(Date sModifyDate) {
		this.sModifyDate = sModifyDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getMultiSelect() {
		return multiSelect;
	}

	public void setMultiSelect(String multiSelect) {
		this.multiSelect = multiSelect;
	}

	public String getEndStatus() {
		return endStatus;
	}

	public void setEndStatus(String endStatus) {
		this.endStatus = endStatus;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	public Date getSurveyJoinDate() {
		return surveyJoinDate;
	}

	public void setSurveyJoinDate(Date surveyJoinDate) {
		this.surveyJoinDate = surveyJoinDate;
	}

	@Override
	public String toString() {
		return "Survey [surveyNo=" + surveyNo + ", sWriter=" + sWriter + ", empName=" + empName + ", empPhoto="
				+ empPhoto + ", sTitle=" + sTitle + ", sContent=" + sContent + ", sEnrollDate=" + sEnrollDate
				+ ", sModifyDate=" + sModifyDate + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", multiSelect=" + multiSelect + ", endStatus=" + endStatus + ", sStatus=" + sStatus + ", sCount="
				+ sCount + ", surveyJoinDate=" + surveyJoinDate + "]";
	}

	
	
}
