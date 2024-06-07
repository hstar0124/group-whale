package com.kh.gw.board.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.board.model.dao.NoticeDao;
import com.kh.gw.board.model.vo.Attachment;
import com.kh.gw.board.model.vo.Notice;
import com.kh.gw.board.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao nd;
	
	
	//메인화면 공지사항
	@Override
	public List<Notice> selectListNoticeMain() throws Exception {
		
		return nd.selectListNoticeMain();
	}
	
	//공지사항 목록 조회 고정
	@Override
	public List<Notice> selectListNoticePagingPin() throws Exception {

		return nd.selectListNoticePagingPin();
	}
	
	//공지사항 목록 조회
	@Override
	public List<Notice> selectListNoticePaging(PageInfo pi) throws Exception {

		return nd.selectListNoticePaging(pi);
	}
	
	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return nd.getListCount();
	}


	//공지사항 작성
	@Override
	public int insertNotice(Notice notice) throws Exception {
		int result1 = 0;
		
		result1 = nd.insertNotice(notice);
		
//		System.out.println("result1 : " + result1);
//		int result2 = 0;
//		if(result1 > 0) {
//			//for(int i = 0; i < attachment.size(); i++) {
//				attachment.setForeignNo(notice.getnBoardNo());
//			}
//			result2 = nd.insertNoticeAttachment(attachment);
//			System.out.println("result2 : " + result2);
		//}
		return result1;
		
	}

	//공지사항 조회
	@Override
	public Notice selectOne(String nBoardNo) throws Exception {
		nd.nCount(nBoardNo);
		return nd.selectOne(nBoardNo);
	}
	
	//공지사항 수정
	@Override
	public void updateNotice(Notice notice) throws Exception {

		nd.updateNotice(notice);
	}

	//공지사항 삭제
	@Override
	public void deleteNotice(Notice notice) throws Exception {

		nd.deleteNotice(notice);
	}

}
