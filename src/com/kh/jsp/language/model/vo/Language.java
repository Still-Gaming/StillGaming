package com.kh.jsp.language.model.vo;

public class Language {
	private int langNum;
	private String lang;
	
	public Language() {
		super();
	}

	public Language(int langNum, String lang) {
		super();
		this.langNum = langNum;
		this.lang = lang;
	}

	@Override
	public String toString() {
		return "Language [langNum=" + langNum + ", lang=" + lang + "]";
	}

	public int getLangNum() {
		return langNum;
	}

	public void setLangNum(int langNum) {
		this.langNum = langNum;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}
}
