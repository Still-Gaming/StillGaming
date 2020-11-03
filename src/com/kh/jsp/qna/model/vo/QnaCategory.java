package com.kh.jsp.qna.model.vo;

public class QnaCategory {

	private int qna_code;
	private String qna_name;
	public QnaCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaCategory(int qna_code, String qna_name) {
		super();
		this.qna_code = qna_code;
		this.qna_name = qna_name;
	}
	@Override
	public String toString() {
		return "QnaCategory [qna_code=" + qna_code + ", qna_name=" + qna_name + "]";
	}
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	public String getQna_name() {
		return qna_name;
	}
	public void setQna_name(String qna_name) {
		this.qna_name = qna_name;
	}
	
	
}
