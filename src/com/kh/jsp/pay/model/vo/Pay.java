package com.kh.jsp.pay.model.vo;

public class Pay {
	private int payNo;
	private int ordNo;
	private int payMethod;
	private String payCompany;
	private char payStatus;

	public Pay() {
		super();
	}

	public Pay(int payNo, int ordNo, int payMethod, String payCompany, char payStatus) {
		super();
		this.payNo = payNo;
		this.ordNo = ordNo;
		this.payMethod = payMethod;
		this.payCompany = payCompany;
		this.payStatus = payStatus;
	}

	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", ordNo=" + ordNo + ", payMethod=" + payMethod + ", payCompany=" + payCompany
				+ ", payStatus=" + payStatus + "]";
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public int getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(int payMethod) {
		this.payMethod = payMethod;
	}

	public String getPayCompany() {
		return payCompany;
	}

	public void setPayCompany(String payCompany) {
		this.payCompany = payCompany;
	}

	public char getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(char payStatus) {
		this.payStatus = payStatus;
	}
}
