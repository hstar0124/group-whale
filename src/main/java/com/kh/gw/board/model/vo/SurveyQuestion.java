package com.kh.gw.board.model.vo;

public class SurveyQuestion implements java.io.Serializable {
//	SURVEY_NO
//	SURVEY_QUESTION_NO
//	SURVEY_QUESTION_CONTENT
	
	private String surveyNo;				//설문 번호
	private String surveyQuestionNo;		//질문 번호
	private String surveyQuestionContent;	//질문 내용
	
	public SurveyQuestion() {}

	public SurveyQuestion(String surveyNo, String surveyQuestionNo, String surveyQuestionContent) {
		super();
		this.surveyNo = surveyNo;
		this.surveyQuestionNo = surveyQuestionNo;
		this.surveyQuestionContent = surveyQuestionContent;
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

	@Override
	public String toString() {
		return "SurveyQuestion [surveyNo=" + surveyNo + ", surveyQuestionNo=" + surveyQuestionNo
				+ ", surveyQuestionContent=" + surveyQuestionContent + "]";
	}
	
	
}
