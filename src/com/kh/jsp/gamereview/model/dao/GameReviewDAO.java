package com.kh.jsp.gamereview.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.getConnection;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.jsp.gamereview.model.vo.GameReview;

import static com.kh.jsp.common.JDBCTemplate.*;

public class GameReviewDAO {
	private Properties prop;
	
	public GameReviewDAO() {
		prop = new Properties();

		String filePath = GameReviewDAO.class.getResource("/config/review-sql.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}	

	public int insertReview(Connection con, GameReview review) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertReview");
			
			
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, review.getComtCont());
				pstmt.setString(2, review.getMemberId());
				pstmt.setInt(3, review.getGminfoNum());
				
				
				if(review.getRefCno() > 0 ) {
					pstmt.setInt(4, review.getRefCno());
				} else {
					pstmt.setNull(4, java.sql.Types.NULL);
				}
				
				pstmt.setInt(5, review.getComtLevel());
				
				
				result = pstmt.executeUpdate();
				
				
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				
				return result;
	}

	public ArrayList<GameReview> selectList(Connection con, int gminfoNum) {
		ArrayList<GameReview> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, gminfoNum);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GameReview bco = new GameReview();
				
				bco.setComtNum(     rset.getInt("COMT_NUM"));
				bco.setGminfoNum(   rset.getInt("GMINFO_NUM"));
				bco.setComtCont(    rset.getString("COMT_CONT"));
				bco.setMemberId(    rset.getString("MEMBER_ID"));
				bco.setComtDate(    rset.getDate("COMT_DATE"));
				bco.setRefCno(      rset.getInt("REF_CNO"));
				bco.setComtLevel(   rset.getInt("COMT_LEVEL"));
				
				clist.add(bco);				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return clist;
	}

	public int updateReview(Connection con, GameReview bco) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bco.getComtCont());
			pstmt.setInt(2, bco.getComtNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public int deleteReview(Connection con, int comtNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, comtNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
				
		return result;
	}

	

}
