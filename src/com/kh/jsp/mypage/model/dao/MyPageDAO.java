package com.kh.jsp.mypage.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jsp.common.JDBCTemplate.*;

import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.exception.BoardException;
import com.kh.jsp.common.exception.MyPageException;

public class MyPageDAO {
	private Properties prop;
	
	public MyPageDAO() {
		prop = new Properties();
		
		String filePath = MyPageDAO.class.getResource("/config/mypage-sql.properties")
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

	public int getListCount(Connection con, String memberId) throws MyPageException {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MyPageException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
	}

	public ArrayList<Board> selectList(Connection con, String memberId, int currentPage, int limit) throws MyPageException {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;

			pstmt.setString(1, memberId);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardType(rset.getInt("BOARD_TYPE"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardText(rset.getString("BOARD_TEXT"));
				b.setMemberId(rset.getString("MEMBER_ID"));
				b.setBoardCount(rset.getInt("BOARD_COUNT"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MyPageException("[DAO] : " + e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}
}
