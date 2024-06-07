package com.kh.gw.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.member.model.exception.LoginException;
import com.kh.gw.member.model.vo.Attachment;
import com.kh.gw.member.model.vo.ChangePwd;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.UpdateMember;

public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException;

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	String selectEncPassword(SqlSessionTemplate sqlSession, LoginUser m);

	LoginUser selectMember(SqlSessionTemplate sqlSession, LoginUser m);

	int empNoCheck(SqlSessionTemplate sqlSession, Member empNoCheck);

	List<Member> selectMemberList(SqlSessionTemplate sqlSession);

	List<Position> selectPositionList(SqlSessionTemplate sqlSession);

	List<Duty> selectDutyList(SqlSessionTemplate sqlSession);

	int insertMemberAttachment(SqlSessionTemplate sqlSession, Attachment at);

	LoginUser selectLoginUserInfo(SqlSessionTemplate sqlSession, LoginUser loginUser);

	int updateMember(SqlSessionTemplate sqlSession, UpdateMember u);

	int deleteMemberAttachment(SqlSessionTemplate sqlSession, String originPicture);

	int updatePwd(SqlSessionTemplate sqlSession, ChangePwd changePwd);

	int updateDetailMember(SqlSessionTemplate sqlSession, UpdateMember u);



}
