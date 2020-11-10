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

		String filePath = BoardCommentDAO.class.getResource("/config/comment-sql.properties").getPath();

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
		
		System.out.println(sql);
		
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
				
				bco.setCommentNo(   rset.getInt("COMMENT_NO") );
				bco.setBoardNo(     rset.getInt("BOARD_NO") );
				bco.setCommentText( rset.getString("COMMENT_TEXT"));
				bco.setMemberId(    rset.getString("MEMBER_ID"));
				bco.setCommentDate( rset.getDate("COMMENT_DATE"));
				bco.setRefCno(      rset.getInt("REF_CNO"));
				bco.setCommentLevel(rset.getInt("COMMENT_LEVEL"));
				
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

	public int updateComment(Connection con, BoardComment bco) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateComment");
		System.out.println(bco.getCommentText() + " / " + bco.getCommentNo());
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bco.getCommentText());
			pstmt.setInt(2, bco.getCommentNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			close(pstmt);
		}
				
		return result;
		
	}
	public int deleteComment(Connection con, int commentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, commentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
				
		return result;
	}

	

	
		
}
