package com.kh.gw.sales.model.vo;

public class Request implements java.io.Serializable {
	private String requestNo;
	private String requestType;
	private String requestContent;
	private String requestName;
	private String requestPhone;
	private String requestEmail;
	private String requestDate;
	private String requestStatus;
	
	public Request() {}

	public Request(String requestNo, String requestType, String requestContent, String requestName, String requestPhone,
			String requestEmail, String requestDate, String requestStatus) {
		super();
		this.requestNo = requestNo;
		this.requestType = requestType;
		this.requestContent = requestContent;
		this.requestName = requestName;
		this.requestPhone = requestPhone;
		this.requestEmail = requestEmail;
		this.requestDate = requestDate;
		this.requestStatus = requestStatus;
	}

	public String getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(String requestNo) {
		this.requestNo = requestNo;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public String getRequestName() {
		return requestName;
	}

	public void setRequestName(String requestName) {
		this.requestName = requestName;
	}

	public String getRequestPhone() {
		return requestPhone;
	}

	public void setRequestPhone(String requestPhone) {
		this.requestPhone = requestPhone;
	}

	public String getRequestEmail() {
		return requestEmail;
	}

	public void setRequestEmail(String requestEmail) {
		this.requestEmail = requestEmail;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	@Override
	public String toString() {
		return "Request [requestNo=" + requestNo + ", requestType=" + requestType + ", requestContent=" + requestContent
				+ ", requestName=" + requestName + ", requestPhone=" + requestPhone + ", requestEmail=" + requestEmail
				+ ", requestDate=" + requestDate + ", requestStatus=" + requestStatus + "]";
	}
	
}
