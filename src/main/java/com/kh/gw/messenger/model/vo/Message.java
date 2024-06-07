package com.kh.gw.messenger.model.vo;

import java.sql.Timestamp;

public class Message implements java.io.Serializable {
//	MESSAGE_NO		VARCHAR2(50 BYTE)	메시지번호		1	
//	ROOM_NO			VARCHAR2(50 BYTE)	채팅방번호
//	SEND_DATE		TIMESTAMP(6)		발송일시
//	EMP_NO			VARCHAR2(50 BYTE)	발송자번호
//	MESSAGE_TYPE	NUMBER				메시지구분(0 : 텍스트 1 : 이미지)
//	MESSAGE_CONTENT	VARCHAR2(2000 BYTE)	메시지내용
	
	private String messageNo;
	private String roomNo;
	private Timestamp sendDate;
	private String empNo;
	private String empName;  		// 조인해서 가져올 사원 이름
	private String positionName;    // 조인해서 가져올 사원 직책명
	private String profilePhoto;    // 조인해서 가져올 사원의 프로필 사진
	private String roomName;        // 조인해서 가져올 방 이름
	private int messageType;
	private String messageContent;
	private String messageFile;
	
	
	public Message() {}


	public Message(String messageNo, String roomNo, Timestamp sendDate, String empNo, String empName,
			String positionName, String profilePhoto, String roomName, int messageType, String messageContent,
			String messageFile) {
		super();
		this.messageNo = messageNo;
		this.roomNo = roomNo;
		this.sendDate = sendDate;
		this.empNo = empNo;
		this.empName = empName;
		this.positionName = positionName;
		this.profilePhoto = profilePhoto;
		this.roomName = roomName;
		this.messageType = messageType;
		this.messageContent = messageContent;
		this.messageFile = messageFile;
	}


	public String getMessageNo() {
		return messageNo;
	}


	public void setMessageNo(String messageNo) {
		this.messageNo = messageNo;
	}


	public String getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}


	public Timestamp getSendDate() {
		return sendDate;
	}


	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
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


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	public int getMessageType() {
		return messageType;
	}


	public void setMessageType(int messageType) {
		this.messageType = messageType;
	}


	public String getMessageContent() {
		return messageContent;
	}


	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	public String getMessageFile() {
		return messageFile;
	}


	public void setMessageFile(String messageFile) {
		this.messageFile = messageFile;
	}


	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", roomNo=" + roomNo + ", sendDate=" + sendDate + ", empNo=" + empNo
				+ ", empName=" + empName + ", positionName=" + positionName + ", profilePhoto=" + profilePhoto
				+ ", roomName=" + roomName + ", messageType=" + messageType + ", messageContent=" + messageContent
				+ ", messageFile=" + messageFile + "]";
	}


	
}
