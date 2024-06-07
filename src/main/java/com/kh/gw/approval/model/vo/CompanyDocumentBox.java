package com.kh.gw.approval.model.vo;

public class CompanyDocumentBox implements java.io.Serializable {
	private String cboxNo;
	private int depth;
	private String path;
	private String cboxName;
	private String parentNo;
	private int childExist;
	
	public CompanyDocumentBox() {}

	public CompanyDocumentBox(String cboxNo, int depth, String path, String cboxName, String parentNo, int childExist) {
		super();
		this.cboxNo = cboxNo;
		this.depth = depth;
		this.path = path;
		this.cboxName = cboxName;
		this.parentNo = parentNo;
		this.childExist = childExist;
	}

	public String getCboxNo() {
		return cboxNo;
	}

	public void setCboxNo(String cboxNo) {
		this.cboxNo = cboxNo;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getCboxName() {
		return cboxName;
	}

	public void setCboxName(String cboxName) {
		this.cboxName = cboxName;
	}

	public String getParentNo() {
		return parentNo;
	}

	public void setParentNo(String parentNo) {
		this.parentNo = parentNo;
	}

	public int getChildExist() {
		return childExist;
	}

	public void setChildExist(int childExist) {
		this.childExist = childExist;
	}

	@Override
	public String toString() {
		return "CompanyDocumentBox [cboxNo=" + cboxNo + ", depth=" + depth + ", path=" + path + ", cboxName=" + cboxName
				+ ", parentNo=" + parentNo + ", childExist=" + childExist + "]";
	}
	
}
