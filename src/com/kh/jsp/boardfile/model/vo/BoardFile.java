package com.kh.jsp.boardfile.model.vo;

import java.sql.Date;

public class BoardFile {
	private int fileNo;
	private int boardNo;
	private String fileName;
	private String fileChangeName;
	private String filePath;
	private Date fileUploadDate;
	
	public BoardFile() {
		super();
	}

	public BoardFile(String fileName, String fileChangeName, String filePath) {
		super();
		this.fileName = fileName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
	}

	public BoardFile(int fileNo, int boardNo, String fileName, String fileChangeName, String filePath,
			Date fileUploadDate) {
		super();
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.fileName = fileName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileUploadDate = fileUploadDate;
	}

	@Override
	public String toString() {
		return "BoardFile [fileNo=" + fileNo + ", boardNo=" + boardNo + ", fileName=" + fileName + ", fileChangeName="
				+ fileChangeName + ", filePath=" + filePath + ", fileUploadDate=" + fileUploadDate + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getFileUploadDate() {
		return fileUploadDate;
	}

	public void setFileUploadDate(Date fileUploadDate) {
		this.fileUploadDate = fileUploadDate;
	}
}
