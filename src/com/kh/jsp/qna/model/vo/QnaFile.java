package com.kh.jsp.qna.model.vo;

import java.sql.Date;

public class QnaFile {

	private int qnaFno;
	private int qnaNo;
	private String qnaOrigin;
	private String qnaChange;
	private String qnaPath;
	private Date qnaFiledate;
	public QnaFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaFile(int qnaFno, int qnaNo, String qnaOrigin, String qnaChange, String qnaPath, Date qnaFiledate) {
		super();
		this.qnaFno = qnaFno;
		this.qnaNo = qnaNo;
		this.qnaOrigin = qnaOrigin;
		this.qnaChange = qnaChange;
		this.qnaPath = qnaPath;
		this.qnaFiledate = qnaFiledate;
	}
	
	public QnaFile(String qnaOrigin, String qnaChange, String qnaPath) {
		super();
		this.qnaOrigin = qnaOrigin;
		this.qnaChange = qnaChange;
		this.qnaPath = qnaPath;
	}
	@Override
	public String toString() {
		return "QnaFile [qnaFno=" + qnaFno + ", qnaNo=" + qnaNo + ", qnaOrigin=" + qnaOrigin + ", qnaChange="
				+ qnaChange + ", qnaPath=" + qnaPath + ", qnaFiledate=" + qnaFiledate + "]";
	}
	public int getQnaFno() {
		return qnaFno;
	}
	public void setQnaFno(int qnaFno) {
		this.qnaFno = qnaFno;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaOrigin() {
		return qnaOrigin;
	}
	public void setQnaOrigin(String qnaOrigin) {
		this.qnaOrigin = qnaOrigin;
	}
	public String getQnaChange() {
		return qnaChange;
	}
	public void setQnaChange(String qnaChange) {
		this.qnaChange = qnaChange;
	}
	public String getQnaPath() {
		return qnaPath;
	}
	public void setQnaPath(String qnaPath) {
		this.qnaPath = qnaPath;
	}
	public Date getQnaFiledate() {
		return qnaFiledate;
	}
	public void setQnaFiledate(Date qnaFiledate) {
		this.qnaFiledate = qnaFiledate;
	}
	
	
	
}
