package com.kh.gw.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.board.model.vo.AllBoard;
import com.kh.gw.board.model.vo.AllBoardReply;
import com.kh.gw.board.model.vo.Attachment;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.SearchCriteria;

public interface AllBoardDao {
	/**
     * 게시물 리스트 조회
     * @param boardVO
     * @return
     * @throws Exception
     */
	
	//전사게시판 작성
	public int insertAllBoardForm(SqlSessionTemplate sqlSession,AllBoard allBoard) throws Exception;

	//전사게시판 작성(첨부파일)
	public int insertAllBoardFormFile(SqlSessionTemplate sqlSession, Attachment attachment) throws Exception;
	
	//전사게시판 목록 조회
	public List<AllBoard> selectListAllBoardPaging(PageInfo pi) throws Exception;
	
	//전사게시판 목록 조회 페이징
	public int getListCount() throws Exception;
	
	//전사게시판 조회
	public AllBoard SelectOneAllBoard(String aBoardNo) throws Exception;
	
	//공지사항 조회수
	public void aCount(String aBoardNo) throws Exception;
		
	//전사게시판 수정
	public void updateAllBoardForm(AllBoard allBoard) throws Exception;
	
	//전사게시판 삭제
	public void deleteAllBoard(AllBoard allBoard) throws Exception;

	//게시물 갯수
	public int getAllBoardListCount() throws Exception;
	
	// 댓글 조회
	public List<AllBoardReply> readReply(SqlSessionTemplate sqlSession, AllBoardReply aReply) throws Exception;
	
	// 댓글 작성
	public int insertReply(SqlSessionTemplate sqlSession, AllBoardReply aReply) throws Exception;

	// 댓글 수정
	public int updateReply(SqlSessionTemplate sqlSession, AllBoardReply allBoardReply) throws Exception;
	
	// 댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession,String replyNo) throws Exception;

	public Attachment SelectOneFile(String aBoardNo);

	public Attachment selectOneAttachmentBoard(SqlSessionTemplate sqlSession, String attachmentNo);
	
}
