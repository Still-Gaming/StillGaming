package com.kh.jsp.boardComment.model.vo;

import java.sql.Date;

public class BoardComment {
	private int commentNo;
	private int boardNo;
	private String memberId;
	private Date commentDate;
	private String commentText;

	public BoardComment() { }

	

	public BoardComment(int commentNo, int boardNo, String memberId, String commentText) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.commentText = commentText;
	}



	public BoardComment(int commentNo, int boardNo, String memberId, Date commentDate, String commentText) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.commentDate = commentDate;
		this.commentText = commentText;
	}

	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", memberId=" + memberId
				+ ", commentDate=" + commentDate + ", commentText=" + commentText + "]";
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

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	
}