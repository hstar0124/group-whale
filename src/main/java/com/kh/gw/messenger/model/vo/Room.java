package com.kh.gw.messenger.model.vo;

import java.sql.Timestamp;

public class Room implements java.io.Serializable {
//	ROOM_NO		VARCHAR2(50 BYTE)	채팅방번호
//	ROOM_NAME	VARCHAR2(100 BYTE)	채팅방이름
//	CREATE_DATE	TIMESTAMP(6)		생성일자
//	ROOM_STATUS	VARCHAR2(10 BYTE)	삭제여부(Y : 미삭제 N : 삭제)
	
	private String roomNo;
	private String roomName;
	private Timestamp createDate;
	private String roomStatus;
	private String roomImg;
	private String empNo;			 // 조인해서 가져올 사원번호
	private String empName;			 // 조인해서 가져올 사원명
	private String positionName;     // 조인해서 가져올 사원의 직책명
	private String profilePhoto;     // 조인해서 가져올 사원의 프로필 사진
	private String messageContent;	 // 조인해서 가져올 메시지 내용 
	private Timestamp sendDate;      // 조인해서 가져올 메시지 전송 시간
	
	public Room() {}

	public Room(String roomNo, String roomName, Timestamp createDate, String roomStatus, String roomImg, String empNo,
			String empName, String positionName, String profilePhoto, String messageContent, Timestamp sendDate) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.createDate = createDate;
		this.roomStatus = roomStatus;
		this.roomImg = roomImg;
		this.empNo = empNo;
		this.empName = empName;
		this.positionName = positionName;
		this.profilePhoto = profilePhoto;
		this.messageContent = messageContent;
		this.sendDate = sendDate;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getRoomStatus() {
		return roomStatus;
	}

	public void setRoomStatus(String roomStatus) {
		this.roomStatus = roomStatus;
	}

	public String getRoomImg() {
		return roomImg;
	}

	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Timestamp getSendDate() {
		return sendDate;
	}

	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomName=" + roomName + ", createDate=" + createDate + ", roomStatus="
				+ roomStatus + ", roomImg=" + roomImg + ", empNo=" + empNo + ", empName=" + empName + ", positionName="
				+ positionName + ", profilePhoto=" + profilePhoto + ", messageContent=" + messageContent + ", sendDate="
				+ sendDate + "]";
	}

}
