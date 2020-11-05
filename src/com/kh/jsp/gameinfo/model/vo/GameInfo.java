package com.kh.jsp.gameinfo.model.vo;

import java.sql.Date;

public class GameInfo {
	
	private int gminfoNum;            // 게임번호   
	private String gminfoName;        // 게임이름
	private Date gminfoDate;          // 출시일
	private String gminfoCompany;     // 개발사
	private String gminfoExp;         // 게임설명
	private int gmTypenum;            // 장르번호
	private int gminfoAage;           // 등급번호
	private int gminfoPrice;          // 가격
	
	
	
	public GameInfo() { }


	public GameInfo(int gminfoNum, String gminfoName, Date gminfoDate, String gminfoCompany, String gminfoExp,
			int gmTypenum, int gminfoAage, int gminfoPrice) {
		super();
		this.gminfoNum = gminfoNum;
		this.gminfoName = gminfoName;
		this.gminfoDate = gminfoDate;
		this.gminfoCompany = gminfoCompany;
		this.gminfoExp = gminfoExp;
		this.gmTypenum = gmTypenum;
		this.gminfoAage = gminfoAage;
		this.gminfoPrice = gminfoPrice;
	}

	
	public GameInfo(String gminfoName, String gminfoExp, int gminfoPrice) {
		super();
		this.gminfoName = gminfoName;
		this.gminfoExp = gminfoExp;
		this.gminfoPrice = gminfoPrice;
	}


	public GameInfo(String gminfoName, Date gminfoDate, String gminfoCompany, String gminfoExp, int gmTypenum,
			int gminfoAage, int gminfoPrice) {
		super();
		this.gminfoName = gminfoName;
		this.gminfoDate = gminfoDate;
		this.gminfoCompany = gminfoCompany;
		this.gminfoExp = gminfoExp;
		this.gmTypenum = gmTypenum;
		this.gminfoAage = gminfoAage;
		this.gminfoPrice = gminfoPrice;
	}


	@Override
	public String toString() {
		return "GameInfo [gminfoNum=" + gminfoNum + ", gminfoName=" + gminfoName + ", gminfoDate=" + gminfoDate
				+ ", gminfoCompany=" + gminfoCompany + ", gminfoExp=" + gminfoExp + ", gmTypenum=" + gmTypenum
				+ ", gminfoAage=" + gminfoAage + ", gminfoPrice=" + gminfoPrice + "]";
	}


	public int getGminfoNum() {
		return gminfoNum;
	}


	public void setGminfoNum(int gminfoNum) {
		this.gminfoNum = gminfoNum;
	}


	public String getGminfoName() {
		return gminfoName;
	}


	public void setGminfoName(String gminfoName) {
		this.gminfoName = gminfoName;
	}


	public Date getGminfoDate() {
		return gminfoDate;
	}


	public void setGminfoDate(Date gminfoDate) {
		this.gminfoDate = gminfoDate;
	}


	public String getGminfoCompany() {
		return gminfoCompany;
	}


	public void setGminfoCompany(String gminfoCompany) {
		this.gminfoCompany = gminfoCompany;
	}


	public String getGminfoExp() {
		return gminfoExp;
	}


	public void setGminfoExp(String gminfoExp) {
		this.gminfoExp = gminfoExp;
	}


	public int getGmTypenum() {
		return gmTypenum;
	}


	public void setGmTypenum(int gmTypenum) {
		this.gmTypenum = gmTypenum;
	}


	public int getGminfoAage() {
		return gminfoAage;
	}


	public void setGminfoAage(int gminfoAage) {
		this.gminfoAage = gminfoAage;
	}


	public int getGminfoPrice() {
		return gminfoPrice;
	}


	public void setGminfoPrice(int gminfoPrice) {
		this.gminfoPrice = gminfoPrice;
	}


	
		
	
	

}
