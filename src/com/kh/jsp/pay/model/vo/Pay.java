package com.kh.jsp.pay.model.vo;

import java.sql.Date;

public class Pay {
	private int payNo;
	private int ordNo;
	private int payMethod;
	private String payCompany;
	private char payStatus;
	private Date payDate;
	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pay(int payNo, int ordNo, int payMethod, String payCompany, char payStatus, Date payDate) {
		super();
		this.payNo = payNo;
		this.ordNo = ordNo;
		this.payMethod = payMethod;
		this.payCompany = payCompany;
		this.payStatus = payStatus;
		this.payDate = payDate;
	}
	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", ordNo=" + ordNo + ", payMethod=" + payMethod + ", payCompany=" + payCompany
				+ ", payStatus=" + payStatus + ", payDate=" + payDate + "]";
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
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

}
