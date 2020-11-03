package com.kh.jsp.report.model.vo;

import java.sql.Date;

public class Report {

	private int reportNo;
	private int boardNo;
	private String reportReason;
	private Date reportDate;
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Report(int reportNo, int boardNo, String reportReason, Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.reportReason = reportReason;
		this.reportDate = reportDate;
	}
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNo=" + boardNo + ", reportReason=" + reportReason
				+ ", reportDate=" + reportDate + "]";
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	
	
	
	
}
