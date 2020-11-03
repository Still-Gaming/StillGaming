package com.kh.jsp.boardcomment.model.vo;

import java.sql.Date;

public class BoardComment {
	private int commentNo;
	private int boardNo;
	private String memberId;
	private Date commentDate;

	public BoardComment() {
		super();
	}

	public BoardComment(int boardNo, String memberId) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
	}

	public BoardComment(int commentNo, int boardNo, String memberId, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", memberId=" + memberId
				+ ", commentDate=" + commentDate + "]";
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
}
