package com.kh.gw.education.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.education.model.vo.AttachmentEdu;
import com.kh.gw.education.model.vo.Education;
import com.kh.gw.education.model.vo.LikeEducation;
import com.kh.gw.education.model.vo.ReplyEdu;

@Repository
public class educationDaoImpl implements educationDao {

	@Override
	public int enrollEdu(SqlSessionTemplate sqlSession, Education e) {
		return sqlSession.insert("Education.enrollEdu", e);
	}

	@Override
	public int insertFile(SqlSessionTemplate sqlSession, AttachmentEdu at) {
		return sqlSession.insert("Education.insertFile", at);
	}

	@Override
	public List<Education> selectEducationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Education.selectEducationList", null, rowBounds);
	}

	@Override
	public int getEducationListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Education.getEducationListCount");
	}

	@Override
	public Education selectEducationDetail(SqlSessionTemplate sqlSession, Education e) {
		return sqlSession.selectOne("Education.selectEducationDetail", e);
	}

	@Override
	public int plusViewsCount(SqlSessionTemplate sqlSession, Education e) {
		return sqlSession.update("Education.plusViewsCount", e);
	}

	@Override
	public int heartCheck(SqlSessionTemplate sqlSession, LikeEducation check) {
		return sqlSession.selectOne("Education.selectHeartCheck", check);
	}

	@Override
	public int insertHeart(SqlSessionTemplate sqlSession, LikeEducation check) {
		return sqlSession.insert("Education.insertHeart", check);
	}

	@Override
	public int deleteHeart(SqlSessionTemplate sqlSession, LikeEducation check) {
		return sqlSession.insert("Education.deleteHeart", check);
	}

	@Override
	public int updateEduLikeIn(SqlSessionTemplate sqlSession, String eduNo) {
		return sqlSession.update("Education.updateEduLikeIn", eduNo);
	}

	@Override
	public int updateEduLikeDel(SqlSessionTemplate sqlSession, String eduNo) {
		return sqlSession.update("Education.updateEduLikeDel", eduNo);
	}

	@Override
	public int insertReply(SqlSessionTemplate sqlSession, ReplyEdu reply) {
		return sqlSession.insert("Education.insertReply", reply);
	}

	@Override
	public List<ReplyEdu> selectReplyList(SqlSessionTemplate sqlSession, String eduNo) {
		return sqlSession.selectList("Education.selectReplyList", eduNo);
	}

	

}
