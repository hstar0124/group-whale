package com.kh.gw.calender.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.calender.model.dao.CalenderDao;
import com.kh.gw.calender.model.vo.Calender;
import com.kh.gw.calender.model.vo.CalenderJSON;
import com.kh.gw.calender.model.vo.CalenderRepeat;

@Service
public class CalenderServiceImpl implements CalenderService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CalenderDao cd;
	
	@Override
	public int insertCalender(Calender c) {
	
		return cd.insertCalender(sqlSession, c);
	}
	
	@Override
	public int insertCalenderRepeat(CalenderRepeat cr) {

		return cd.insertCalenderRepeat(sqlSession, cr);
	}

	@Override
	public List<Calender> selectMyCalenderList(String empNo) {

		return cd.selectMyCalenderList(sqlSession,empNo);
	}

	@Override
	public List<Calender> selectAllCalenderList(String empNo) {

		return cd.selectAllCalenderList(sqlSession,empNo);
	}

	@Override
	public List<Calender> selectExCalenderList(String dutyNo) {

		return cd.selectexCalenderList(sqlSession,dutyNo);
	}
	
	@Override
	public List<Calender> selectMyTeamCalendarList(String deptNo) {

		return cd.selectMyTeamCalenderList(sqlSession,deptNo);
	}
	
	@Override
	public Calender selectOneCalender(Calender c) {
		// TODO Auto-generated method stub
		return cd.selectOneCalender(sqlSession,c);
	}

	@Override
	public int updateCalender(Calender c) {
		// TODO Auto-generated method stub
		return cd.updateCalender(sqlSession,c);
	}

	@Override
	public int deleteCalender(String calNo) {

		return cd.deleteCalender(sqlSession,calNo);
	}


	



	}


