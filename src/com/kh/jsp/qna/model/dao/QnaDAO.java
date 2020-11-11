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
import java.util.Properties;

import com.kh.jsp.qna.model.vo.Qna;
import static com.kh.jsp.common.JDBCTemplate.*;



public class QnaDAO {

	private Properties prop = new Properties();

	public int insertQna(Connection con, Qna q) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO MEMBER "
						+ " VALUES( ?, ?)";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, q.getQtitle());
			pstmt.setString(2, q.getQcontent());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e){
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
		
	}
	
}