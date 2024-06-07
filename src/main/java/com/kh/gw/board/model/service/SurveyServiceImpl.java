package com.kh.gw.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.board.model.dao.SurveyDao;
import com.kh.gw.board.model.dao.SurveyQuestionDao;
import com.kh.gw.board.model.vo.AllBoard;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.Survey;
import com.kh.gw.board.model.vo.SurveyAnswer;
import com.kh.gw.board.model.vo.SurveyQuestion;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SurveyDao sd;

	//설문 작성
	@Override
	public int insertSurvey(Survey survey) throws Exception {

		//System.out.println("service의 insertSurvey list4 : " + list4);
		return sd.insertSurvey(sqlSession, survey);
	}	

	//설문 질문 작성
	@Override
	public int insertSurveyQuestion(SurveyQuestion sq) {

		return sd.insertSurveyQuestion(sqlSession, sq); 
	}

	//설문 선택 작성
	@Override
	public int insertSurveyAnswer(SurveyAnswer sa) {
		
		return sd.insertSurveyAnswer(sqlSession, sa);
	}

	//메인보드 설문 목록 조회
	@Override
	public List<Survey> selectListSurveyMain() throws Exception {

		return sd.selectListSurveyMain(sqlSession);
	}
	
	//설문 목록 조회
	@Override
	public List<Survey> selectListSurveyPaging(PageInfo pi) throws Exception {

		return sd.selectListSurveyPaging(sqlSession, pi);
	}

	//설문 목록 조회 카운트
	@Override
	public int getListCount() throws Exception {

		return sd.getListCount(sqlSession);
	}

	//설문 조회
	@Override
	public Survey SelectOneSurvey(Survey survey) throws Exception {
		sd.sCount(sqlSession, survey);
		return sd.SelectOneSurvey(sqlSession, survey);
	}
	
	//설문 질문 조회
	@Override
	public List<SurveyQuestion> SelectOneSurveyQuestion(SurveyQuestion sq) throws Exception {
		
		return sd.SelectOneSurveyQuestion(sqlSession, sq);
	}

	//설문 질문 조회
	@Override
	public List<SurveyAnswer> SelectOneSurveyAnswer(SurveyAnswer sa) throws Exception {
	
		return sd.SelectOneSurveyAnswer(sqlSession, sa);
	}

	//설문 마감처리
	@Override
	public void deadLine(Survey survey) throws Exception {

		sd.deadLine(sqlSession, survey);
	}

}