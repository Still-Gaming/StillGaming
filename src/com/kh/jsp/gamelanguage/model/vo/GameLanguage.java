package com.kh.jsp.gamelanguage.model.vo;

public class GameLanguage {
	
	private int gminfoNum;   // 게임번호
	private int langNum;     // 언어번호
	
	public GameLanguage() { }

	public GameLanguage(int gminfoNum, int langNum) {
		super();
		this.gminfoNum = gminfoNum;
		this.langNum = langNum;
	}

	@Override
	public String toString() {
		return "GameLanguage [gminfoNum=" + gminfoNum + ", langNum=" + langNum + "]";
	}

	public int getGminfoNum() {
		return gminfoNum;
	}

	public void setGminfoNum(int gminfoNum) {
		this.gminfoNum = gminfoNum;
	}

	public int getLangNum() {
		return langNum;
	}

	public void setLangNum(int langNum) {
		this.langNum = langNum;
	}
	
	
	
}
