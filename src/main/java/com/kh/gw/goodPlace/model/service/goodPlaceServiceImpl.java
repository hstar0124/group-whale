package com.kh.gw.goodPlace.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.goodPlace.model.dao.goodPlaceDao;
import com.kh.gw.goodPlace.model.vo.AttachmentPicture;
import com.kh.gw.goodPlace.model.vo.LikesPicture;
import com.kh.gw.goodPlace.model.vo.PictureBoard;
import com.kh.gw.goodPlace.model.vo.ReplyPicture;

@Service
public class goodPlaceServiceImpl implements goodPlaceService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private goodPlaceDao gd;

	@Override
	public int insertPboardWithAttachment(PictureBoard pBoard, AttachmentPicture ap) {
		
		int result1 = 0;
		result1 = gd.insertPboard(sqlSession, pBoard);
		
		int result2 = 0;		
		if(result1 > 0) {		
			ap.setPboardNo(pBoard.getPboardNo());
			result2 = gd.insertPboardAttachment(sqlSession, ap);
		}		
		return result2;
	}

	@Override
	public List<PictureBoard> selectPictureBoardList(PageInfo pi) {
		
		return gd.selectPictureBoardList(sqlSession, pi);
	}

	@Override
	public int getListCount() {

		return gd.getListCount(sqlSession);
	}

	@Override
	public PictureBoard selectOnePboard(String pboardNo) {
		
		int result = gd.updateCount(sqlSession, pboardNo);
		
		PictureBoard pb = null;
		if(result > 0) {
			pb = gd.selectOnePictureBoard(sqlSession, pboardNo);
		}
		
		return pb;
	}

	@Override
	public List<ReplyPicture> insertReply(ReplyPicture reply) {
		
		int result = gd.insertReply(sqlSession, reply);
		
		List<ReplyPicture> list = null;
		
		if(result > 0) {
			list = gd.selectReplyList(sqlSession, reply.getPboardNo());
		}
		
		return list;
	}

	@Override
	public int heartCheck(LikesPicture check) {

		return gd.heartCheck(sqlSession, check);
	}

	@Override
	public int insertHeart(LikesPicture check) {

		int result = 0;
		
		int result1 = gd.insertHeart(sqlSession, check);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = gd.updatePboardLikesIn(sqlSession, check.getPboardNo());
		}
		
		result = result1 + result2;
		
		return result; 
	}

	@Override
	public int deleteHeart(LikesPicture check) {

		int result = 0;
		
		int result1 = gd.deleteHeart(sqlSession, check);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = gd.updatePboardLikesDel(sqlSession, check.getPboardNo());
		}
		
		result = result1 + result2;
		
		return result;
	}

	@Override
	public PictureBoard selectOnePboardWithoutReply(String pboardNo) {
		
		return gd.selectOnePictureBoardWithoutReply(sqlSession, pboardNo);
	}

	@Override
	public int updatePboard(PictureBoard pBoard) {
		
		return gd.updatePboard(sqlSession, pBoard);
	}

	@Override
	public int updatePboardWithAttachment(PictureBoard pBoard, AttachmentPicture ap) {
		
		int result = 0;
		
		int result1 = gd.updatePboard(sqlSession, pBoard);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = gd.updatePboardAttachment(sqlSession, ap);
		} 
		
		result = result1 + result2;
		
		return result;
	}

	@Override
	public int deletePboard(String pboardNo) {
		int result = 0;
		
		int result1 = gd.deletePboardAttachment(sqlSession, pboardNo);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = gd.deletePboard(sqlSession, pboardNo);
		}
		
		result = result1 + result2;
		
		return result;
	}

	@Override
	public int deletePboardReply(String preplyNo) {

		return gd.deletePboardReply(sqlSession, preplyNo);
	}

	@Override
	public int updatePboardReply(ReplyPicture reply) {

		return gd.updatePboardReply(sqlSession, reply);
	}
	
	
	

}
