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
import com.kh.jsp.mypage.model.vo.Cart;
import com.kh.jsp.mypage.model.vo.Ord;

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
	
	public int getOrdCount(Connection con, String memberId) throws MyPageException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("getOrdCount");
		
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
	
	public ArrayList<Ord> ordList(Connection con, String memberId, int currentPage, int limit) throws MyPageException{
		
		ArrayList<Ord> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ordList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;

			pstmt.setString(1, memberId);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Ord o = new Ord();
				
				o.setOrdNo(rset.getInt("ORD_NO"));
				o.setOrdDate(rset.getDate("ORD_DATE"));
				o.setGminfoNum(rset.getInt("GMINFO_NUM"));
				o.setGminfoName(rset.getString("GMINFO_NAME"));
				o.setGminfoPrice(rset.getInt("GMINFO_PRICE"));
				
				list.add(o);
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

	public int getCartCount(Connection con, String memberId) throws MyPageException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("getCartCount");
		
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

	public ArrayList<Cart> cartList(Connection con, String memberId, int currentPage, int limit) throws MyPageException {
		
		ArrayList<Cart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("cartList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;

			pstmt.setString(1, memberId);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Cart c = new Cart();

				c.setGminfoNum(rset.getInt("GMINFO_NUM"));
				c.setGminfoName(rset.getString("GMINFO_NAME"));
				c.setGminfoPrice(rset.getInt("GMINFO_PRICE"));

				
				list.add(c);
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

	public ArrayList<Ord> searchOrd(Connection con, String memberId, String date1, String date2) throws MyPageException {
		
		ArrayList<Ord> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("searchOrd");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, date2);
			pstmt.setString(2, date1);		
			pstmt.setString(3, memberId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Ord o = new Ord();
				
				o.setGminfoNum(rset.getInt(1));				
				o.setOrdNo(rset.getInt(2));
				o.setMemberId(rset.getString(3));
				o.setOrdDate(rset.getDate(4));
				o.setGminfoName(rset.getString(5));
				o.setGminfoDate(rset.getDate(6));
				o.setGminfoCompany(rset.getString(7));
				o.setGminfoExp(rset.getString(8));
				o.setGmTypeNum(rset.getInt(9));
				o.setGminfoAge(rset.getInt(10));
				o.setGminfoPrice(rset.getInt(11));
				
				list.add(o);
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

	public int deleteCart(Connection con, int gminfoNum) throws MyPageException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteCart");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, gminfoNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MyPageException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
}
