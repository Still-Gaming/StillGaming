package com.kh.jsp.report.model.vo;

import java.sql.Date;

public class Report {

	private int report_no;
	private int board_no;
	private String report_reason;
	private Date report_date;
	
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Report(int report_no, int board_no, String report_reason, Date report_date) {
		super();
		this.report_no = report_no;
		this.board_no = board_no;
		this.report_reason = report_reason;
		this.report_date = report_date;
	}
	
	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", board_no=" + board_no + ", report_reason=" + report_reason
				+ ", report_date=" + report_date + "]";
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
	
}
