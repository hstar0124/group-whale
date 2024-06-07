package com.kh.gw.settings.model.vo;

public class CountMember {
	
	private String allEmp;
	private String leaveEmp;
	private String deleteEmp;
	
	public CountMember() {}

	public CountMember(String allEmp, String leaveEmp, String deleteEmp) {
		super();
		this.allEmp = allEmp;
		this.leaveEmp = leaveEmp;
		this.deleteEmp = deleteEmp;
	}

	public String getAllEmp() {
		return allEmp;
	}

	public void setAllEmp(String allEmp) {
		this.allEmp = allEmp;
	}

	public String getLeaveEmp() {
		return leaveEmp;
	}

	public void setLeaveEmp(String leaveEmp) {
		this.leaveEmp = leaveEmp;
	}

	public String getDeleteEmp() {
		return deleteEmp;
	}

	public void setDeleteEmp(String deleteEmp) {
		this.deleteEmp = deleteEmp;
	}

	@Override
	public String toString() {
		return "CountMember [allEmp=" + allEmp + ", leaveEmp=" + leaveEmp + ", deleteEmp=" + deleteEmp + "]";
	}
	
	
}
