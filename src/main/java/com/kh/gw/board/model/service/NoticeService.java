package com.kh.gw.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.board.model.vo.Attachment;
import com.kh.gw.board.model.vo.Notice;
import com.kh.gw.board.model.vo.PageInfo;

public interface NoticeService {
	
	//메인화면 공지사항
	public List<Notice> selectListNoticeMain() throws Exception;
	
	//공지사항 목록 조회 고정
	public List<Notice> selectListNoticePagingPin() throws Exception;
	
	//공지사항 목록 조회
	public List<Notice> selectListNoticePaging(PageInfo pi) throws Exception;
	
	//공지사항 게시물 총 갯수
	public int getListCount() throws Exception;
	
	//공지사항 작성
	public int insertNotice(Notice notice) throws Exception;

	//공지사항 조회
	public Notice selectOne(String nBoardNo) throws Exception;
	
	//공지사항 수정
	public void updateNotice(Notice notice) throws Exception;
	
	//공지사항 삭제
	public void deleteNotice(Notice notice) throws Exception;
	
	//공지사항 작성 첨부파일
	//public int insertNoticeAttachment(Notice notice, List<Attachment> attachList) throws Exception;

	//public int insertNotice(List<Attachment> attachList, Notice notice) throws Exception;

	
	//첨부파일
	//List<AttachmentApp> selectAttachmentAppList(String nBoardNo);

	//AttachmentApp selectOneAttachmentApp(String fileNo);
	
}
