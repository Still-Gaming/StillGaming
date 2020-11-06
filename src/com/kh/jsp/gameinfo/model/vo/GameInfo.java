package com.kh.jsp.gameinfo.model.vo;

import java.sql.Date;

public class GameInfo {
	
	private int gminfoNum;            // 게임번호   
	private String gminfoName;        // 게임이름
	private Date gminfoDate;          // 출시일
	private String gminfoCompany;     // 개발사
	private String gminfoExp;         // 게임설명
	private int gmTypenum;            // 장르번호
	private int gminfoAge;           // 등급번호
	private int gminfoPrice;          // 가격
	private String gminfoImage;      // 가상변수 1
	private String gminfoAgeRank;    // 가상변수 2
	private String gminfoType;    // 가상변수 3
	
	public GameInfo() { }


	public GameInfo(int gminfoNum, String gminfoName, Date gminfoDate, String gminfoCompany, String gminfoExp,
			int gmTypenum, int gminfoAge, int gminfoPrice) {
		super();
		this.gminfoNum = gminfoNum;
		this.gminfoName = gminfoName;
		this.gminfoDate = gminfoDate;
		this.gminfoCompany = gminfoCompany;
		this.gminfoExp = gminfoExp;
		this.gmTypenum = gmTypenum;
		this.gminfoAge = gminfoAge;
		this.gminfoPrice = gminfoPrice;
	}

	
	public GameInfo(String gminfoName, String gminfoExp, int gminfoPrice) {
		super();
		this.gminfoName = gminfoName;
		this.gminfoExp = gminfoExp;
		this.gminfoPrice = gminfoPrice;
	}


	public GameInfo(String gminfoName, Date gminfoDate, String gminfoCompany, String gminfoExp, int gmTypenum,
			int gminfoAge, int gminfoPrice) {
		super();
		this.gminfoName = gminfoName;
		this.gminfoDate = gminfoDate;
		this.gminfoCompany = gminfoCompany;
		this.gminfoExp = gminfoExp;
		this.gmTypenum = gmTypenum;
		this.gminfoAge = gminfoAge;
		this.gminfoPrice = gminfoPrice;
	}


	@Override
	public String toString() {
		return "GameInfo [gminfoNum=" + gminfoNum + ", gminfoName=" + gminfoName + ", gminfoDate=" + gminfoDate
				+ ", gminfoCompany=" + gminfoCompany + ", gminfoExp=" + gminfoExp + ", gmTypenum=" + gmTypenum
				+ ", gminfoAge=" + gminfoAge + ", gminfoPrice=" + gminfoPrice + "]";
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


	public int getGminfoAge() {
		return gminfoAge;
	}


	public void setGminfoAge(int gminfoAge) {
		this.gminfoAge = gminfoAge;
	}


	public int getGminfoPrice() {
		return gminfoPrice;
	}


	public void setGminfoPrice(int gminfoPrice) {
		this.gminfoPrice = gminfoPrice;
	}


	public String getGminfoImage() {
		return gminfoImage;
	}


	public void setGminfoImage(String gminfoImage) {
		this.gminfoImage = gminfoImage;
	}


	public String getGminfoAgeRank() {
		return gminfoAgeRank;
	}


	public void setGminfoAgeRank(String gminfoAgeRank) {
		this.gminfoAgeRank = gminfoAgeRank;
	}


	public String getGminfoType() {
		return gminfoType;
	}


	public void setGminfoType(String gminfoType) {
		this.gminfoType = gminfoType;
	}

}
