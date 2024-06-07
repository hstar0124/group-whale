package com.kh.gw.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.member.model.exception.LoginException;
import com.kh.gw.member.model.vo.Attachment;
import com.kh.gw.member.model.vo.ChangePwd;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.UpdateMember;

@Repository
public class MemberDaoImpl implements MemberDao{


//	@Override
//	public Member loginCheck(SqlSessionTemplate sqlSession, Member m){
//
//		//System.out.println("Dao M : " + m);
//		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
//		
//		System.out.println("Dao loginUser : " + loginUser);
//		
//		return loginUser;
//	}
	
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException {

		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		
		System.out.println("Dao loginUser : " + loginUser);
		//여기 에러는 memberDao 타입의 bean이 없어서 처음엔 에러
	    //2번째는 mapper등록을 안해줬다!!!!
        //3번째는 mybatis-config.xml에서 설정해주자. 거기서 mapper 등록이랑 별칭 등록하는 작업해줘야 한다! 
		//로그언 정보 잘 조회해오면 성공!
		
		if(loginUser == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}		
		return loginUser;
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertMember", m);
		
	}

//	@Override
//	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
//		
//		return sqlSession.selectOne("Member.selectPwd", m.getEmpNo());
//	}
//
//	@Override
//	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
//		
//		return sqlSession.selectOne("Member.selectLoginUser", m);
//	}

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, LoginUser m) {
		
		return sqlSession.selectOne("Member.selectPwd", m.getEmpNo());
	}

	@Override
	public LoginUser selectMember(SqlSessionTemplate sqlSession, LoginUser m) {
		
		return sqlSession.selectOne("Member.selectLoginUserInfo", m);
	}
	
	@Override
	public int empNoCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectEmpNoMatching", m.getEmpNo());
	}

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Member.selectMemberList");
	}

	@Override
	public List<Position> selectPositionList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Member.selectPositionList");
	}

	@Override
	public List<Duty> selectDutyList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Member.selectDutyList");
	}

	@Override
	public int insertMemberAttachment(SqlSessionTemplate sqlSession, Attachment at) {

		return sqlSession.insert("Member.insertMemberAttachment", at);
	}

	@Override
	public LoginUser selectLoginUserInfo(SqlSessionTemplate sqlSession, LoginUser loginUser) {

		return sqlSession.selectOne("Member.selectLoginUserInfo", loginUser);
	}

	@Override
	public int updateMember(SqlSessionTemplate sqlSession, UpdateMember u) {
		return sqlSession.update("Member.updateMember", u);
	}

	@Override
	public int deleteMemberAttachment(SqlSessionTemplate sqlSession, String originPicture) {
		
		return sqlSession.delete("Member.deleteMemberAttachment", originPicture);
	}

	@Override
	public int updatePwd(SqlSessionTemplate sqlSession, ChangePwd changePwd) {
		
		return sqlSession.update("Member.updateMemberPwd", changePwd);		
	}

	@Override
	public int updateDetailMember(SqlSessionTemplate sqlSession, UpdateMember u) {

		return sqlSession.update("Member.updateDetailMember", u);
	}

	

}
