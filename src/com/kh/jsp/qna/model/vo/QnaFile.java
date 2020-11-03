package com.kh.jsp.qna.model.vo;

import java.sql.Date;

public class QnaFile {

	private int qna_fno;
	private int qna_no;
	private String qna_origin;
	private String qna_change;
	private String qna_path;
	private Date qna_filedate;
	public QnaFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaFile(int qna_fno, int qna_no, String qna_origin, String qna_change, String qna_path, Date qna_filedate) {
		super();
		this.qna_fno = qna_fno;
		this.qna_no = qna_no;
		this.qna_origin = qna_origin;
		this.qna_change = qna_change;
		this.qna_path = qna_path;
		this.qna_filedate = qna_filedate;
	}
	@Override
	public String toString() {
		return "QnaFile [qna_fno=" + qna_fno + ", qna_no=" + qna_no + ", qna_origin=" + qna_origin + ", qna_change="
				+ qna_change + ", qna_path=" + qna_path + ", qna_filedate=" + qna_filedate + "]";
	}
	public int getQna_fno() {
		return qna_fno;
	}
	public void setQna_fno(int qna_fno) {
		this.qna_fno = qna_fno;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_origin() {
		return qna_origin;
	}
	public void setQna_origin(String qna_origin) {
		this.qna_origin = qna_origin;
	}
	public String getQna_change() {
		return qna_change;
	}
	public void setQna_change(String qna_change) {
		this.qna_change = qna_change;
	}
	public String getQna_path() {
		return qna_path;
	}
	public void setQna_path(String qna_path) {
		this.qna_path = qna_path;
	}
	public Date getQna_filedate() {
		return qna_filedate;
	}
	public void setQna_filedate(Date qna_filedate) {
		this.qna_filedate = qna_filedate;
	}
	
	
}
