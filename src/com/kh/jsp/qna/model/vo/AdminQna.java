package com.kh.jsp.qna.model.vo;


import java.io.Serializable;
import java.util.Date;

public class AdminQna {
	  private int qno;
	  private String memberId;
	  private int qcode;
	  private String qtitle;
	  private String qcontent;
	  private Date qdate;
	  private String qanswer;
	  
	public AdminQna() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminQna(int qno, String memberId, int qcode, String qtitle, String qcontent, Date qdate, String qanswer) {
		super();
		this.qno = qno;
		this.memberId = memberId;
		this.qcode = qcode;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qdate = qdate;
		this.qanswer = qanswer;
	}

	public AdminQna( String qanswer) {
		super();
		this.qanswer = qanswer;
	}

	@Override
	public String toString() {
		return "AdminQna [qno=" + qno + ", memberId=" + memberId + ", qcode=" + qcode + ", qtitle=" + qtitle
				+ ", qcontent=" + qcontent + ", qdate=" + qdate + ", qanswer=" + qanswer + "]";
	}

	/**
	 * @return the qno
	 */
	public int getQno() {
		return qno;
	}

	/**
	 * @param qno the qno to set
	 */
	public void setQno(int qno) {
		this.qno = qno;
	}

	/**
	 * @return the memberId
	 */
	public String getMemberId() {
		return memberId;
	}

	/**
	 * @param memberId the memberId to set
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	/**
	 * @return the qcode
	 */
	public int getQcode() {
		return qcode;
	}

	/**
	 * @param qcode the qcode to set
	 */
	public void setQcode(int qcode) {
		this.qcode = qcode;
	}

	/**
	 * @return the qtitle
	 */
	public String getQtitle() {
		return qtitle;
	}

	/**
	 * @param qtitle the qtitle to set
	 */
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	/**
	 * @return the qcontent
	 */
	public String getQcontent() {
		return qcontent;
	}

	/**
	 * @param qcontent the qcontent to set
	 */
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	/**
	 * @return the qdate
	 */
	public Date getQdate() {
		return qdate;
	}

	/**
	 * @param qdate the qdate to set
	 */
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	/**
	 * @return the qanswer
	 */
	public String getQanswer() {
		return qanswer;
	}

	/**
	 * @param qanswer the qanswer to set
	 */
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}

}   