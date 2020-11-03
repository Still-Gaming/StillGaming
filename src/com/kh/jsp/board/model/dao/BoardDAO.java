package com.kh.jsp.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.exception.BoardException;

import static com.kh.jsp.common.JDBCTemplate.*;

public class BoardDAO {
	private Properties prop;

	public BoardDAO() {
		prop = new Properties();
		
		String filePath = BoardDAO.class.getResource("/config/board-sql.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertBoard(Connection con, Board b) throws BoardException {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getMemberId());
			pstmt.setInt(2, b.getBoardType());
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardText());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
