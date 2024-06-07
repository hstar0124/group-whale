package com.kh.gw.mail.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.mail.model.vo.AttachmentMail;
import com.kh.gw.mail.model.vo.Mail;
import com.kh.gw.mail.model.vo.PageInfo;
import com.kh.gw.mail.model.vo.searchCondition;

public interface MailDao {

	int insertSendMail(Mail m, SqlSessionTemplate sqlSession);

	int insertMailBox(Mail m, SqlSessionTemplate sqlSession);

	int insertAttachment(List<AttachmentMail> fileList, SqlSessionTemplate sqlSession);

	int getSendListCount(SqlSessionTemplate sqlSession, String empNo);

	List<Mail> selectSendMailList(SqlSessionTemplate sqlSession, PageInfo pi,String empEmail);

	List<Mail> selectOneMail(SqlSessionTemplate sqlSession, int mailNo);

	List<Map<String,Object>> selectFileList(SqlSessionTemplate sqlSession, int mailNo);

	Mail selectOneSendMail(SqlSessionTemplate sqlSession, int mailNo);

	AttachmentMail selectOneAttachmentMail(SqlSessionTemplate sqlSession, String eaNo);

	int insertReceiver(Mail m, SqlSessionTemplate sqlSession);

	int getReceiveListCount(SqlSessionTemplate sqlSession, String empNo);

	int insertReceiveMail(SqlSessionTemplate sqlSession, Mail m);

	int insertReceiveMailBox(SqlSessionTemplate sqlSession, Mail m);

	List<Mail> selectReceiveMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empEmail);

	Mail selectOneReceiveMail(SqlSessionTemplate sqlSession, int mailNo);

	int getSearchResultListCount(SqlSessionTemplate sqlSession, searchCondition sc);

	List<Mail> selectSearchResultList(SqlSessionTemplate sqlSession, searchCondition sc, PageInfo pi);

	int insertReveiveReceiver(SqlSessionTemplate sqlSession, Mail m);

	int insertSendMailBox(SqlSessionTemplate sqlSession, Mail m);

	int getImportantListCount(SqlSessionTemplate sqlSession, String empNo);

	List<Mail> selectImportantMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empEmail);

	int updateReadMail(SqlSessionTemplate sqlSession, int mailNo);

	List<Mail> selectNotReadMailList(SqlSessionTemplate sqlSession, String empNo);

	int getNotReadMailListCount(SqlSessionTemplate sqlSession, String empNo);



}
