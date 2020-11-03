package com.kh.jsp.ord.model.vo;

public class Ord {
	private int ordNo;
	private String memberId;
	private int gminfoNum;

	public Ord() {
		super();
	}

	public Ord(int ordNo, String memberId, int gminfoNum) {
		super();
		this.ordNo = ordNo;
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
	}

	@Override
	public String toString() {
		return "Ord [ordNo=" + ordNo + ", memberId=" + memberId + ", gminfoNum=" + gminfoNum + "]";
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
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
