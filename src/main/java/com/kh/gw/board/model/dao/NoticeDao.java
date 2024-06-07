package com.kh.gw.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.board.model.vo.Notice;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.board.model.vo.Attachment;

public interface NoticeDao {

	/**
     * 게시물 리스트 조회
     * @param boardVO
     * @return
     * @throws Exception
     */

	//메인보드 공지사항 목록 조회
	public List<Notice> selectListNoticeMain() throws Exception;
	
	//공지사항 목록 조회 상단 고정
	public List<Notice> selectListNoticePagingPin( ) throws Exception;
	
	//공지사항 목록 조회
	public List<Notice> selectListNoticePaging(PageInfo pi) throws Exception;

	//공지사항 총 갯수
	public int getListCount() throws Exception;
	
	//공지사항 작성
	public int insertNotice(Notice notice) throws Exception;
	
	//공지사항 조회
	public Notice selectOne(String nBoardNo) throws Exception;

	//공지사항 조회수
	public void nCount(String nBoardNo) throws Exception;
	
	//공지사항 수정
	public void updateNotice(Notice notice) throws Exception;
	
	//공지사항 삭제
	public void deleteNotice(Notice notice) throws Exception;

	//공지사항 작성 첨부파일
	public int insertNoticeAttachment(Attachment attachment) throws Exception;

	//int insertNoticeAttachment(SqlSessionTemplate sqlSession, Attachment at);

	//int deleteNoticeAttachment(SqlSessionTemplate sqlSession, String originPicture);

	
}
