package com.kh.gw.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.gw.mail.model.dao.MailDao;
import com.kh.gw.mail.model.vo.AttachmentMail;
import com.kh.gw.mail.model.vo.Mail;
import com.kh.gw.mail.model.vo.PageInfo;
import com.kh.gw.mail.model.vo.searchCondition;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired 
	private MailDao md;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int insertMail(Mail m, List<AttachmentMail> fileList) {

		int result = 0;
		
		int result1 = md.insertSendMail(m, sqlSession);
		
		int result2 = md.insertMailBox(m, sqlSession);
				
		int result3 = md.insertReceiver(m, sqlSession);
		
		int result4 = md.insertAttachment(fileList, sqlSession);
		
		result = result1 + result2 + result3 + result4;
		
		return result;
	}
	
	// s3에서 메세지 객체를 불러와 db에 저장하는 작업
	@Override
	public int insertReceiveMail(Mail m, List<AttachmentMail> fileList) {
		
		int result = 0;
		
		int result1 = md.insertReceiveMail(sqlSession, m);
		
		int result2 = md.insertReceiveMailBox(sqlSession, m);
		
		int result3 = md.insertSendMailBox(sqlSession, m);
		
		int result4 = md.insertReveiveReceiver(sqlSession,m);
		
		int result5 = md.insertAttachment(fileList, sqlSession);
		
		result = result1 + result2 + result3 + result4 + result5;
		
		return result;
	}
	
	@Override
	public int insertReceiveMail2(Mail mr, ArrayList<AttachmentMail> maList) {

		int result = 0;
		
		int result1 = md.insertReceiveMail(sqlSession, mr);
		
		int result2 = md.insertReceiveMailBox(sqlSession, mr);
		
		int result3 = md.insertReveiveReceiver(sqlSession,mr);
		
		int result4 = md.insertAttachment(maList, sqlSession);
		
		result = result1 + result2 + result3 + result4;
		
		return result;
	}
	
	@Override
	public int getSendListCount(String empNo) {
		return md.getSendListCount(sqlSession, empNo);
	}
	
	@Override
	public int getReceiveListCount(String empNo) {

		return md.getReceiveListCount(sqlSession, empNo);
	}
	
	@Override
	public List<Mail> selectSendMailList(PageInfo pi,String empEmail) {

		return md.selectSendMailList(sqlSession, pi, empEmail);
	}
	
	//보낸 메일 상세
	@Override
	public Map<String, Object> selectOneSendMail(int mailNo) {

		Map<String, Object> resultMap = new HashMap<String,Object>();
		resultMap.put("map", md.selectOneSendMail(sqlSession, mailNo));
		resultMap.put("list", md.selectFileList(sqlSession, mailNo));
		
		return resultMap;
	}
	//보낸 파일 상세(다운로드를 위해)
	@Override
	public AttachmentMail selectOneAttachmentMail(String eaNo) {

		return md.selectOneAttachmentMail(sqlSession,eaNo);
	}

	//받은 메일 리스트
	@Override
	public List<Mail> selectReceiveMailList(PageInfo pi, String empEmail) {
		// TODO Auto-generated method stub
		return md.selectReceiveMailList(sqlSession, pi, empEmail);
	}

	//받은 메일 상세
	@Override
	public Map<String, Object> selectOneReceiveMail(int mailNo) {

		Map<String, Object> resultMap = new HashMap<String,Object>();
		resultMap.put("map", md.selectOneReceiveMail(sqlSession, mailNo));
		resultMap.put("list", md.selectFileList(sqlSession, mailNo));
		
		return resultMap;
	}

	@Override
	public int getSearchResultListCount(searchCondition sc) {

		return md.getSearchResultListCount(sqlSession,sc);
	}

	@Override
	public List<Mail> selectSearchResultList(searchCondition sc, PageInfo pi) {

		return md.selectSearchResultList(sqlSession, sc, pi);
	}

	@Override
	public int getImportantListCount(String empNo) {

		return md.getImportantListCount(sqlSession, empNo);
	}

	@Override
	public List<Mail> selectImportantMailList(PageInfo pi, String empEmail) {

		return md.selectImportantMailList(sqlSession, pi, empEmail);
	}

	@Override
	public int updateReadMail(int mailNo) {

		return md.updateReadMail(sqlSession,mailNo);
	}

	@Override
	public List<Mail> selectNotReadMailList(String empNo) {

		return md.selectNotReadMailList(sqlSession, empNo);
	}

	@Override
	public int getNotReadMailListCount(String empNo) {

		return md.getNotReadMailListCount(sqlSession, empNo);
	}


	



	
}
