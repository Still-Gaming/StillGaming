package com.kh.jsp.cart.model.vo;

public class Cart {
	private String memberId;
	private int gminfoNum;

	public Cart() {
		super();
	}

	public Cart(String memberId, int gminfoNum) {
		super();
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
	}

	@Override
	public String toString() {
		return "Cart [memberId=" + memberId + ", gminfoNum=" + gminfoNum + "]";
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
