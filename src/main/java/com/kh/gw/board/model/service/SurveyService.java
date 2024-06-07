package com.kh.gw.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.Survey;
import com.kh.gw.board.model.vo.SurveyAnswer;
import com.kh.gw.board.model.vo.SurveyQuestion;

public interface SurveyService {

	//메인보드 설문 목록 조회
	List<Survey> selectListSurveyMain() throws Exception;
	
	//설문 작성
	public int insertSurvey(Survey survey) throws Exception;
	
	//설문 질문 작성 
	public int insertSurveyQuestion(SurveyQuestion sq);
	
	//설문 선택 작성
	public int insertSurveyAnswer(SurveyAnswer sa);
		
	//설문 목록 조회
	List<Survey> selectListSurveyPaging(PageInfo pi) throws Exception;

	//설문 목록 조회 카운트
	public int getListCount() throws Exception;

	//설문 조회
	public Survey SelectOneSurvey(Survey survey) throws Exception;

	//설문 질문 조회
	public List<SurveyQuestion> SelectOneSurveyQuestion(SurveyQuestion sq) throws Exception;
	
	//설문 결과 조회
	public List<SurveyAnswer> SelectOneSurveyAnswer(SurveyAnswer sa) throws Exception;

	//설문 마감처리
	public void deadLine(Survey survey) throws Exception;

}
