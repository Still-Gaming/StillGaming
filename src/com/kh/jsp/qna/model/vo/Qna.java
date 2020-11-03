package com.kh.jsp.qna.model.vo;

import java.sql.Date;

public class Qna {
	
	private int qna_no;
	private String member_id;
	private int qna_code;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private String qna_answer;
	
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qna(int qna_no, String member_id, int qna_code, String qna_title, String qna_content, Date qna_date,
			String qna_answer) {
		super();
		this.qna_no = qna_no;
		this.member_id = member_id;
		this.qna_code = qna_code;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_answer = qna_answer;
	}
	@Override
	public String toString() {
		return "Qna [qna_no=" + qna_no + ", member_id=" + member_id + ", qna_code=" + qna_code + ", qna_title="
				+ qna_title + ", qna_content=" + qna_content + ", qna_date=" + qna_date + ", qna_answer=" + qna_answer
				+ "]";
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	
	

}
