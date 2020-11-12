package com.kh.jsp.qna.model.dao;

import java.io.FileNotFoundException;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.kh.jsp.board.model.dao.BoardDAO;
import com.kh.jsp.board.model.vo.BoardFile;

import com.kh.jsp.common.exception.BoardException;
import com.kh.jsp.common.exception.QnaException;
import com.kh.jsp.member.model.dao.MemberDAO;

import com.kh.jsp.qna.model.vo.Qna;
import com.kh.jsp.qna.model.vo.QnaFile;

import static com.kh.jsp.common.JDBCTemplate.*;



public class QnaDAO {

	private Properties prop;
	
	public QnaDAO() {
		prop = new Properties();
		
		String filePath = QnaDAO.class.getResource("/config/qna-sql.properties")
						 .getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertQna(Connection con, Qna q, QnaFile qf) throws QnaException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQna");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, q.getMemberId());
			pstmt.setInt(2, q.getQcode());
			pstmt.setString(3, q.getQtitle());
			pstmt.setString(4, q.getQcontent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e){
			
			e.printStackTrace();
			throw new QnaException("[DAO] : " + e.getMessage());
		} finally {
			
			close(pstmt);
		}
		
		return result;
		
	}


	public int insertQnaFile(Connection con, QnaFile qf) throws QnaException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertQnaFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qf.getQnaNo());
			pstmt.setString(2, qf.getQnaOrigin());
			pstmt.setString(3, qf.getQnaChange());
			pstmt.setString(4, qf.getQnaPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QnaException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

public Qna selectOne(Connection con, int qno) {
	
	Qna q = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectOne");
	
	try {
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1,  qno);
		
		rset = pstmt.executeQuery();
		
		if ( rset.next()) {
			q = new Qna();
			
			q.setQcontent(rset.getString("qcontent"));
			//q.setQfile(rset.getString("qfile"));
			q.setQdate(rset.getDate("qdate"));
			
		}
	
	} catch (SQLException e) {
		e.printStackTrace();

	} finally {
		close(rset);
		close(pstmt);
		
		
	}
	
	return q;

	}

public ArrayList<Qna> selectList(Connection con) throws QnaException { 
	
	ArrayList<Qna> list = new ArrayList<>(); // 공지사항 목록 담을 공간
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectList");
	
	try {
		pstmt = con.prepareStatement(sql);
		
		rset = pstmt.executeQuery();
	
		while (rset.next()) {
			
			Qna q = new Qna();
			
			q.setQno(      rset.getInt(1)    );
			q.setMemberId(   rset.getString(2) );
			q.setQcode( rset.getInt(3) );
			q.setQtitle(  rset.getString(4) );
			q.setQcontent(   rset.getString(5)    );
			q.setQdate(    rset.getDate(6)   );
			q.setQanswer(   rset.getString(7)    );
			
			list.add(q);
			
			
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
		throw new QnaException("[DAO] : " + e.getMessage());
		
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return list;
}
	
	

}
