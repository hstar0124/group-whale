package com.kh.gw.calender.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gw.calender.model.vo.Calender;
import com.kh.gw.calender.model.vo.CalenderJSON;
import com.kh.gw.calender.model.vo.CalenderRepeat;

@Repository
public class CalenderDaoImpl implements CalenderDao {

	@Override
	public int insertCalender(SqlSessionTemplate sqlSession, Calender c) {

		return sqlSession.insert("Calender.insertCalender", c);
	}
	
	@Override
	public int insertCalenderRepeat(SqlSessionTemplate sqlSession, CalenderRepeat cr) {

		return sqlSession.insert("Calender.insertCalenderRepeat", cr);
	}

	@Override
	public List<Calender> selectMyCalenderList(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Calender.selectMyCalenderList",empNo);
	}

	@Override
	public List<Calender> selectAllCalenderList(SqlSessionTemplate sqlSession, String empNo) {

		return sqlSession.selectList("Calender.selectAllCalenderList",empNo);
	}
	
	@Override
	public List<Calender> selectexCalenderList(SqlSessionTemplate sqlSession, String dutyNo) {

		return sqlSession.selectList("Calender.selectExCalenderList",dutyNo);
	}
	
	@Override
	public List<Calender> selectMyTeamCalenderList(SqlSessionTemplate sqlSession, String deptNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Calender.selectMyTeamCalenderList",deptNo);
	}

	@Override
	public Calender selectOneCalender(SqlSessionTemplate sqlSession, Calender c) {

		return sqlSession.selectOne("Calender.selectOneCalender",c);
	}

	@Override
	public int updateCalender(SqlSessionTemplate sqlSession, Calender c) {
		return sqlSession.update("Calender.updateCalender",c);
	}

	@Override
	public int deleteCalender(SqlSessionTemplate sqlSession, String calNo) {
	
		return sqlSession.delete("Calender.deleteCalender", calNo);
	}





}
