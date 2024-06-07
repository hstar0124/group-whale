package com.kh.gw.feed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.feed.model.vo.Attachment;
import com.kh.gw.feed.model.vo.FeedBoard;
import com.kh.gw.feed.model.vo.FeedHeart;
import com.kh.gw.feed.model.vo.FeedHeartCount;
import com.kh.gw.feed.model.vo.FeedReply;
import com.kh.gw.settings.model.vo.PageInfo;

public interface FeedDao {

	int insertFeed(SqlSessionTemplate sqlSession, FeedBoard f);

	int insertFeedAttachment(SqlSessionTemplate sqlSession, Attachment at);

	int getListCount(SqlSessionTemplate sqlSession);

	List<FeedBoard> selectFeedList(SqlSessionTemplate sqlSession, PageInfo pi);

	int insertReply(SqlSessionTemplate sqlSession, FeedReply r);

	int deleteFeed(SqlSessionTemplate sqlSession, String feedNo);

	int deleteReply(SqlSessionTemplate sqlSession, String feedNo);

	int deleteHeart(SqlSessionTemplate sqlSession, String feedNo);

	Attachment selectFeedAttachment(SqlSessionTemplate sqlSession, String feedNo);

	int deleteReplyOne(SqlSessionTemplate sqlSession, String replyNo);

	List<FeedHeart> selectHeartList(SqlSessionTemplate sqlSession);

	int insertHeart(SqlSessionTemplate sqlSession, FeedHeart heart);

	int deleteHeart(SqlSessionTemplate sqlSession, FeedHeart heart);

	int updatePlusFeedBoard(SqlSessionTemplate sqlSession, FeedHeart heart);

	int updateMinusFeedBoard(SqlSessionTemplate sqlSession, FeedHeart heart);

	int updateFeed(SqlSessionTemplate sqlSession, FeedBoard f);

	int updateReply(SqlSessionTemplate sqlSession, FeedReply r);

	List<FeedBoard> selectFeedList(SqlSessionTemplate sqlSession);

}
