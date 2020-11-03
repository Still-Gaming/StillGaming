package com.kh.jsp.gamegenre.model.vo;

public class GameGenre {
	private int gmTypeNum;
	private String gmType;
	
	public GameGenre() {
		super();
	}

	public GameGenre(int gmTypeNum, String gmType) {
		super();
		this.gmTypeNum = gmTypeNum;
		this.gmType = gmType;
	}

	@Override
	public String toString() {
		return "GameGenre [gmTypeNum=" + gmTypeNum + ", gmType=" + gmType + "]";
	}

	public int getGmTypeNum() {
		return gmTypeNum;
	}

	public void setGmTypeNum(int gmTypeNum) {
		this.gmTypeNum = gmTypeNum;
	}

	public String getGmType() {
		return gmType;
	}

	public void setGmType(String gmType) {
		this.gmType = gmType;
	}
}
