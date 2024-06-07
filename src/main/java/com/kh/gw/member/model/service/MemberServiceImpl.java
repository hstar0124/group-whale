package com.kh.gw.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.gw.member.model.dao.MemberDao;
import com.kh.gw.member.model.exception.LoginException;
import com.kh.gw.member.model.vo.Attachment;
import com.kh.gw.member.model.vo.ChangePwd;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.UpdateMember;

@Service
public class MemberServiceImpl implements MemberService{

	//SqlSessionTemplate import 가능 해진다! 추가 안되는것 같으면 빌드패스에서 라이브러리 추가해주기
	//expected at least 1 bean 처음에 이 에러가 왜 날까? =>> 빈 생성이 안되있어서! 
	//xml,component,javaconfig
	//라이브러리는 xml 설정을 이용해야 한다. root-context.xml 에서 설정
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;;
	
//	@Override
//	public Member loginMember(Member m) {
//		
//		System.out.println("loginMember 호출됨...");
//		
//		Member loginUser = md.loginCheck(sqlSession, m);
//		
//		return loginUser;
//	}
	
//	@Override
//	public Member loginMember(Member m) throws LoginException {
//		
//		Member loginUser = null;
//		
//		//디비에서 현재 로그인 시도를 한 아이디의 암호를 가져온다.
//		String encPassword = md.selectEncPassword(sqlSession, m);
//		
//		//로그인 시도시 평문 암호와 디비에서 가져온 암호화된 암호랑 비교를 해서 일치하면 true를 리턴하는 메소드이다
//		if(!passwordEncoder.matches(m.getEmpPwd(), encPassword)) {
//			//일치하지 않으면 
//			throw new LoginException("로그인 실패!");
//		} else {
//			loginUser = md.selectMember(sqlSession, m);
//		}
//		
//		return loginUser;
//	}
	
	@Override
	public LoginUser loginMember(LoginUser m) throws LoginException {
		
		LoginUser loginUser = null;
		
		//디비에서 현재 로그인 시도를 한 아이디의 암호를 가져온다.
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		//로그인 시도시 평문 암호와 디비에서 가져온 암호화된 암호랑 비교를 해서 일치하면 true를 리턴하는 메소드이다
		if(!passwordEncoder.matches(m.getEmpPwd(), encPassword)) {
			//일치하지 않으면 
			throw new LoginException("로그인 실패!");
		} else {
			loginUser = md.selectMember(sqlSession, m);
		}
		
		return loginUser;
	}

	@Override
	public int insertMember(Member m, Attachment at) {
		
		//System.out.println("insertMember 호출됨");
		int result1 = 0;
		result1 = md.insertMember(sqlSession, m);
		
		int result2 = 0;		
		if(result1 > 0) {
			//System.out.println("회원정보 등록 완료");
			at.setForeignNo(m.getEmpNo());
			//System.out.println("등록한 사번 : " + at.getForeignNo());
			result2 = md.insertMemberAttachment(sqlSession, at);
		}		
		return result2;
	}

	@Override
	public int empNoCheck(Member m) {

		return md.empNoCheck(sqlSession, m);
	}

	@Override
	public List<Member> selectMemberList() {
		
		return md.selectMemberList(sqlSession);
	}

	@Override
	public List<Position> selectPositionList() {

		return md.selectPositionList(sqlSession);
	}

	@Override
	public List<Duty> selectDutyList() {

		return md.selectDutyList(sqlSession);
	}

	@Override
	public LoginUser selectLoginUserInfo(LoginUser loginUser) {

		return md.selectLoginUserInfo(sqlSession, loginUser);
	}

	@Override
	public void updateMember(UpdateMember u) {
		
		//System.out.println("insertMember 호출됨");
		md.updateMember(sqlSession, u);
		
	}

	@Override
	public void updateMember(UpdateMember u, Attachment at) {
		//System.out.println("insertMember 호출됨");
		md.updateMember(sqlSession, u);
		
		//System.out.println("회원정보 등록 완료");
		at.setForeignNo(u.getEmpNo());
		//System.out.println("등록한 사번 : " + at.getForeignNo());
		md.deleteMemberAttachment(sqlSession, u.getOriginPicture());
		md.insertMemberAttachment(sqlSession, at);
			
	}

	@Override
	public int pwdCheck(LoginUser changePwd) {
		
		String encPassword = md.selectEncPassword(sqlSession, changePwd);
		
		if(!passwordEncoder.matches(changePwd.getEmpPwd(), encPassword)) {
			//일치하지 않으면 
			return 0;
		} else {
			return 1;
		}		
	}

	@Override
	public int changePwd(ChangePwd changePwd) {

		return md.updatePwd(sqlSession, changePwd);
		
	}

	@Override
	public void updateDetailMember(UpdateMember u) {
		md.updateDetailMember(sqlSession, u);
	}

	@Override
	public int updateDetailMember(UpdateMember u, Attachment at) {
		md.updateDetailMember(sqlSession, u);
		
		at.setForeignNo(u.getEmpNo());
		//System.out.println("등록한 사번 : " + at.getForeignNo());
		md.deleteMemberAttachment(sqlSession, u.getOriginPicture());
		return md.insertMemberAttachment(sqlSession, at);
	}

}
