package com.kh.gw.mail.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.mail.model.vo.AttachmentMail;
import com.kh.gw.mail.model.vo.Mail;
import com.kh.gw.mail.model.vo.PageInfo;
import com.kh.gw.mail.model.vo.searchCondition;

@Repository
public class MailDaoImpl implements MailDao {

	@Override
	public int insertSendMail(Mail m, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Mail.insertMail", m);
	}

	@Override
	public int insertMailBox(Mail m, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Mail.insertMailBox", m);
	}
	
	@Override
	public int insertReceiver(Mail m, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("Mail.insertReceiver", m);
	}
	@Override
	public int insertAttachment(List<AttachmentMail> fileList, SqlSessionTemplate sqlSession) {

		int result = 0;
		
		for(int i = 0; i < fileList.size(); i++) {
			result = sqlSession.insert("Mail.insertMailAttachment", fileList.get(i));
		}
		
		return result;
	}
	
	@Override
	public int insertReceiveMail(SqlSessionTemplate sqlSession, Mail m) {

		return sqlSession.insert("Mail.insertReceiveMail", m);
	}

	@Override
	public int insertReceiveMailBox(SqlSessionTemplate sqlSession, Mail m) {

		return sqlSession.insert("Mail.insertReceiveMailBox",m);
	}
	
	@Override
	public int insertSendMailBox(SqlSessionTemplate sqlSession, Mail m) {

		return sqlSession.insert("Mail.insertSendMailBox",m);
	}
	

	@Override
	public int getSendListCount(SqlSessionTemplate sqlSession, String empNo) {
		int listCount = 0;
		System.out.println("before : " +listCount);
		listCount = sqlSession.selectOne("Mail.selectSendListCount", empNo);
		System.out.println("after : " + listCount);
	
		return listCount;
	}
	
	@Override
	public int getReceiveListCount(SqlSessionTemplate sqlSession, String empNo) {
		int listCount = 0;
		System.out.println("before : " +listCount);
		listCount = sqlSession.selectOne("Mail.selectReceiveListCount", empNo);
		System.out.println("after : " + listCount);
		return listCount;
	}
	
	@Override
	public int getImportantListCount(SqlSessionTemplate sqlSession, String empNo) {

		int listCount = 0;
		System.out.println("before : " +listCount);
		listCount = sqlSession.selectOne("Mail.selectImportantListCount", empNo);
		System.out.println("after : " + listCount);
		return listCount;
	}

	@Override
	public List<Mail> selectImportantMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empEmail) {

		List<Mail> list = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return sqlSession.selectList("Mail.selectImportantList" , empEmail, rowBounds);
	}

	@Override
	public List<Mail> selectSendMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empEmail) {

		List<Mail> list = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Mail.selectSendMailList", empEmail, rowBounds);
	}

	/*
	 * @Override public List<Mail> selectOneMail(SqlSessionTemplate sqlSession, int
	 * mailNo) {
	 * 
	 * return sqlSession.selectOne("Mail.selectOneMail", mailNo); }
	 */


	@Override
	public Mail selectOneSendMail(SqlSessionTemplate sqlSession, int mailNo) {

		return sqlSession.selectOne("Mail.selectOneSendMail", mailNo);
	}

	@Override
	public List<Map<String,Object>> selectFileList(SqlSessionTemplate sqlSession, int mailNo) {
		
		return sqlSession.selectList("Mail.selectFileList", mailNo);
	}


	@Override
	public AttachmentMail selectOneAttachmentMail(SqlSessionTemplate sqlSession, String eaNo) {

		return sqlSession.selectOne("Mail.selectOneAttachment", eaNo);
	}
	

	@Override
	public Mail selectOneReceiveMail(SqlSessionTemplate sqlSession, int mailNo) {

		return sqlSession.selectOne("Mail.selectOneReceiveMail", mailNo);
	}

	//위에 두 메소드가 대체
	@Override
	public List<Mail> selectOneMail(SqlSessionTemplate sqlSession, int mailNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Mail> selectReceiveMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empEmail) {

		List<Mail> list = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Mail.selectReceiveMailList", empEmail, rowBounds);
	}

	@Override
	public int getSearchResultListCount(SqlSessionTemplate sqlSession, searchCondition sc) {

		return sqlSession.selectOne("Mail.selectSearchResultCount", sc);
	}

	@Override
	public List<Mail> selectSearchResultList(SqlSessionTemplate sqlSession, searchCondition sc, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		
		return sqlSession.selectList("Mail.selectSearchResultList", sc, rowBounds);
	}

	@Override
	public int insertReveiveReceiver(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("Mail.insertReceiveReceiverMail", m);
	}

	@Override
	public int updateReadMail(SqlSessionTemplate sqlSession, int mailNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("Mail.updateReadMail", mailNo);
	}

	@Override
	public List<Mail> selectNotReadMailList(SqlSessionTemplate sqlSession, String empNo) {

		return sqlSession.selectList("Mail.selectNotReadMailList", empNo);
	}

	@Override
	public int getNotReadMailListCount(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		int listCount = 0;
		System.out.println("before : " +listCount);
		listCount = sqlSession.selectOne("Mail.getNotReadMailListCount", empNo);
		System.out.println("after : " + listCount);
		return listCount;
	}










}
