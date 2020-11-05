package com.kh.jsp.boardComment.model.vo;

import java.sql.Date;

public class BoardComment {
	private int commentNo;
	private int boardNo;
	private String commentText;
	private String memberId;
	private Date commentDate;
	private int refCno;
	private int commentLevel;
	
	
	public BoardComment() {	}


	public BoardComment(int commentNo, int boardNo, String commentText, String memberId, Date commentDate, int refCno,
			int commentLevel) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.commentText = commentText;
		this.memberId = memberId;
		this.commentDate = commentDate;
		this.refCno = refCno;
		this.commentLevel = commentLevel;
	}


	public BoardComment(int boardNo, String commentText, String memberId, int refCno, int commentLevel) {
		super();
		this.boardNo = boardNo;
		this.commentText = commentText;
		this.memberId = memberId;
		this.refCno = refCno;
		this.commentLevel = commentLevel;
	}


	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", commentText=" + commentText
				+ ", memberId=" + memberId + ", commentDate=" + commentDate + ", refCno=" + refCno + ", commentLevel="
				+ commentLevel + "]";
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


	public String getCommentText() {
		return commentText;
	}


	public void setCommentText(String commentText) {
		this.commentText = commentText;
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


	public int getRefCno() {
		return refCno;
	}


	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}


	public int getCommentLevel() {
		return commentLevel;
	}


	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	
	

	
}