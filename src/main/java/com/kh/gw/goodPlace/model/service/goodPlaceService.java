package com.kh.gw.goodPlace.model.service;

import java.util.List;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.goodPlace.model.vo.AttachmentPicture;
import com.kh.gw.goodPlace.model.vo.LikesPicture;
import com.kh.gw.goodPlace.model.vo.PictureBoard;
import com.kh.gw.goodPlace.model.vo.ReplyPicture;

public interface goodPlaceService {

	int insertPboardWithAttachment(PictureBoard pBoard, AttachmentPicture ap);

	List<PictureBoard> selectPictureBoardList(PageInfo pi);

	int getListCount();

	PictureBoard selectOnePboard(String pboardNo);

	List<ReplyPicture> insertReply(ReplyPicture reply);

	int heartCheck(LikesPicture check);

	int insertHeart(LikesPicture check);

	int deleteHeart(LikesPicture check);

	PictureBoard selectOnePboardWithoutReply(String pboardNo);

	int updatePboard(PictureBoard pBoard);

	int updatePboardWithAttachment(PictureBoard pBoard, AttachmentPicture ap);

	int deletePboard(String pboardNo);

	int deletePboardReply(String preplyNo);

	int updatePboardReply(ReplyPicture reply);

	
}
