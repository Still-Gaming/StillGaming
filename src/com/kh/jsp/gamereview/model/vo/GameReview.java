package com.kh.jsp.gamereview.model.vo;

import java.sql.Date;

public class GameReview {
	private int comtNum;      // 리뷰 번호
	private int comtReco;     // 추천/비추천
	private String comtCont;  // 리뷰내용
	private String memberId;  // 아이디
	private int gminfoNum;    // 게임번호
	private Date comtDate;    // 등록일
	private int refCno;       // 대댓글
	private int comtLevel;    // 댓글레벨
	
	public GameReview() {
		super();
	}

	public GameReview(int comtNum, int comtReco, String comtCont, String memberId, int gminfoNum, Date comtDate,
			int refCno, int comtLevel) {
		super();
		this.comtNum = comtNum;
		this.comtReco = comtReco;
		this.comtCont = comtCont;
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
		this.comtDate = comtDate;
		this.refCno = refCno;
		this.comtLevel = comtLevel;
	}

	public GameReview(String comtCont, String memberId, int gminfoNum, int refCno, int comtLevel) {
		super();
		this.comtCont = comtCont;
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
		this.refCno = refCno;
		this.comtLevel = comtLevel;
	}

	@Override
	public String toString() {
		return "GameReview [comtNum=" + comtNum + ", comtReco=" + comtReco + ", comtCont=" + comtCont + ", memberId="
				+ memberId + ", gminfoNum=" + gminfoNum + ", comtDate=" + comtDate + ", refCno=" + refCno
				+ ", comtLevel=" + comtLevel + "]";
	}

	public int getComtNum() {
		return comtNum;
	}

	public void setComtNum(int comtNum) {
		this.comtNum = comtNum;
	}

	public int getComtReco() {
		return comtReco;
	}

	public void setComtReco(int comtReco) {
		this.comtReco = comtReco;
	}

	public String getComtCont() {
		return comtCont;
	}

	public void setComtCont(String comtCont) {
		this.comtCont = comtCont;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getGminfoNum() {
		return gminfoNum;
	}

	public void setGminfoNum(int gminfoNum) {
		this.gminfoNum = gminfoNum;
	}

	public Date getComtDate() {
		return comtDate;
	}

	public void setComtDate(Date comtDate) {
		this.comtDate = comtDate;
	}

	public int getRefCno() {
		return refCno;
	}

	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}

	public int getComtLevel() {
		return comtLevel;
	}

	public void setComtLevel(int comtLevel) {
		this.comtLevel = comtLevel;
	}
	
	
}
