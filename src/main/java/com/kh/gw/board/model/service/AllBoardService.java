package com.kh.gw.board.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.board.model.vo.AllBoard;
import com.kh.gw.board.model.vo.AllBoardReply;
import com.kh.gw.board.model.vo.Attachment;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.SearchCriteria;

public interface AllBoardService {
	
	//전사게시판 작성
	public int insertAllBoardForm(AllBoard allBoard) throws Exception;
	
	//전사게시판 작성(파일첨부)
	public int insertAllBoardForm(AllBoard allBoard,Attachment attachment) throws Exception;
	
	public Attachment selectOneAttachmentBoard(String attachmentNo);
	
	//전사게시판 목록 조회
	public List<AllBoard> selectListAllBoardPaging(PageInfo pi) throws Exception;
	
	//카운트
	public int getListCount() throws Exception;

	//전사게시판 조회
	public Map<String, Object> SelectOneAllBoard(String aBoardNo) throws Exception;
	
	//전사게시판 수정
	public void updateAllBoardForm(AllBoard allBoard) throws Exception;
		
	//전사게시판 삭제
	public void deleteAllBoard(AllBoard allBoard) throws Exception;

	//게시물 갯수
	public int getAllBoardListCount() throws Exception;
	
	// 댓글 조회
	public List<AllBoardReply> readReply(AllBoardReply aReply) throws Exception;
		
	// 댓글 작성
	public int insertReply(AllBoardReply aReply) throws Exception;
		
	// 댓글 수정
	public int updateReply(AllBoardReply allBoardReply) throws Exception;

	// 댓글 삭제
	public int deleteReply(String replyNo) throws Exception;

	

	

}
