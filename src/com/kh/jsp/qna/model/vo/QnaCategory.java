package com.kh.jsp.qna.model.vo;

public class QnaCategory {

	private int qnaCode;
	private String qnaName;
	public QnaCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaCategory(int qnaCode, String qnaName) {
		super();
		this.qnaCode = qnaCode;
		this.qnaName = qnaName;
	}
	@Override
	public String toString() {
		return "QnaCategory [qnaCode=" + qnaCode + ", qnaName=" + qnaName + "]";
	}
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getQnaName() {
		return qnaName;
	}
	public void setQnaName(String qnaName) {
		this.qnaName = qnaName;
	}

	
	
}
