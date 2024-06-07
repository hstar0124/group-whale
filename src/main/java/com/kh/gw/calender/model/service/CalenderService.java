package com.kh.gw.calender.model.service;

import java.util.List;

import com.kh.gw.calender.model.vo.Calender;
import com.kh.gw.calender.model.vo.CalenderJSON;
import com.kh.gw.calender.model.vo.CalenderRepeat;

public interface CalenderService {

	int insertCalender(Calender c);

	int insertCalenderRepeat(CalenderRepeat cr);
	
	List<Calender> selectMyCalenderList(String empNo);

	List<Calender> selectAllCalenderList(String empNo);

	Calender selectOneCalender(Calender c);

	int updateCalender(Calender c);

	int deleteCalender(String calNo);

	List<Calender> selectExCalenderList(String dutyNo);

	List<Calender> selectMyTeamCalendarList(String deptNo);




	
	
}
