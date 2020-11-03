package com.kh.jsp.wishlist.model.vo;

public class Wishlist {
	private String memberId;
	private int gminfoNum;

	public Wishlist() {
		super();
	}

	public Wishlist(String memberId, int gminfoNum) {
		super();
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
	}

	@Override
	public String toString() {
		return "Wishlist [memberId=" + memberId + ", gminfoNum=" + gminfoNum + "]";
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
