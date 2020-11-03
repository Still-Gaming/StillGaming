package com.kh.jsp.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String memberId;
	private int boardType;
	private String boardTitle;
	private String boardText;
	private Date boardDate;
	private int boardCount;
	private char boardStatus;
	
	public Board() {
		super();
	}
	
	public Board(String memberId, int boardType, String boardTitle, String boardText) {
		super();
		this.memberId = memberId;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardText = boardText;
	}

	public Board(int boardNo, String memberId, int boardType, String boardTitle, String boardText, Date boardDate,
			int boardCount, char boardStatus) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardText = boardText;
		this.boardDate = boardDate;
		this.boardCount = boardCount;
		this.boardStatus = boardStatus;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberId=" + memberId + ", boardType=" + boardType + ", boardTitle="
				+ boardTitle + ", boardText=" + boardText + ", boardDate=" + boardDate + ", boardCount=" + boardCount
				+ ", boardStatus=" + boardStatus + "]";
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardText() {
		return boardText;
	}

	public void setBoardText(String boardText) {
		this.boardText = boardText;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public char getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
	}
}
