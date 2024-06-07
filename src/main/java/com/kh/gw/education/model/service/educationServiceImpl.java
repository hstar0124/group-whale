package com.kh.gw.education.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.education.model.dao.educationDao;
import com.kh.gw.education.model.vo.AttachmentEdu;
import com.kh.gw.education.model.vo.Education;
import com.kh.gw.education.model.vo.LikeEducation;
import com.kh.gw.education.model.vo.ReplyEdu;
import com.kh.gw.goodPlace.model.vo.ReplyPicture;

@Service
public class educationServiceImpl implements educationService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private educationDao ed;
	
	@Override
	public int enrollEdu(Education e) {
		return ed.enrollEdu(sqlSession, e);
	}
	@Override
	public int insertFile(AttachmentEdu at) {
		return ed.insertFile(sqlSession, at);
	}
	
	@Override
	public List<Education> selectEducationList(PageInfo pi) {
		return ed.selectEducationList(sqlSession, pi);
	}
	@Override
	public int getEducationListCount() {
		return ed.getEducationListCount(sqlSession);
	}
	@Override
	public Education selectEducationDetail(Education e) {
		return ed.selectEducationDetail(sqlSession, e);
	}
	@Override
	public int plusViewsCount(Education e) {
		return ed.plusViewsCount(sqlSession, e);
	}
	@Override
	public int heartCheck(LikeEducation check) {
		return ed.heartCheck(sqlSession, check);
	}
	@Override
	public int insertHeart(LikeEducation check) {
		int result = 0;
		
		int result1 = ed.insertHeart(sqlSession, check);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = ed.updateEduLikeIn(sqlSession, check.getEduNo());
		}
		
		result = result1 + result2;
		
		return result; 
	}
	@Override
	public int deleteHeart(LikeEducation check) {
		int result = 0;
		
		int result1 = ed.deleteHeart(sqlSession, check);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = ed.updateEduLikeDel(sqlSession, check.getEduNo());
		}
		
		result = result1 + result2;
		
		return result; 
	}
	
	@Override
	public List<ReplyEdu> insertReply(ReplyEdu reply) {
		int result = ed.insertReply(sqlSession, reply);
		
		List<ReplyEdu> list = null;
		
		if(result > 0) {
			list = ed.selectReplyList(sqlSession, reply.getEduNo());
		}
		
		return list;
	}
	
	
	

}
