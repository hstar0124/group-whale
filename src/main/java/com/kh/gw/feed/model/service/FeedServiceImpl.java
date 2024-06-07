package com.kh.gw.feed.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.feed.model.dao.FeedDao;
import com.kh.gw.feed.model.vo.Attachment;
import com.kh.gw.feed.model.vo.FeedBoard;
import com.kh.gw.feed.model.vo.FeedHeart;
import com.kh.gw.feed.model.vo.FeedHeartCount;
import com.kh.gw.feed.model.vo.FeedReply;
import com.kh.gw.settings.model.vo.PageInfo;

@Service
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private FeedDao fd;
	
	@Override
	public int insertFeed(FeedBoard f) {
		return fd.insertFeed(sqlSession, f);
	}

	@Override
	public int insertFeedWithAttachment(FeedBoard f, Attachment at) {
		//System.out.println("insertMember 호출됨");
		int result1 = 0;
		result1 = fd.insertFeed(sqlSession, f);
		
		int result2 = 0;		
		if(result1 > 0) {			
			at.setForeignNo(f.getFboardNo());
			result2 = fd.insertFeedAttachment(sqlSession, at);
		}		
		return result2;
	}

	@Override
	public int getListCount() {

		return fd.getListCount(sqlSession);
	}

	@Override
	public List<FeedBoard> selectFeedList(PageInfo pi) {
		return fd.selectFeedList(sqlSession, pi);
	}

	@Override
	public int insertReply(FeedReply r) {
		return fd.insertReply(sqlSession, r);
	}

	@Override
	public int deleteFeed(String feedNo) {		
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		result = fd.deleteReply(sqlSession, feedNo);
		result1 = fd.deleteHeart(sqlSession, feedNo);
		result2 = fd.deleteFeed(sqlSession, feedNo);
		
		return result2;
	}

	@Override
	public Attachment selectFeedAttachemt(String feedNo) {
		return fd.selectFeedAttachment(sqlSession, feedNo);
	}

	@Override
	public int deleteReplyOne(String replyNo) {
		return fd.deleteReplyOne(sqlSession, replyNo);
	}

	@Override
	public List<FeedHeart> selectHeartList() {		
		return fd.selectHeartList(sqlSession);
	}

	@Override
	public int insertHeart(FeedHeart heart) {
		int result = 0;
		
		fd.insertHeart(sqlSession, heart);
		result = fd.updatePlusFeedBoard(sqlSession, heart);
		
		return result;
	}

	@Override
	public int deleteHeart(FeedHeart heart) {
		int result = 0;
		
		fd.deleteHeart(sqlSession, heart);
		result = fd.updateMinusFeedBoard(sqlSession, heart);
		
		return result;
	}

	@Override
	public int updateFeed(FeedBoard f) {
		return fd.updateFeed(sqlSession, f);
	}

	@Override
	public int updateReply(FeedReply r) {
		return fd.updateReply(sqlSession, r);
	}

	@Override
	public List<FeedBoard> selectFeedList() {
		return fd.selectFeedList(sqlSession);
	}

	
}
