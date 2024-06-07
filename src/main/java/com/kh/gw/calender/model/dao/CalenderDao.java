package com.kh.gw.calender.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.calender.model.vo.Calender;
import com.kh.gw.calender.model.vo.CalenderJSON;
import com.kh.gw.calender.model.vo.CalenderRepeat;

public interface CalenderDao {

	int insertCalender(SqlSessionTemplate sqlSession, Calender c);

	int insertCalenderRepeat(SqlSessionTemplate sqlSession, CalenderRepeat cr);

	List<Calender> selectMyCalenderList(SqlSessionTemplate sqlSession, String empNo);

	List<Calender> selectAllCalenderList(SqlSessionTemplate sqlSession, String empNo);

	Calender selectOneCalender(SqlSessionTemplate sqlSession, Calender c);

	int updateCalender(SqlSessionTemplate sqlSession, Calender c);

	int deleteCalender(SqlSessionTemplate sqlSession, String calNo);

	List<Calender> selectexCalenderList(SqlSessionTemplate sqlSession, String dutyNo);

	List<Calender> selectMyTeamCalenderList(SqlSessionTemplate sqlSession, String deptNo);




}
