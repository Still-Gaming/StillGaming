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
	
	public ArrayList<GameImage> selectList(Connection con, int currentPage, int limit) throws GameInfoException {
		
		ArrayList<GameImage> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListImage");

		try {
			pstmt = con.prepareStatement(sql);
			
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GameImage gi = new GameImage();
				
				gi.setGminfoNum(   rset.getInt("gminfo_num"));
				gi.setGminfoName(   rset.getString("gminfo_name"));
				gi.setGminfoExp( rset.getString("gminfo_exp"));
				gi.setGminfoPrice( rset.getInt("gminfo_price"));
				gi.setGminfoDate( rset.getDate("gminfo_date"));
				gi.setGminfoCompany( rset.getString("gminfo_company"));
				gi.setGminfoExp( rset.getString("gminfo_exp"));
				gi.setGmTypeNum( rset.getInt("gm_typenum"));
				gi.setGminfoAge( rset.getInt("gminfo_age"));
				gi.setGminfoImage( rset.getString("gmimg_cgfile"));
				gi.setGminfoAgeRank( rset.getString("RANK_NAME"));
				gi.setGminfoType( rset.getString("gm_type"));
				
				list.add(gi);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
			
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
			pstmt.setInt(5, g.getGmTypeNum());
			pstmt.setInt(6, g.getGminfoAge());
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
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(pstmt);
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
			System.out.println("번호 : " + result);
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	
	}


	public GameInfo selectGameInfo(Connection con, int gminfoNum) throws GameInfoException {
			GameInfo result = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			System.out.println(gminfoNum);
			
			String sql = prop.getProperty("selectGameInfo");
			
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, gminfoNum);
				
				rset = pstmt.executeQuery();
				
				
				if(rset.next()) {
					result = new GameInfo();
					
					 result.setGminfoNum(   rset.getInt("gminfo_num"));
					 result.setGminfoName(   rset.getString("gminfo_name"));
					 result.setGminfoExp( rset.getString("gminfo_exp"));
					 result.setGminfoPrice( rset.getInt("gminfo_price"));
					 result.setGminfoDate( rset.getDate("gminfo_date"));
					 result.setGminfoCompany( rset.getString("gminfo_company"));
					 result.setGminfoExp( rset.getString("gminfo_exp"));
					 result.setGmTypeNum( rset.getInt("gm_typenum"));
					 result.setGminfoAge( rset.getInt("gminfo_age"));
					 result.setGminfoImage( rset.getString("gmimg_cgfile"));
					
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


	public GameImage selectGameImage(Connection con, int gminfoNum) throws GameInfoException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		GameImage result = null;
		
		String sql = prop.getProperty("selectGameImageFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, gminfoNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next() ) {
				result = new GameImage();
				
				result.setGmimgNum(rset.getInt("GMIMG_NUM"));
				result.setGminfoNum(gminfoNum);
				result.setGmimgFile(rset.getString("GMIMG_FILE"));
				result.setGmimgCgfile(rset.getString("GMIMG_CGFILE"));
				result.setGmimgPath(rset.getString("GMIMG_PATH"));
				result.setGminfoImage(rset.getString("GMIMG_FILE"));
				
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


	public int updateGameInfo(Connection con, GameInfo b) throws GameInfoException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateGameInfo");
			System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, b.getGminfoName());
			pstmt.setDate(2, b.getGminfoDate());
			pstmt.setString(3, b.getGminfoCompany());
			pstmt.setString(4, b.getGminfoExp());
			pstmt.setInt(5, b.getGmTypeNum());
			pstmt.setInt(6, b.getGminfoAge());
			pstmt.setInt(7, b.getGminfoPrice());
			pstmt.setInt(8, b.getGminfoNum());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new GameInfoException("[DAO] :" + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int updateGameImage(Connection con, GameImage bf) throws GameInfoException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateGameImage");
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			System.out.println(sql + "1111");
			pstmt.setString(1, bf.getGmimgFile());
			pstmt.setString(2, bf.getGmimgCgfile());
			pstmt.setString(3, bf.getGmimgPath());
			pstmt.setInt(4, bf.getGminfoNum());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
			
		} finally {
		
			close(pstmt);
		}
		
		return result;
	}


	public int deleteGameInfo(Connection con, int gminfoNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteGameInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, gminfoNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
				
		return result;
	
	}


	public ArrayList<GameImage> searchList(Connection con, String condition, String keyword) throws GameInfoException {
		ArrayList<GameImage> list1 = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch (condition) {
		case "name" :       // 게임이름 검색 시
			sql = prop.getProperty("searchName");
			break;
		case "company" :    // 게임회사 검색 시
			sql = prop.getProperty("searchCompany");
			break;
		case "content" :    // 내용으로 검색 시
			sql = prop.getProperty("searchContent");
			break;
		}
		
		System.out.println(sql);
		System.out.println(keyword);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, 10);
			pstmt.setInt(2, 1);
			pstmt.setString(3, "%" + keyword + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GameImage gi = new GameImage();
				
				
				gi.setGminfoNum(   rset.getInt("gminfo_num"));
				gi.setGminfoName(   rset.getString("gminfo_name"));
				gi.setGminfoExp( rset.getString("gminfo_exp"));
				gi.setGminfoPrice( rset.getInt("gminfo_price"));
				gi.setGminfoDate( rset.getDate("gminfo_date"));
				gi.setGminfoCompany( rset.getString("gminfo_company"));
				gi.setGminfoExp( rset.getString("gminfo_exp"));
				gi.setGmTypeNum( rset.getInt("gm_typenum"));
				gi.setGminfoAge( rset.getInt("gminfo_age"));
				gi.setGminfoImage( rset.getString("gmimg_cgfile"));
				gi.setGminfoAgeRank( rset.getString("RANK_NAME"));
				gi.setGminfoType( rset.getString("gm_type"));
				
				list1.add(gi);
				System.out.println(gi.getGminfoName());
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
		
		} finally {
			
			close(rset);
			close(pstmt);
		}		
		
		return list1;
	
}

	public ArrayList<GameImage> searchAll(Connection con, String keyword) throws GameInfoException {
		ArrayList<GameImage> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchAll");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GameImage gi = new GameImage();
				
				gi.setGminfoNum(   rset.getInt("gminfo_num"));
				gi.setGminfoName(   rset.getString("gminfo_name"));
				gi.setGminfoExp( rset.getString("gminfo_exp"));
				gi.setGminfoPrice( rset.getInt("gminfo_price"));
				gi.setGminfoDate( rset.getDate("gminfo_date"));
				gi.setGminfoCompany( rset.getString("gminfo_company"));
				gi.setGminfoExp( rset.getString("gminfo_exp"));
				gi.setGmTypeNum( rset.getInt("gm_typenum"));
				gi.setGminfoAge( rset.getInt("gminfo_age"));
				gi.setGminfoImage( rset.getString("gmimg_cgfile"));
				gi.setGminfoAgeRank( rset.getString("RANK_NAME"));
				gi.setGminfoType( rset.getString("gm_type"));
				
				list.add(gi);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
		
		} finally {
			
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}


	public ArrayList<GameImage> indexList(Connection con) throws GameInfoException {
		ArrayList<GameImage> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("indexList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GameImage gi = new GameImage();
				
				gi.setGminfoNum(rset.getInt("GMINFO_NUM"));
				gi.setGminfoName(rset.getString("GMINFO_NAME"));
				gi.setGminfoDate(rset.getDate("GMINFO_DATE"));
				gi.setGminfoCompany(rset.getString("GMINFO_COMPANY"));
				gi.setGminfoExp(rset.getString("GMINFO_EXP"));
				gi.setGmTypeNum(rset.getInt("GM_TYPENUM"));
				gi.setGminfoAge(rset.getInt("GMINFO_AGE"));
				gi.setGminfoPrice(rset.getInt("GMINFO_PRICE"));
				gi.setGmimgNum(rset.getInt("GMIMG_NUM"));
				gi.setGmimgFile(rset.getString("GMIMG_FILE"));
				gi.setGmimgCgfile(rset.getString("GMIMG_CGFILE"));
				gi.setGmimgPath(rset.getString("GMIMG_PATH"));
				gi.setGminfoAgeRank(rset.getString("RANK_NAME"));
				gi.setGminfoType(rset.getString("GM_TYPE"));
				
				list.add(gi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new GameInfoException("[DAO] : " + e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}




