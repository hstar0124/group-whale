package com.kh.gw.mail.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.gw.mail.model.vo.AttachmentMail;
import com.kh.gw.mail.model.vo.Mail;
import com.kh.gw.mail.model.vo.PageInfo;
import com.kh.gw.mail.model.vo.searchCondition;

public interface MailService {

	int insertMail(Mail m, List<AttachmentMail> fileList);

	int getSendListCount(String empNo);

	int getReceiveListCount(String empNo);

	List<Mail> selectSendMailList(PageInfo pi, String empEmail);

	Map<String, Object> selectOneSendMail(int mailNo);

	AttachmentMail selectOneAttachmentMail(String eaNo);

	int insertReceiveMail(Mail m, List<AttachmentMail> fileList);

	List<Mail> selectReceiveMailList(PageInfo pi, String empEmail);

	Map<String, Object> selectOneReceiveMail(int mailNo);

	int getSearchResultListCount(searchCondition sc);

	List<Mail> selectSearchResultList(searchCondition sc, PageInfo pi);

	int insertReceiveMail2(Mail mr, ArrayList<AttachmentMail> maList);

	int getImportantListCount(String empNo);

	List<Mail> selectImportantMailList(PageInfo pi, String empEmail);

	int updateReadMail(int mailNo);

	List<Mail> selectNotReadMailList(String empNo);

	int getNotReadMailListCount(String empNo);








}
