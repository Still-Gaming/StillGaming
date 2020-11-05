package com.kh.jsp.gameinfo.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.common.exception.BoardException;
import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.vo.GameImage;
import com.kh.jsp.gameinfo.model.vo.GameInfo;

import static com.kh.jsp.common.JDBCTemplate.*;


public class GameInfoDAO {
	private Properties prop;
	
	public GameInfoDAO() {
		prop = new Properties();
		
		String filePath = GameInfoDAO.class
							.getResource("/config/gamelist-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public int getListCount(Connection con) {
		int result = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<GameInfo> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<GameInfo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				GameInfo b = new GameInfo();
				
				
				b.setGminfoName(   rset.getString("gminfo_Name"));
				b.setGminfoExp( rset.getString("gminfo_Exp"));
				b.setGminfoPrice( rset.getInt("gminfo_Price"));
				
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}


	public int insertGameInfo(Connection con, GameInfo g) throws GameInfoException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertGameInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, g.getGminfoName());
			pstmt.setDate(2, g.getGminfoDate());
			pstmt.setString(3, g.getGminfoCompany());
			pstmt.setString(4, g.getGminfoExp());
			pstmt.setInt(5, g.getGmTypenum());
			pstmt.setInt(6, g.getGminfoAage());
			pstmt.setInt(7, g.getGminfoPrice());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}
	
		return result;
	}


	public int insertGameImage(Connection con, GameImage gi) throws GameInfoException{
			PreparedStatement pstmt = null;
			int result = 0;
			
			String sql = prop.getProperty("insertGameImageFile");
			
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, gi.getGminfoNum());
				pstmt.setString(2, gi.getGmimgFile());
				pstmt.setString(3, gi.getGmimgCgfile());
				pstmt.setString(4, gi.getGmimgPath());
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		return result;
	}


	public int getCurrentGminfoNum(Connection con) throws GameInfoException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("currentGminfoNum");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	
	}



}
