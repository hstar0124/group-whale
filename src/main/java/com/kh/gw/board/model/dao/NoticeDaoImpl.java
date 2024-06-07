package com.kh.gw.board.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.board.model.vo.Notice;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.Attachment;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "notice";
	
	//메인보드 공지사항 목록 조회
	public List<Notice> selectListNoticeMain() throws Exception {
		List<Notice> mainList = null;
		
		return sqlSession.selectList(namespace + ".selectListNoticeMain", null);
	}
	
	//공지사항 목록 조회 상단 고정
	public List<Notice> selectListNoticePagingPin() throws Exception {
		List<Notice> listPin = null;
		
		//몇개의 게시물을 건너뛰고 검색할건지 계산
		//int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
				
		//RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList(namespace + ".selectListNoticePagingPin", null);
	}
	
	
	//공지사항 목록 조회
	public List<Notice> selectListNoticePaging(PageInfo pi) throws Exception {

		List<Notice> list = null;
		
		//몇개의 게시물을 건너뛰고 검색할건지 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
				
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList(namespace + ".selectListNoticePaging", null, rowBounds);
		
	}

	//공지사항 총 갯수
	@Override
	public int getListCount() throws Exception {
		return sqlSession.selectOne(namespace + ".selectListNoticeCount");
	}

	//공지사항 작성
	@Override
	public int insertNotice(Notice notice) throws Exception {
		return sqlSession.insert(namespace + ".noticeInsertForm", notice);
	}

	//공지사항 조회
	@Override
	public Notice selectOne(String nBoardNo) throws Exception {
		
		return sqlSession.selectOne(namespace + ".noticeSelectOne", nBoardNo);
	}

	//공지사항 조회수
	@Override
	public void nCount(String nBoardNo) throws Exception {
		sqlSession.update(namespace + ".nCount", nBoardNo);		
	}

	
	//공지사항 수정
	@Override
	public void updateNotice(Notice notice) throws Exception {
		sqlSession.update(namespace + ".noticeUpdate", notice);
	}

	//공지사항 삭제
	@Override
	public void deleteNotice(Notice notice) throws Exception {
		sqlSession.delete(namespace + ".noticeDelete", notice);
	}

	//첨부파일
//	@Override
//	public int insertNoticeAttachment(SqlSessionTemplate sqlSession, Attachment at) {
//
//		return sqlSession.insert(namespace + ".insertNoticeAttachment", at);
//	}
//
//
//	@Override
//	public int deleteNoticeAttachment(SqlSessionTemplate sqlSession, String originPicture) {
//		
//		return sqlSession.delete(namespace + ".deleteNoticeAttachment", originPicture);
//	}

	//공지사항 작성 첨부파일
	@Override
	public int insertNoticeAttachment(Attachment attachment) throws Exception {

//		int result = 0;
//		int length = 0;
//		
//		//for(int i = 0; i < attachment.size(); i++) {
//			int result1 = sqlSession.insert("Attachment.insertNoticeAttachment", attachment.get(i));
//			System.out.println("Dao result1 : " + result1);
//			length += result1;
//		//}
//		
//		if(length == attachment.size()) {
//			result = length;
//			System.out.println("Dao result : " + result);
//			return result;
//		} else {
//			return 0;
//		}
		return sqlSession.insert(namespace + ".insertNoticeAttachment", attachment);
		
	}



}
