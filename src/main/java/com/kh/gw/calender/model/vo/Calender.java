package com.kh.gw.calender.model.vo;

import java.sql.Timestamp;

public class Calender implements java.io.Serializable{
//	CAL_NO	VARCHAR2(50 BYTE)
//	EMP_NO	VARCHAR2(50 BYTE)
//	ATTENDEE_NO	VARCHAR2(200 BYTE)
//	CAL_PLACE	VARCHAR2(100 BYTE)
//	CAL_KIND	VARCHAR2(50 BYTE)
//	CAL_CATEGORY	VARCHAR2(50 BYTE)
//	CAL_START	TIMESTAMP(6)
//	CAL_END	TIMESTAMP(6)
//	CAL_REPEAT	VARCHAR2(50 BYTE)
//	CAL_TITLE	VARCHAR2(100 BYTE)
//	CAL_CONTENT	VARCHAR2(200 BYTE)
//	CAL_ENROLL_DATE	TIMESTAMP(6)
//	CAL_MODIFY_DATE	TIMESTAMP(6)
//	CAL_STATUS	VARCHAR2(50 BYTE)
//	CAL_ALERT	VARCHAR2(50 BYTE)
	//Timestamp format must be yyyy-mm-dd hh:mm:ss[.fffffffff]
	private String calNo; 
	private String empNo;
	private String attendeeNo; //참석자 ★★★★★
	private String calPlace;  //일정장소
	private String calKind; //일정 종류(전사일정,내 일정,....)
	private String calCategory; //일정범주(업무,증요,....)
	private Timestamp calStart; //일성시작일시 // 날짜,시간 따로 받아야 될 것 같은데 ,,! 종일일수도있으니까
	private Timestamp calEnd; //일정종료일시
	private String calRepeat; //반복여부 ★★★★★
	private String calTitle;  //일정제목
	private String calContent; //일정내용
	private Timestamp calEnrollDate; //일정등록일시
	private Timestamp calModifyDate; //일정수정일시
	private String calStatus; //삭제여부 
	private String calAlert; //알림여부 ★★★★★
	private String dutyNo;
	private String deptNo;
	private CalenderRepeat calenderrepeat;
	
	public Calender() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calender(String calNo, String empNo, String attendeeNo, String calPlace, String calKind, String calCategory,
			Timestamp calStart, Timestamp calEnd, String calRepeat, String calTitle, String calContent,
			Timestamp calEnrollDate, Timestamp calModifyDate, String calStatus, String calAlert, String dutyNo,
			String deptNo, CalenderRepeat calenderrepeat) {
		super();
		this.calNo = calNo;
		this.empNo = empNo;
		this.attendeeNo = attendeeNo;
		this.calPlace = calPlace;
		this.calKind = calKind;
		this.calCategory = calCategory;
		this.calStart = calStart;
		this.calEnd = calEnd;
		this.calRepeat = calRepeat;
		this.calTitle = calTitle;
		this.calContent = calContent;
		this.calEnrollDate = calEnrollDate;
		this.calModifyDate = calModifyDate;
		this.calStatus = calStatus;
		this.calAlert = calAlert;
		this.dutyNo = dutyNo;
		this.deptNo = deptNo;
		this.calenderrepeat = calenderrepeat;
	}

	public String getCalNo() {
		return calNo;
	}

	public void setCalNo(String calNo) {
		this.calNo = calNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getAttendeeNo() {
		return attendeeNo;
	}

	public void setAttendeeNo(String attendeeNo) {
		this.attendeeNo = attendeeNo;
	}

	public String getCalPlace() {
		return calPlace;
	}

	public void setCalPlace(String calPlace) {
		this.calPlace = calPlace;
	}

	public String getCalKind() {
		return calKind;
	}

	public void setCalKind(String calKind) {
		this.calKind = calKind;
	}

	public String getCalCategory() {
		return calCategory;
	}

	public void setCalCategory(String calCategory) {
		this.calCategory = calCategory;
	}

	public Timestamp getCalStart() {
		return calStart;
	}

	public void setCalStart(Timestamp calStart) {
		this.calStart = calStart;
	}

	public Timestamp getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(Timestamp calEnd) {
		this.calEnd = calEnd;
	}

	public String getCalRepeat() {
		return calRepeat;
	}

	public void setCalRepeat(String calRepeat) {
		this.calRepeat = calRepeat;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	public Timestamp getCalEnrollDate() {
		return calEnrollDate;
	}

	public void setCalEnrollDate(Timestamp calEnrollDate) {
		this.calEnrollDate = calEnrollDate;
	}

	public Timestamp getCalModifyDate() {
		return calModifyDate;
	}

	public void setCalModifyDate(Timestamp calModifyDate) {
		this.calModifyDate = calModifyDate;
	}

	public String getCalStatus() {
		return calStatus;
	}

	public void setCalStatus(String calStatus) {
		this.calStatus = calStatus;
	}

	public String getCalAlert() {
		return calAlert;
	}

	public void setCalAlert(String calAlert) {
		this.calAlert = calAlert;
	}

	public String getDutyNo() {
		return dutyNo;
	}

	public void setDutyNo(String dutyNo) {
		this.dutyNo = dutyNo;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public CalenderRepeat getCalenderrepeat() {
		return calenderrepeat;
	}

	public void setCalenderrepeat(CalenderRepeat calenderrepeat) {
		this.calenderrepeat = calenderrepeat;
	}

	@Override
	public String toString() {
		return "Calender [calNo=" + calNo + ", empNo=" + empNo + ", attendeeNo=" + attendeeNo + ", calPlace=" + calPlace
				+ ", calKind=" + calKind + ", calCategory=" + calCategory + ", calStart=" + calStart + ", calEnd="
				+ calEnd + ", calRepeat=" + calRepeat + ", calTitle=" + calTitle + ", calContent=" + calContent
				+ ", calEnrollDate=" + calEnrollDate + ", calModifyDate=" + calModifyDate + ", calStatus=" + calStatus
				+ ", calAlert=" + calAlert + ", dutyNo=" + dutyNo + ", deptNo=" + deptNo + ", calenderrepeat="
				+ calenderrepeat + "]";
	}

	
	
	
}
