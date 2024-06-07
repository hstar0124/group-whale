package com.kh.gw.approval.model.vo;

public class ApprovalLine implements java.io.Serializable {
	private String lineNo;
	private String lineName;
	private int lineSave;
	private String empNo;
	private int lineTurn;
	
	public ApprovalLine() {}

	public ApprovalLine(String lineNo, String lineName, int lineSave, String empNo, int lineTurn) {
		super();
		this.lineNo = lineNo;
		this.lineName = lineName;
		this.lineSave = lineSave;
		this.empNo = empNo;
		this.lineTurn = lineTurn;
	}

	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}

	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}

	public int getLineSave() {
		return lineSave;
	}

	public void setLineSave(int lineSave) {
		this.lineSave = lineSave;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public int getLineTurn() {
		return lineTurn;
	}

	public void setLineTurn(int lineTurn) {
		this.lineTurn = lineTurn;
	}

	@Override
	public String toString() {
		return "ApprovalLine [lineNo=" + lineNo + ", lineName=" + lineName + ", lineSave=" + lineSave + ", empNo="
				+ empNo + ", lineTurn=" + lineTurn + "]";
	}
	
}
