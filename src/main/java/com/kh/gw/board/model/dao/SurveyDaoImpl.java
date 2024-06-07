package com.kh.gw.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.board.model.vo.Notice;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.Survey;
import com.kh.gw.board.model.vo.SurveyAnswer;
import com.kh.gw.board.model.vo.SurveyQuestion;

@Repository
public class SurveyDaoImpl implements SurveyDao{

	private static String namespace = "survey";
	
		//설문 작성
		@Override
		public int insertSurvey(SqlSessionTemplate sqlSession, Survey survey) throws Exception {
			
			return sqlSession.insert(namespace + ".insertSurvey", survey);
		}
		
		//설문 질문 작성
		@Override
		public int insertSurveyQuestion(SqlSessionTemplate sqlSession, SurveyQuestion sq) {

			return sqlSession.insert(namespace + ".insertSurveyQuestion", sq);
		}
		
		//설문 선택 작성
		@Override
		public int insertSurveyAnswer(SqlSessionTemplate sqlSession, SurveyAnswer sa) {

			return sqlSession.insert(namespace + ".insertSurveyAnswer", sa);
		}
	
		//메인보드 설문 목록 작성
		@Override
		public List<Survey> selectListSurveyMain(SqlSessionTemplate sqlSession) throws Exception {
			List<Survey> mainSurveyList = null;
			
			return sqlSession.selectList(namespace + ".selectListSurveyMain", null);
		}

		//설문 목록 조회
		@Override
		public List<Survey> selectListSurveyPaging(SqlSessionTemplate sqlSession, PageInfo pi) throws Exception {

			List<Survey> list3 = null;
			
			//몇개의 게시물을 건너뛰고 검색할건지 계산
			int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
					
			RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
			
			return sqlSession.selectList(namespace + ".selectListSurveyPaging", null, rowBounds);
		}
		
		//설문 목록 조회 카운트
		@Override
		public int getListCount(SqlSessionTemplate sqlSession) throws Exception {
			
			return sqlSession.selectOne(namespace + ".selectListSurveyCount");
			
			
		}
		
		//설문 조회
		@Override
		public Survey SelectOneSurvey(SqlSessionTemplate sqlSession, Survey survey) throws Exception {
			
			return sqlSession.selectOne(namespace + ".selectOneSurvey", survey);
		}
		
		//설문 질문 조회
		@Override
		public List<SurveyQuestion> SelectOneSurveyQuestion(SqlSessionTemplate sqlSession, SurveyQuestion sq) {
			
			return sqlSession.selectList(namespace + ".selectOneSurveyQuestion", sq);
		}
		
		//설문 결과 조회
		@Override
		public List<SurveyAnswer> SelectOneSurveyAnswer(SqlSessionTemplate sqlSession, SurveyAnswer sa) {
					
			return sqlSession.selectList(namespace + ".selectOneSurveyAnswer", sa);
		}
		
		//설문 조회수
		@Override
		public void sCount(SqlSessionTemplate sqlSession, Survey survey) throws Exception {
			sqlSession.update(namespace + ".sCount", survey);
		}

		//설문 마감처리
		@Override
		public void deadLine(SqlSessionTemplate sqlSession, Survey survey) throws Exception {
			sqlSession.update(namespace + ".deadLine", survey);
		}
		
}
