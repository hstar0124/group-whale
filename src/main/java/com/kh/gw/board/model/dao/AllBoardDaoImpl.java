package com.kh.gw.board.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.board.model.vo.AllBoard;
import com.kh.gw.board.model.vo.AllBoardReply;
import com.kh.gw.board.model.vo.Attachment;
import com.kh.gw.board.model.vo.Notice;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.SearchCriteria;

@Repository
public class AllBoardDaoImpl implements AllBoardDao{
	
	@Inject
	private SqlSession sqlSession;
	
	//private static String namespace = "AllBoard";

	//전사게시판 작성
	@Override
	public int insertAllBoardForm(SqlSessionTemplate sqlSession,AllBoard allBoard) throws Exception {
		
		return sqlSession.insert("AllBoard.insertAllBoardForm", allBoard);
	}
	
	//전사게시판 첨부파일
	@Override
	public int insertAllBoardFormFile(SqlSessionTemplate sqlSession, Attachment attachment) {

		System.out.println("dao att : " + attachment);
		return sqlSession.insert("AllBoard.insertAttachment", attachment);
	}
	
	//전사게시판 목록 조회
	@Override
	public List<AllBoard> selectListAllBoardPaging(PageInfo pi) throws Exception {

		List<AllBoard> list2 = null;
		
		//몇개의 게시물을 건너뛰고 검색할건지 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
				
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("AllBoard.selectListAllBoardPaging", null, rowBounds);
	}
	
	//전사게시판 목록 조회 카운트
	@Override
	public int getListCount() {
			
		return sqlSession.selectOne("AllBoard.selectListAllBoardCount");
	}

	//전사게시판 조회
	@Override
	public AllBoard SelectOneAllBoard(String aBoardNo) throws Exception {
		
		//System.out.println(aBoardNo);
		return sqlSession.selectOne("AllBoard.selectOneAllBoard", aBoardNo);
	}
	
	//전사게시판 조회(첨부파일)
	@Override
	public Attachment SelectOneFile(String aBoardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AllBoard.selectOneAttachment", aBoardNo);
	}
	//다운로드
	@Override
	public Attachment selectOneAttachmentBoard(SqlSessionTemplate sqlSession, String attachmentNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AllBoard.selectOneAttachmentDown", attachmentNo);
	}
	
	//전사게시판 조회수
	@Override
	public void aCount(String aBoardNo) throws Exception {
		sqlSession.update("AllBoard.aCount", aBoardNo);
	}

	//전사게시판 수정
	@Override
	public void updateAllBoardForm(AllBoard allBoard) throws Exception {
		sqlSession.update("AllBoard.updateAllBoard", allBoard);
	}

	//전사게시판 삭제
	@Override
	public void deleteAllBoard(AllBoard allBoard) throws Exception {
		sqlSession.delete("AllBoard.deleteAllBoard", allBoard);
	}

	//게시물 갯수
	@Override
	public int getAllBoardListCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AllBoard.getAllBoardListCount");
	}
	
	//private static String namespace = "AllBoardReply";
	
	// 댓글 조회
	@Override
	public List<AllBoardReply> readReply(SqlSessionTemplate sqlSession, AllBoardReply aReply) throws Exception {
		return sqlSession.selectList("AllBoardReply.AllBoardReadReply", aReply);
		
	}

	// 댓글 작성
	@Override
	public int insertReply(SqlSessionTemplate sqlSession, AllBoardReply aReply) throws Exception {
		return sqlSession.insert("AllBoardReply.AllBoardInsertReply", aReply);
	}

	//댓글 수정
	@Override
	public int updateReply(SqlSessionTemplate sqlSession, AllBoardReply allBoardReply) throws Exception {
		return sqlSession.update("AllBoardReply.AllBoardUpdateReply", allBoardReply);
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, String replyNo) throws Exception {
		return sqlSession.delete("AllBoardReply.AllBoardDeleteReply", replyNo);
	}





}
