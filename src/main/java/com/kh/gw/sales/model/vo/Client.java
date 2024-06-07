package com.kh.gw.sales.model.vo;

import java.sql.Date;

public class Client implements java.io.Serializable {
	private String clientNo;
	private String clientId;
	private String clientPwd;
	private String clientEmail;
	private String clientPhone;
	private Date enrollDate;
	private String clientStatus;
	
	public Client() {}

	public Client(String clientNo, String clientId, String clientPwd, String clientEmail, String clientPhone,
			Date enrollDate, String clientStatus) {
		super();
		this.clientNo = clientNo;
		this.clientId = clientId;
		this.clientPwd = clientPwd;
		this.clientEmail = clientEmail;
		this.clientPhone = clientPhone;
		this.enrollDate = enrollDate;
		this.clientStatus = clientStatus;
	}

	public String getClientNo() {
		return clientNo;
	}

	public void setClientNo(String clientNo) {
		this.clientNo = clientNo;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientPwd() {
		return clientPwd;
	}

	public void setClientPwd(String clientPwd) {
		this.clientPwd = clientPwd;
	}

	public String getClientEmail() {
		return clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public String getClientPhone() {
		return clientPhone;
	}

	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getClientStatus() {
		return clientStatus;
	}

	public void setClientStatus(String clientStatus) {
		this.clientStatus = clientStatus;
	}

	@Override
	public String toString() {
		return "Client [clientNo=" + clientNo + ", clientId=" + clientId + ", clientPwd=" + clientPwd + ", clientEmail="
				+ clientEmail + ", clientPhone=" + clientPhone + ", enrollDate=" + enrollDate + ", clientStatus="
				+ clientStatus + "]";
	}
	
	
}
