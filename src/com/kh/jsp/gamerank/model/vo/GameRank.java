package com.kh.jsp.gamerank.model.vo;

public class GameRank {

	private int rankNum;
	private String rankName;
	public GameRank() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GameRank(int rankNum, String rankName) {
		super();
		this.rankNum = rankNum;
		this.rankName = rankName;
	}
	@Override
	public String toString() {
		return "GameRank [rankNum=" + rankNum + ", rankName=" + rankName + "]";
	}
	public int getRankNum() {
		return rankNum;
	}
	public void setRankNum(int rankNum) {
		this.rankNum = rankNum;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	
	
	
}
