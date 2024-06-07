package com.kh.gw.member.model.service;

import java.util.List;

import com.kh.gw.member.model.exception.LoginException;
import com.kh.gw.member.model.vo.Attachment;
import com.kh.gw.member.model.vo.ChangePwd;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.LoginUser;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.UpdateMember;

public interface MemberService {

	LoginUser loginMember(LoginUser m) throws LoginException;

	int insertMember(Member m, Attachment at);

	int empNoCheck(Member empNoCheck);

	List<Member> selectMemberList();

	List<Position> selectPositionList();

	List<Duty> selectDutyList();

	LoginUser selectLoginUserInfo(LoginUser loginUser);

	void updateMember(UpdateMember u);

	void updateMember(UpdateMember u, Attachment at);

	int pwdCheck(LoginUser changePwd);

	int changePwd(ChangePwd changePwd);

	void updateDetailMember(UpdateMember u);

	int updateDetailMember(UpdateMember u, Attachment at);

	
}
