package com.kh.gw.club.model.service;

import java.util.List;

import com.kh.gw.club.model.vo.Club;
import com.kh.gw.club.model.vo.ClubMember;

public interface ClubService {

	int insertClub(Club c);

	int insertMember(Club c);

	List<Club> selectTotalClubList();

	List<Club> selectjoinedClubList(String empNo);

	List<ClubMember> selectMemberList(Club c);

	int addClubMember(ClubMember cm);

	int increaseNumberOfMember(ClubMember cm);

}
