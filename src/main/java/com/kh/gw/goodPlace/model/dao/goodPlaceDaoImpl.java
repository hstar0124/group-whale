package com.kh.gw.goodPlace.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.goodPlace.model.vo.AttachmentPicture;
import com.kh.gw.goodPlace.model.vo.LikesPicture;
import com.kh.gw.goodPlace.model.vo.PictureBoard;
import com.kh.gw.goodPlace.model.vo.ReplyPicture;

@Repository
public class goodPlaceDaoImpl implements goodPlaceDao {

	@Override
	public int insertPboard(SqlSessionTemplate sqlSession, PictureBoard pBoard) {
		
		return sqlSession.insert("goodPlace.insertPboard", pBoard);
	}

	@Override
	public int insertPboardAttachment(SqlSessionTemplate sqlSession, AttachmentPicture ap) {
		
		return sqlSession.insert("goodPlace.insertAttachment", ap);
	}

	@Override
	public List<PictureBoard> selectPictureBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("goodPlace.selectPictureBoardList", null, rowBounds);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("goodPlace.selectListCount");
	}

	@Override
	public PictureBoard selectOnePictureBoard(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.selectOne("goodPlace.selectOnePictureBoard", pboardNo);
	}

	@Override
	public int updateCount(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.update("goodPlace.updateCount", pboardNo);
	}

	@Override
	public int insertReply(SqlSessionTemplate sqlSession, ReplyPicture reply) {

		return sqlSession.insert("goodPlace.insertReply", reply);
	}

	@Override
	public List<ReplyPicture> selectReplyList(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.selectList("goodPlace.selectReplyList", pboardNo);
	}

	@Override
	public int heartCheck(SqlSessionTemplate sqlSession, LikesPicture check) {

		return sqlSession.selectOne("goodPlace.selectHeartCheck", check);
	}

	@Override
	public int insertHeart(SqlSessionTemplate sqlSession, LikesPicture check) {

		return sqlSession.insert("goodPlace.insertHeart", check);
	}

	@Override
	public int deleteHeart(SqlSessionTemplate sqlSession, LikesPicture check) {

		return sqlSession.delete("goodPlace.deleteHeart", check);
	}

	@Override
	public int updatePboardLikesIn(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.update("goodPlace.updatePboardLikesIn", pboardNo);
	}

	@Override
	public int updatePboardLikesDel(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.update("goodPlace.updatePboardLikesDel", pboardNo);
	}

	@Override
	public PictureBoard selectOnePictureBoardWithoutReply(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.selectOne("goodPlace.selectOnePboardWithoutReply", pboardNo);
	}

	@Override
	public int updatePboard(SqlSessionTemplate sqlSession, PictureBoard pBoard) {
		
		return sqlSession.update("goodPlace.updatePboard", pBoard);
	}

	@Override
	public int updatePboardAttachment(SqlSessionTemplate sqlSession, AttachmentPicture ap) {
		
		return sqlSession.update("goodPlace.updatePboardAttachment", ap);
	}

	@Override
	public int deletePboard(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.delete("goodPlace.deletePboard", pboardNo);
	}

	@Override
	public int deletePboardAttachment(SqlSessionTemplate sqlSession, String pboardNo) {

		return sqlSession.delete("goodPlace.deletePboardAttachment", pboardNo);
	}

	@Override
	public int deletePboardReply(SqlSessionTemplate sqlSession, String preplyNo) {

		return sqlSession.delete("goodPlace.deletePboardReply", preplyNo);
	}

	@Override
	public int updatePboardReply(SqlSessionTemplate sqlSession, ReplyPicture reply) {

		return sqlSession.update("goodPlace.updatePboardReply", reply);
	}


}
