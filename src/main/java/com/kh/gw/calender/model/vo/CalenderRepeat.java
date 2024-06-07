package com.kh.gw.calender.model.vo;

public class CalenderRepeat implements java.io.Serializable{
//	CAL_REPEAT_NO
//	CAL_NO
//	CYCLE
//	HOWMANY
//	CYCLE_WEEK
//	CYCLE_MONTY
//	END_OPTION
//	END_OPTION_DAY
//	END_OPTION_COUNT
	private String calRepeatNo;
	private String cycle;
	private String howmany;
	private String cycleWeek;
	private String cycleMonty;
	private String endOption;
	private String endOptionDay;
	private String endOptionCount;
	public CalenderRepeat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalenderRepeat(String calRepeatNo, String cycle, String howmany, String cycleWeek, String cycleMonty,
			String endOption, String endOptionDay, String endOptionCount) {
		super();
		this.calRepeatNo = calRepeatNo;
		this.cycle = cycle;
		this.howmany = howmany;
		this.cycleWeek = cycleWeek;
		this.cycleMonty = cycleMonty;
		this.endOption = endOption;
		this.endOptionDay = endOptionDay;
		this.endOptionCount = endOptionCount;
	}
	public String getCalRepeatNo() {
		return calRepeatNo;
	}
	public void setCalRepeatNo(String calRepeatNo) {
		this.calRepeatNo = calRepeatNo;
	}
	public String getCycle() {
		return cycle;
	}
	public void setCycle(String cycle) {
		this.cycle = cycle;
	}
	public String getHowmany() {
		return howmany;
	}
	public void setHowmany(String howmany) {
		this.howmany = howmany;
	}
	public String getCycleWeek() {
		return cycleWeek;
	}
	public void setCycleWeek(String cycleWeek) {
		this.cycleWeek = cycleWeek;
	}
	public String getCycleMonty() {
		return cycleMonty;
	}
	public void setCycleMonty(String cycleMonty) {
		this.cycleMonty = cycleMonty;
	}
	public String getEndOption() {
		return endOption;
	}
	public void setEndOption(String endOption) {
		this.endOption = endOption;
	}
	public String getEndOptionDay() {
		return endOptionDay;
	}
	public void setEndOptionDay(String endOptionDay) {
		this.endOptionDay = endOptionDay;
	}
	public String getEndOptionCount() {
		return endOptionCount;
	}
	public void setEndOptionCount(String endOptionCount) {
		this.endOptionCount = endOptionCount;
	}
	@Override
	public String toString() {
		return "CalenderRepeat [calRepeatNo=" + calRepeatNo + ", cycle=" + cycle + ", howmany=" + howmany
				+ ", cycleWeek=" + cycleWeek + ", cycleMonty=" + cycleMonty + ", endOption=" + endOption
				+ ", endOptionDay=" + endOptionDay + ", endOptionCount=" + endOptionCount + "]";
	}

	
	
}
