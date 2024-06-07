package com.kh.gw.education.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.education.model.vo.AttachmentEdu;
import com.kh.gw.education.model.vo.Education;
import com.kh.gw.education.model.vo.LikeEducation;
import com.kh.gw.education.model.vo.ReplyEdu;

public interface educationDao {

	int enrollEdu(SqlSessionTemplate sqlSession, Education e);

	int insertFile(SqlSessionTemplate sqlSession, AttachmentEdu at);

	List<Education> selectEducationList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getEducationListCount(SqlSessionTemplate sqlSession);

	Education selectEducationDetail(SqlSessionTemplate sqlSession, Education e);

	int plusViewsCount(SqlSessionTemplate sqlSession, Education e);

	int heartCheck(SqlSessionTemplate sqlSession, LikeEducation check);

	int insertHeart(SqlSessionTemplate sqlSession, LikeEducation check);

	int deleteHeart(SqlSessionTemplate sqlSession, LikeEducation check);

	int updateEduLikeIn(SqlSessionTemplate sqlSession, String eduNo);

	int updateEduLikeDel(SqlSessionTemplate sqlSession, String eduNo);

	int insertReply(SqlSessionTemplate sqlSession, ReplyEdu reply);

	List<ReplyEdu> selectReplyList(SqlSessionTemplate sqlSession, String eduNo);

}
