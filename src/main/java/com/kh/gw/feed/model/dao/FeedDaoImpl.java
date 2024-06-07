package com.kh.gw.feed.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.feed.model.vo.Attachment;
import com.kh.gw.feed.model.vo.FeedBoard;
import com.kh.gw.feed.model.vo.FeedHeart;
import com.kh.gw.feed.model.vo.FeedReply;
import com.kh.gw.settings.model.vo.PageInfo;

@Repository
public class FeedDaoImpl implements FeedDao{

	@Override
	public int insertFeed(SqlSessionTemplate sqlSession, FeedBoard f) {
		return sqlSession.insert("Feed.insertFeed", f);
	}

	@Override
	public int insertFeedAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("Feed.insertFeedAttachment", at);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Feed.selectListCount");
	}

	@Override
	public List<FeedBoard> selectFeedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		List<FeedBoard> list = null;
		
		//몇개의 게시물을 건너뛰고 검색할건지 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());		
		return sqlSession.selectList("Feed.selectFeedList", null, rowBounds);
	}

	@Override
	public int insertReply(SqlSessionTemplate sqlSession, FeedReply r) {
		return sqlSession.insert("Feed.insertReply", r);
	}

	@Override
	public int deleteFeed(SqlSessionTemplate sqlSession, String feedNo) {
		return sqlSession.delete("Feed.deleteFeed", feedNo);
	}

	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, String feedNo) {
		return sqlSession.delete("Feed.deleteReply", feedNo);
	}

	@Override
	public int deleteHeart(SqlSessionTemplate sqlSession, String feedNo) {
		return sqlSession.delete("Feed.deleteFeedWithHeart", feedNo);
	}

	@Override
	public Attachment selectFeedAttachment(SqlSessionTemplate sqlSession, String feedNo) {
		return sqlSession.selectOne("Feed.selectFeedAttachment", feedNo);
	}

	@Override
	public int deleteReplyOne(SqlSessionTemplate sqlSession, String replyNo) {
		return sqlSession.delete("Feed.deleteReplyOne", replyNo);
	}

	@Override
	public List<FeedHeart> selectHeartList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Feed.selectHeartList");
	}

	@Override
	public int insertHeart(SqlSessionTemplate sqlSession, FeedHeart heart) {
		return sqlSession.insert("Feed.insertHeart", heart);
	}

	@Override
	public int updatePlusFeedBoard(SqlSessionTemplate sqlSession, FeedHeart heart) {
		return sqlSession.update("Feed.updatePlusFeedBoard", heart);
	}
	
	@Override
	public int deleteHeart(SqlSessionTemplate sqlSession, FeedHeart heart) {
		return sqlSession.delete("Feed.deleteHeart", heart);
	}

	@Override
	public int updateMinusFeedBoard(SqlSessionTemplate sqlSession, FeedHeart heart) {
		return sqlSession.update("Feed.updateMinusFeedBoard", heart);
	}

	@Override
	public int updateFeed(SqlSessionTemplate sqlSession, FeedBoard f) {
		return sqlSession.update("Feed.updateFeedBoard", f);
	}

	@Override
	public int updateReply(SqlSessionTemplate sqlSession, FeedReply r) {
		return sqlSession.update("Feed.updateReply", r);
	}

	@Override
	public List<FeedBoard> selectFeedList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Feed.selectFeedList");
	}

}
