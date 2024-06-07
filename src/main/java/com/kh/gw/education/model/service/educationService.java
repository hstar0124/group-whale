package com.kh.gw.education.model.service;

import java.util.List;

import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.education.model.vo.AttachmentEdu;
import com.kh.gw.education.model.vo.Education;
import com.kh.gw.education.model.vo.LikeEducation;
import com.kh.gw.education.model.vo.ReplyEdu;

public interface educationService {

	int insertFile(AttachmentEdu file);

	int enrollEdu(Education e);

	List<Education> selectEducationList(PageInfo pi);

	int getEducationListCount();

	Education selectEducationDetail(Education e);

	int plusViewsCount(Education e);

	int heartCheck(LikeEducation check);

	int insertHeart(LikeEducation check);

	int deleteHeart(LikeEducation check);

	List<ReplyEdu> insertReply(ReplyEdu reply);


	
}
