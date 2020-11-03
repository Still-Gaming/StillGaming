package com.kh.jsp.gamereview.model.vo;

public class GameReview {
	private int comtNum;
	private int comtReco;
	private String comtCont;
	private String memberId;
	private int gminfoNum;
	
	public GameReview() {
		super();
	}
	
	public GameReview(int comtReco, String comtCont, String memberId, int gminfoNum) {
		super();
		this.comtReco = comtReco;
		this.comtCont = comtCont;
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
	}

	public GameReview(int comtNum, int comtReco, String comtCont, String memberId, int gminfoNum) {
		super();
		this.comtNum = comtNum;
		this.comtReco = comtReco;
		this.comtCont = comtCont;
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
	}

	@Override
	public String toString() {
		return "GameReview [comtNum=" + comtNum + ", comtReco=" + comtReco + ", comtCont=" + comtCont + ", memberId="
				+ memberId + ", gminfoNum=" + gminfoNum + "]";
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
}
