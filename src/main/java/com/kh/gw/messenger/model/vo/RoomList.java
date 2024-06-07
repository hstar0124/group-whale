package com.kh.gw.messenger.model.vo;

public class RoomList implements java.io.Serializable {
	private String roomNo;
	private String empNo;
	private String empName; 	 // 조인해서 가져올 사원명
	private String positionName; // 조인해서 가져올 직책명
	private String photoName;	 // 조인해서 가져올 프로필 사진명
	private String roomListYn;	 
	
	public RoomList() {}

	public RoomList(String roomNo, String empNo, String empName, String positionName, String photoName,
			String roomListYn) {
		super();
		this.roomNo = roomNo;
		this.empNo = empNo;
		this.empName = empName;
		this.positionName = positionName;
		this.photoName = photoName;
		this.roomListYn = roomListYn;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
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

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getRoomListYn() {
		return roomListYn;
	}

	public void setRoomListYn(String roomListYn) {
		this.roomListYn = roomListYn;
	}

	@Override
	public String toString() {
		return "RoomList [roomNo=" + roomNo + ", empNo=" + empNo + ", empName=" + empName + ", positionName="
				+ positionName + ", photoName=" + photoName + ", roomListYn=" + roomListYn + "]";
	}

	
}
