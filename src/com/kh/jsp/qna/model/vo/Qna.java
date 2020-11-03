package com.kh.jsp.qna.model.vo;

import java.sql.Date;

public class Qna {
	
	private int qnaNo;
	private String memberId;
	private int qnaCode;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnaAnswer;
	
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Qna(int qnaNo, String memberId, int qnaCode, String qnaTitle, String qnaContent, Date qnaDate,
			String qnaAnswer) {
		super();
		this.qnaNo = qnaNo;
		this.memberId = memberId;
		this.qnaCode = qnaCode;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaAnswer = qnaAnswer;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", memberId=" + memberId + ", qnaCode=" + qnaCode + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate + ", qnaAnswer=" + qnaAnswer + "]";
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	
	

}
