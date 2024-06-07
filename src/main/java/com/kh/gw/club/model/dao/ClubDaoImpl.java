package com.kh.gw.club.model.dao;

import org.springframework.stereotype.Repository;

import com.kh.gw.club.model.vo.Club;
import com.kh.gw.club.model.vo.ClubMember;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class ClubDaoImpl implements ClubDao{

	@Override
	public int insertClub(SqlSessionTemplate sqlSession, Club c) {
		//동호회 등록
		return sqlSession.insert("club.insertClub", c);
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Club c) {
		//멤버 등록
		return sqlSession.insert("club.insertMember", c);
	}

	@Override
	public List<Club> selectTotalClubList(SqlSessionTemplate sqlSession) {
		//전체 동호회 목록
		return sqlSession.selectList("club.selectTotalClubList");
	}

	@Override
	public List<Club> selectjoinedClubList(SqlSessionTemplate sqlSession, String empNo) {
		//가입한 동호회 목록
		return sqlSession.selectList("club.selectjoinedClubList", empNo);
	}

	@Override
	public List<ClubMember> selectMemberList(SqlSessionTemplate sqlSession, Club c) {
		//멤버 목록
		return sqlSession.selectList("club.selectMemberList", c);
	}

	@Override
	public int addClubMember(SqlSessionTemplate sqlSession, ClubMember cm) {
		//멤버 추가
		return sqlSession.insert("club.addClubMember", cm);
	}

	@Override
	public int increaseNumberOfMember(SqlSessionTemplate sqlSession, ClubMember cm) {
		//멤버 추가시 멤버 수 증가
		return sqlSession.update("club.increaseNumberOfMember");
	}

}
