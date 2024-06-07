package com.kh.gw.club.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.club.model.vo.Club;
import com.kh.gw.club.model.vo.ClubMember;

public interface ClubDao {

	int insertClub(SqlSessionTemplate sqlSession, Club c);

	int insertMember(SqlSessionTemplate sqlSession, Club c);

	List<Club> selectTotalClubList(SqlSessionTemplate sqlSession);

	List<Club> selectjoinedClubList(SqlSessionTemplate sqlSession, String empNo);

	List<ClubMember> selectMemberList(SqlSessionTemplate sqlSession, Club c);

	int addClubMember(SqlSessionTemplate sqlSession, ClubMember cm);

	int increaseNumberOfMember(SqlSessionTemplate sqlSession, ClubMember cm);

}
