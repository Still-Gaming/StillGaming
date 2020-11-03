package com.kh.jsp.gameimage.model.vo;

public class GameImage {
	
	private int gmimgNum;	      // 이미지번호
	private int gminfoNum;        // 게임번호
	private String gmimgFile;     // 파일명
	private String gmimgCgfile;   // 변경된 파일명
	private String gmimgPath;     // 파일경로
	
	public GameImage() {}

	public GameImage(int gmimgNum, int gminfoNum, String gmimgFile, String gmimgCgfile, String gmimgPath) {
		super();
		this.gmimgNum = gmimgNum;
		this.gminfoNum = gminfoNum;
		this.gmimgFile = gmimgFile;
		this.gmimgCgfile = gmimgCgfile;
		this.gmimgPath = gmimgPath;
	}

	@Override
	public String toString() {
		return "GameImage [gmimgNum=" + gmimgNum + ", gminfoNum=" + gminfoNum + ", gmimgFile=" + gmimgFile
				+ ", gmimgCgfile=" + gmimgCgfile + ", gmimgPath=" + gmimgPath + "]";
	}

	public int getGmimgNum() {
		return gmimgNum;
	}

	public void setGmimgNum(int gmimgNum) {
		this.gmimgNum = gmimgNum;
	}

	public int getGminfoNum() {
		return gminfoNum;
	}

	public void setGminfoNum(int gminfoNum) {
		this.gminfoNum = gminfoNum;
	}

	public String getGmimgFile() {
		return gmimgFile;
	}

	public void setGmimgFile(String gmimgFile) {
		this.gmimgFile = gmimgFile;
	}

	public String getGmimgCgfile() {
		return gmimgCgfile;
	}

	public void setGmimgCgfile(String gmimgCgfile) {
		this.gmimgCgfile = gmimgCgfile;
	}

	public String getGmimgPath() {
		return gmimgPath;
	}

	public void setGmimgPath(String gmimgPath) {
		this.gmimgPath = gmimgPath;
	}
    
	
}
