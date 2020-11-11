package com.kh.jsp.mypage.model.vo;

import java.sql.Date;

import com.kh.jsp.gameinfo.model.vo.GameInfo;

public class Ord extends GameInfo {
	private int ordNo;
	private String memberId;
	private int gminfoNum;
	private Date ordDate;
	public Ord() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ord(int gminfoNum, String gminfoName, Date gminfoDate, String gminfoCompany, String gminfoExp, int gmTypenum,
			int gminfoAage, int gminfoPrice) {
		super(gminfoNum, gminfoName, gminfoDate, gminfoCompany, gminfoExp, gmTypenum, gminfoAage, gminfoPrice);
		// TODO Auto-generated constructor stub
	}
	public Ord(String gminfoName, String gminfoExp, int gminfoPrice) {
		super(gminfoName, gminfoExp, gminfoPrice);
		// TODO Auto-generated constructor stub
	}
	public Ord(int ordNo, String memberId, int gminfoNum, Date ordDate) {
		super();
		this.ordNo = ordNo;
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
		this.ordDate = ordDate;
	}
	@Override
	public String toString() {
		return "Ord [ordNo=" + ordNo + ", memberId=" + memberId + ", gminfoNum=" + gminfoNum + ", ordDate=" + ordDate
				+ ", toString()=" + super.toString() + ", getGminfoNum()=" + getGminfoNum() + ", getGminfoName()="
				+ getGminfoName() + ", getGminfoDate()=" + getGminfoDate() + ", getGminfoCompany()="
				+ getGminfoCompany() + ", getGminfoExp()=" + getGminfoExp() + ", getGmTypenum()=" + getGmTypenum()
				+ ", getGminfoAage()=" + getGminfoAge() + ", getGminfoPrice()=" + getGminfoPrice() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
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
	public Date getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}


}
