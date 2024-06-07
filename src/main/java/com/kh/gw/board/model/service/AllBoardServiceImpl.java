package com.kh.gw.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.board.model.dao.AllBoardDao;
import com.kh.gw.board.model.vo.AllBoard;
import com.kh.gw.board.model.vo.AllBoardReply;
import com.kh.gw.board.model.vo.Attachment;
import com.kh.gw.board.model.vo.PageInfo;
import com.kh.gw.feed.model.vo.FeedBoard;

@Service
public class AllBoardServiceImpl implements AllBoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AllBoardDao ad;

	//전사게시판 작성
	@Override
	public int insertAllBoardForm(AllBoard allBoard) throws Exception {
		// TODO Auto-generated method stub
		return ad.insertAllBoardForm(sqlSession,allBoard);
	}
	
	//전사게시판 작성(파일첨부)
	@Override
	public int insertAllBoardForm(AllBoard allBoard,Attachment attachment) throws Exception {
		
		int result = 0;
		
		int result1 = ad.insertAllBoardForm(sqlSession,allBoard);
		
		int result2 = ad.insertAllBoardFormFile(sqlSession, attachment);
		System.out.println("service result2 : " + result2);
		System.out.println("service attachment : " + attachment);
		result = result1 + result2;
		
		return result;
		//ad.insertAttachment(sqlSession,attachment);
	}
	
	//다운로드
	@Override
	public Attachment selectOneAttachmentBoard(String attachmentNo) {
			
		return ad.selectOneAttachmentBoard(sqlSession,attachmentNo);
	}

	//전사게시판 목록 조회
	@Override
	public List<AllBoard> selectListAllBoardPaging(PageInfo pi) throws Exception {

		return ad.selectListAllBoardPaging(pi);
	}
	
	//전사게시판 목록 조회 카운트
	@Override
	public int getListCount() throws Exception {
		
		return ad.getListCount();
	}
	
	//전사게시판 조회
	@Override
	public Map<String,Object> SelectOneAllBoard(String aBoardNo) throws Exception {
		
		ad.aCount(aBoardNo);
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		resultMap.put("list2", ad.SelectOneAllBoard(aBoardNo));
		resultMap.put("file", ad.SelectOneFile(aBoardNo));
		
		return resultMap;
	}

	//전사게시판 수정
	@Override
	public void updateAllBoardForm(AllBoard allBoard) throws Exception {

		ad.updateAllBoardForm(allBoard);
	}

	//전사게시판 삭제
	@Override
	public void deleteAllBoard(AllBoard allBoard) throws Exception {

		ad.deleteAllBoard(allBoard);
	}

	//게시물 갯수
	@Override
	public int getAllBoardListCount() throws Exception {

		
		return ad.getAllBoardListCount();
	}
	
	//댓글 조회
	@Override
	public List<AllBoardReply> readReply(AllBoardReply aReply) throws Exception {
		return ad.readReply(sqlSession, aReply);
	}

	//댓글 작성
	@Override
	public int insertReply(AllBoardReply aReply) throws Exception {
		return ad.insertReply(sqlSession, aReply);
	}

	//댓글 수정
	@Override
	public int updateReply(AllBoardReply allBoardReply) throws Exception {
		return ad.updateReply(sqlSession, allBoardReply);
	}

	//댓글 삭제
	@Override
	public int deleteReply(String replyNo) throws Exception {
		return ad.deleteReply(sqlSession, replyNo);
	}

	

	

}
