package com.kh.gw.goodPlace.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.goodPlace.model.vo.AttachmentPicture;
import com.kh.gw.goodPlace.model.vo.LikesPicture;
import com.kh.gw.goodPlace.model.vo.PictureBoard;
import com.kh.gw.goodPlace.model.vo.ReplyPicture;

public interface goodPlaceDao {

	int insertPboard(SqlSessionTemplate sqlSession, PictureBoard pBoard);

	int insertPboardAttachment(SqlSessionTemplate sqlSession, AttachmentPicture ap);

	List<PictureBoard> selectPictureBoardList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession);

	PictureBoard selectOnePictureBoard(SqlSessionTemplate sqlSession, String pboardNo);

	int updateCount(SqlSessionTemplate sqlSession, String pboardNo);

	int insertReply(SqlSessionTemplate sqlSession, ReplyPicture reply);

	List<ReplyPicture> selectReplyList(SqlSessionTemplate sqlSession, String pboardNo);

	int heartCheck(SqlSessionTemplate sqlSession, LikesPicture check);

	int insertHeart(SqlSessionTemplate sqlSession, LikesPicture check);

	int deleteHeart(SqlSessionTemplate sqlSession, LikesPicture check);

	int updatePboardLikesIn(SqlSessionTemplate sqlSession, String pboardNo);

	int updatePboardLikesDel(SqlSessionTemplate sqlSession, String pboardNo);

	PictureBoard selectOnePictureBoardWithoutReply(SqlSessionTemplate sqlSession, String pboardNo);

	int updatePboard(SqlSessionTemplate sqlSession, PictureBoard pBoard);

	int updatePboardAttachment(SqlSessionTemplate sqlSession, AttachmentPicture ap);

	int deletePboard(SqlSessionTemplate sqlSession, String pboardNo);

	int deletePboardAttachment(SqlSessionTemplate sqlSession, String pboardNo);

	int deletePboardReply(SqlSessionTemplate sqlSession, String preplyNo);

	int updatePboardReply(SqlSessionTemplate sqlSession, ReplyPicture reply);



}
