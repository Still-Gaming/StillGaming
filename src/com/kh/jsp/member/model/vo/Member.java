package com.kh.jsp.member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId;            // 아이디
	private String memberName;          // 이름
    private String memberPwd;           // 비밀번호
    private String memberSsn;           // 생년월일
	private String gender;              // 성별
	private String email;               // 이메일
	private String phone;               // 번호
	private Date joinDate;            // 가입일
	private String status;              // 탈퇴여부
	private int reportNum;           // 신고누적회수
	
	
	public Member() { }


	public Member(String memberId, String memberName, String memberPwd, String memberSsn, String gender, String email,
			String phone, Date joinDate, String status, int reportNum) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPwd = memberPwd;
		this.memberSsn = memberSsn;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.joinDate = joinDate;
		this.status = status;
		this.reportNum = reportNum;
	}


	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}


	public Member(String memberId, String memberName, String memberPwd, String memberSsn, String gender, String email,
			String phone) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPwd = memberPwd;
		this.memberSsn = memberSsn;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", memberPwd=" + memberPwd
				+ ", memberSsn=" + memberSsn + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", joinDate=" + joinDate + ", status=" + status + ", reportNum=" + reportNum + "]";
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberPwd() {
		return memberPwd;
	}


	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}


	public String getMemberSsn() {
		return memberSsn;
	}


	public void setMemberSsn(String memberSsn) {
		this.memberSsn = memberSsn;
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


	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getReportNum() {
		return reportNum;
	}


	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}



	

	
}
