package com.kh.jsp.member.model.vo;

import java.sql.Date;

public class Member {
	private String member_id;            // 아이디
	private String member_name;          // 이름
    private String member_pwd;           // 비밀번호
    private String member_ssn;           // 생년월일
	private String gender;               // 성별
	private String email;                // 이메일
	private String phone;                // 번호
	private Date join_date;            // 가입일
	private String status;               // 탈퇴여부
	private String report_num;           // 신고누적회수
	
	
	public Member() { }


	public Member(String member_id, String member_name, String member_pwd, String member_ssn, String gender,
			String email, String phone, Date join_date, String status, String report_num) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_pwd = member_pwd;
		this.member_ssn = member_ssn;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.join_date = join_date;
		this.status = status;
		this.report_num = report_num;
	}


	public Member(String member_id, String member_pwd) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
	}


	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_name=" + member_name + ", member_pwd=" + member_pwd
				+ ", member_ssn=" + member_ssn + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", join_date=" + join_date + ", status=" + status + ", report_num=" + report_num + "]";
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getMember_pwd() {
		return member_pwd;
	}


	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}


	public String getMember_ssn() {
		return member_ssn;
	}


	public void setMember_ssn(String member_ssn) {
		this.member_ssn = member_ssn;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getJoin_date() {
		return join_date;
	}


	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getReport_num() {
		return report_num;
	}


	public void setReport_num(String report_num) {
		this.report_num = report_num;
	}
	
	

	
}
