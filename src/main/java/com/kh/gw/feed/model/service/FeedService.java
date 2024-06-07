package com.kh.gw.feed.model.service;

import java.util.List;

import com.kh.gw.feed.model.vo.Attachment;
import com.kh.gw.feed.model.vo.FeedBoard;
import com.kh.gw.feed.model.vo.FeedHeart;
import com.kh.gw.feed.model.vo.FeedHeartCount;
import com.kh.gw.feed.model.vo.FeedReply;
import com.kh.gw.settings.model.vo.PageInfo;

public interface FeedService {

	int insertFeed(FeedBoard f);

	int insertFeedWithAttachment(FeedBoard f, Attachment at);

	int getListCount();

	List<FeedBoard> selectFeedList(PageInfo pi);

	int insertReply(FeedReply r);

	int deleteFeed(String feedNo);

	Attachment selectFeedAttachemt(String feedNo);

	int deleteReplyOne(String replyNo);

	List<FeedHeart> selectHeartList();

	int insertHeart(FeedHeart heart);

	int deleteHeart(FeedHeart heart);

	int updateFeed(FeedBoard f);

	int updateReply(FeedReply r);

	List<FeedBoard> selectFeedList();


}
