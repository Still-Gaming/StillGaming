package com.kh.jsp.mypage.model.vo;

import java.sql.Date;

import com.kh.jsp.gameinfo.model.vo.GameInfo;

public class Cart extends GameInfo {
	
	private String memberId;
	private int gminfoNum;
	private String gminfoname;
	private int gminfoprice;
	private String gmimgfile;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int gminfoNum, String gminfoName, Date gminfoDate, String gminfoCompany, String gminfoExp,
			int gmTypenum, int gminfoAage, int gminfoPrice) {
		super(gminfoNum, gminfoName, gminfoDate, gminfoCompany, gminfoExp, gmTypenum, gminfoAage, gminfoPrice);
		// TODO Auto-generated constructor stub
	}
	public Cart(String gminfoName, String gminfoExp, int gminfoPrice) {
		super(gminfoName, gminfoExp, gminfoPrice);
		// TODO Auto-generated constructor stub
	}
	public Cart(String memberId, int gminfoNum, String gminfoname, int gminfoprice, String gmimgfile) {
		super();
		this.memberId = memberId;
		this.gminfoNum = gminfoNum;
		this.gminfoname = gminfoname;
		this.gminfoprice = gminfoprice;
		this.gmimgfile = gmimgfile;
	}
	@Override
	public String toString() {
		return "Cart [memberId=" + memberId + ", gminfoNum=" + gminfoNum + ", gminfoname=" + gminfoname
				+ ", gminfoprice=" + gminfoprice + ", gmimgfile=" + gmimgfile + ", toString()=" + super.toString()
				+ ", getGminfoNum()=" + getGminfoNum() + ", getGminfoName()=" + getGminfoName() + ", getGminfoDate()="
				+ getGminfoDate() + ", getGminfoCompany()=" + getGminfoCompany() + ", getGminfoExp()=" + getGminfoExp()
				+ ", getGmTypenum()=" + getGmTypenum() + ", getGminfoAage()=" + getGminfoAge() + ", getGminfoPrice()="
				+ getGminfoPrice() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
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
	public String getGminfoname() {
		return gminfoname;
	}
	public void setGminfoname(String gminfoname) {
		this.gminfoname = gminfoname;
	}
	public int getGminfoprice() {
		return gminfoprice;
	}
	public void setGminfoprice(int gminfoprice) {
		this.gminfoprice = gminfoprice;
	}
	public String getGmimgfile() {
		return gmimgfile;
	}
	public void setGmimgfile(String gmimgfile) {
		this.gmimgfile = gmimgfile;
	}


	
}
