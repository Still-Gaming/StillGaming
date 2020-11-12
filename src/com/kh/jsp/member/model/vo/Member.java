package com.kh.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

// VO ( Value Object : Domain, DTO, Entity )
// 데이터 전달용 그릇
public class Member implements Serializable {

	/**
	 * 다른 위치(패키지)에 정의된 Member 클래스가 있을 경우
	 * 이를 헷갈리지 않게 하기 위한 전용 ID 번호 설정
	 * ex) ISBN, RRN(주민번호)
	 */
	private static final long serialVersionUID = 1005L;
	
	/*
	 * USERID, PASSWORD, USERNAME, GENDER, AGE, 
	 * EMAIL, PHONE, ADDRESS, HOBBY, ENROLLDATE
	 */
	// 1. 필드 변수 선언 ( Alt + Shift + 'A' )
	private String memberId;            // 아이디
    private String memberPwd;           // 비밀번호
	private String memberName;          // 이름
    private String memberSsn;           // 생년월일
	private String gender;              // 성별
	private String email;               // 이메일
	private String phone;               // 번호
	private Date joinDate;            // 가입일
	private String status;              // 탈퇴여부
	private int reportNum;           // 신고누적회수
	// 2. 생성자
	// Alt + Shift + 'S' > Generate Constructors from Superclass
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberId, String memberPwd, String memberName, String memberSsn, String gender, String email,
			String phone, Date joinDate, String status, int reportNum) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberSsn = memberSsn;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.joinDate = joinDate;
		this.status = status;
		this.reportNum = reportNum;
	}
	public Member(String memberId, String memberName, String memberSsn, String gender, String email, int reportNum) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberSsn = memberSsn;
		this.gender = gender;
		this.email = email;
		this.reportNum = reportNum;
	}
	

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberSsn=" + memberSsn + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", joinDate=" + joinDate + ", status=" + status + ", reportNum=" + reportNum + "]";
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}