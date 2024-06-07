package com.kh.gw.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.Survey;
import com.kh.gw.board.model.vo.SurveyAnswer;
import com.kh.gw.board.model.vo.SurveyQuestion;

public interface SurveyDao {
	
		//설문 작성
		public int insertSurvey(SqlSessionTemplate sqlSession, Survey survey) throws Exception;
		
		//메인보드 설문 목록 조회
		public List<Survey> selectListSurveyMain(SqlSessionTemplate sqlSession) throws Exception;
		
		//설문 목록 조회
		public List<Survey> selectListSurveyPaging(SqlSessionTemplate sqlSession, PageInfo pi) throws Exception;
		
		//설문 목록 조회 페이징
		public int getListCount(SqlSessionTemplate sqlSession) throws Exception;
		
		//설문 조회
		public Survey SelectOneSurvey(SqlSessionTemplate sqlSession, Survey survey) throws Exception;
		
		//설문 조회수
		void sCount(SqlSessionTemplate sqlSession, Survey survey) throws Exception;

//------------------------------------------------------------------------------------------------------

		//설문 질문 작성
		public int insertSurveyQuestion(SqlSessionTemplate sqlSession, SurveyQuestion sq);
		//public int insertSurveyQuestion(SqlSessionTemplate sqlSession, List<SurveyQuestion> list4) throws Exception;

		//설문 선택 작성
		public int insertSurveyAnswer(SqlSessionTemplate sqlSession, SurveyAnswer sa);
		
		//설문 질문 조회
		public List<SurveyQuestion> SelectOneSurveyQuestion(SqlSessionTemplate sqlSession, SurveyQuestion sq);
		
		//설문 결과 조회
		public List<SurveyAnswer> SelectOneSurveyAnswer(SqlSessionTemplate sqlSession, SurveyAnswer sa) throws Exception;

		//설문 마감처리
		public void deadLine(SqlSessionTemplate sqlSession, Survey survey) throws Exception;
}
