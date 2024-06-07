package com.kh.gw.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.board.model.vo.SurveyQuestion;

@Repository
public class SurveyQuestionDapImpl implements SurveyQuestionDao{

	private static String namespace = "Survey";

	
	/*
	 * @Override public int insertSurveyQuestion(SqlSessionTemplate sqlSession,
	 * List<SurveyQuestion> list4) throws Exception { return
	 * sqlSession.insert(namespace + ".insertSurveyQuestion", list4); }
	 */
	
	
	
	
//	@Override
//	public int insertSurveyQuestion(SqlSessionTemplate sqlSession, SurveyQuestion sQuestionContent) {
//		// TODO Auto-generated method stub
//		return sqlSession.insert(namespace + ".insertSurveyQuestion", sQuestionContent);
//	}
//
//
//	@Override
//	public List<SurveyQuestion> SelectOneSurveyQuestion(SqlSessionTemplate sqlSession, SurveyQuestion sq) {
//		
//		return sqlSession.selectList(namespace + ".selectOneSurveyQuestion", sq);
//	}

}
