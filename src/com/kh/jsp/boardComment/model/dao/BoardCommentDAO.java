package com.kh.jsp.boardComment.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.boardComment.model.vo.BoardComment;

import static com.kh.jsp.common.JDBCTemplate.*;

public class BoardCommentDAO {
	private Properties prop;

	public BoardCommentDAO() {
		prop = new Properties();

		String filePath = BoardCommentDAO.class.getResource("/config/comment-sql.propperties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

	}

	public int insertComment(Connection con, BoardComment comment) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, comment.getBoardNo());
			pstmt.setString(2, comment.getCommentText());
			pstmt.setString(3, comment.getMemberId());
			
			if(comment.getRefCno() > 0 ) {
				pstmt.setInt(4, comment.getRefCno());
			} else {
				pstmt.setNull(4, java.sql.Types.NULL);
			}
			
			pstmt.setInt(5, comment.getCommentLevel());
			
			result = pstmt.executeUpdate();
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
	}
	public ArrayList<BoardComment> selectList(Connection con, int bno) {
		ArrayList<BoardComment> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardComment bco = new BoardComment();
				
				bco.setCommentNo(   rset.getInt(1) );
				bco.setBoardNo(     rset.getInt(2) );
				bco.setCommentText( rset.getString(3));
				bco.setMemberId(    rset.getString(4));
				bco.setCommentDate( rset.getDate(5));
				bco.setRefCno(      rset.getInt(6));
				bco.setCommentLevel(rset.getInt(7));
				
				clist.add(bco);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return clist;
	}
}
