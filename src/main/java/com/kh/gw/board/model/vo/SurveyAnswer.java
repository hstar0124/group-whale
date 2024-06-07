package com.kh.gw.board.model.vo;

import java.sql.Date;

public class SurveyAnswer implements java.io.Serializable {
//	SURVEY_NO
//	SURVEY_QUESTION_NO
//	EMP_NO
//	SURVEY_JOIN_DATE
	
	private String surveyNo;				//설문 번호
	private String surveyQuestionNo;		//질문 번호
	private String surveyQuestionContent;	//질문 내용
	private String sEmpNo;					//설문 응답자 번호
	private String sEmpName;				//설문 응답자 이름
	private Date surveyJoinDate;			//설문 참여일
	
	public SurveyAnswer() {}

	public SurveyAnswer(String surveyNo, String surveyQuestionNo, String surveyQuestionContent, String sEmpNo,
			String sEmpName, Date surveyJoinDate) {
		super();
		this.surveyNo = surveyNo;
		this.surveyQuestionNo = surveyQuestionNo;
		this.surveyQuestionContent = surveyQuestionContent;
		this.sEmpNo = sEmpNo;
		this.sEmpName = sEmpName;
		this.surveyJoinDate = surveyJoinDate;
	}

	public String getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(String surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getSurveyQuestionNo() {
		return surveyQuestionNo;
	}

	public void setSurveyQuestionNo(String surveyQuestionNo) {
		this.surveyQuestionNo = surveyQuestionNo;
	}

	public String getSurveyQuestionContent() {
		return surveyQuestionContent;
	}

	public void setSurveyQuestionContent(String surveyQuestionContent) {
		this.surveyQuestionContent = surveyQuestionContent;
	}

	public String getsEmpNo() {
		return sEmpNo;
	}

	public void setsEmpNo(String sEmpNo) {
		this.sEmpNo = sEmpNo;
	}

	public String getsEmpName() {
		return sEmpName;
	}

	public void setsEmpName(String sEmpName) {
		this.sEmpName = sEmpName;
	}

	public Date getSurveyJoinDate() {
		return surveyJoinDate;
	}

	public void setSurveyJoinDate(Date surveyJoinDate) {
		this.surveyJoinDate = surveyJoinDate;
	}

	@Override
	public String toString() {
		return "SurveyAnswer [surveyNo=" + surveyNo + ", surveyQuestionNo=" + surveyQuestionNo
				+ ", surveyQuestionContent=" + surveyQuestionContent + ", sEmpNo=" + sEmpNo + ", sEmpName=" + sEmpName
				+ ", surveyJoinDate=" + surveyJoinDate + "]";
	}


		
}
