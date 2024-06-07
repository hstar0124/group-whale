package com.kh.gw.todo.model.vo;

public class Label implements java.io.Serializable {
	private String labelNo;
	private String cardNo;
	private String colorNo;
	private String labelDeleteYN;
	
	public Label() {}

	public Label(String labelNo, String cardNo, String colorNo, String labelDeleteYN) {
		super();
		this.labelNo = labelNo;
		this.cardNo = cardNo;
		this.colorNo = colorNo;
		this.labelDeleteYN = labelDeleteYN;
	}

	public String getLabelNo() {
		return labelNo;
	}

	public void setLabelNo(String labelNo) {
		this.labelNo = labelNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getColorNo() {
		return colorNo;
	}

	public void setColorNo(String colorNo) {
		this.colorNo = colorNo;
	}

	public String getLabelDeleteYN() {
		return labelDeleteYN;
	}

	public void setLabelDeleteYN(String labelDeleteYN) {
		this.labelDeleteYN = labelDeleteYN;
	}

	@Override
	public String toString() {
		return "Label [labelNo=" + labelNo + ", cardNo=" + cardNo + ", colorNo=" + colorNo + ", labelDeleteYN="
				+ labelDeleteYN + "]";
	}

	
}
