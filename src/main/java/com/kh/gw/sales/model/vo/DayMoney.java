package com.kh.gw.sales.model.vo;

import java.sql.Date;

public class DayMoney implements java.io.Serializable {
	private Date day;
	private int money;
	private Date startDay;
	private Date endDay;
	
	public DayMoney() {}

	public DayMoney(Date day, int money, Date startDay, Date endDay) {
		super();
		this.day = day;
		this.money = money;
		this.startDay = startDay;
		this.endDay = endDay;
	}

	
	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getEndDay() {
		return endDay;
	}

	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}

	@Override
	public String toString() {
		return "DayMoney [day=" + day + ", money=" + money + ", startDay=" + startDay + ", endDay=" + endDay + "]";
	}

	
}
