package com.kh.gw.calender.model.vo;

import java.sql.Date;

public class CalenderJSON implements java.io.Serializable {

	private String title;
	private Date start;
	private Date end;
	private boolean allDay = false;
	
	public CalenderJSON() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalenderJSON(String title, Date start, Date end, boolean allDay) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
		this.allDay = allDay;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	@Override
	public String toString() {
		return "CalenderJSON [title=" + title + ", start=" + start + ", end=" + end + ", allDay=" + allDay + "]";
	}
	
	
	
}
