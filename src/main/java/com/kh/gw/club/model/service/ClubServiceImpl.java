package com.kh.gw.club.model.service;

import org.springframework.stereotype.Service;

import com.kh.gw.club.model.dao.ClubDao;
import com.kh.gw.club.model.vo.Club;
import com.kh.gw.club.model.vo.ClubMember;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class ClubServiceImpl implements ClubService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubDao dao;

	@Override
	public int insertClub(Club c) {
		//동호회 등록
		return dao.insertClub(sqlSession, c);
	}

	@Override
	public int insertMember(Club c) {
		//멤버 등록
		return dao.insertMember(sqlSession, c);
	}

	@Override
	public List<Club> selectTotalClubList() {
		//전체 동호회 목록
		return dao.selectTotalClubList(sqlSession);
	}

	@Override
	public List<Club> selectjoinedClubList(String empNo) {
		//가입한 동호회 목록
		return dao.selectjoinedClubList(sqlSession, empNo);
	}

	@Override
	public List<ClubMember> selectMemberList(Club c) {
		//멤버 목록
		return dao.selectMemberList(sqlSession, c);
	}

	@Override
	public int addClubMember(ClubMember cm) {
		//멤버 추가
		return dao.addClubMember(sqlSession, cm);
	}

	@Override
	public int increaseNumberOfMember(ClubMember cm) {
		//멤버 추가시 멤버 수 증가
		return dao.increaseNumberOfMember(sqlSession, cm);
	}

}
