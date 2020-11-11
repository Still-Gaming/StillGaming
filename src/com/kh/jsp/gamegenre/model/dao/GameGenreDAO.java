package com.kh.jsp.gamegenre.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.gamegenre.model.vo.GameGenre;
import com.kh.jsp.gameinfo.model.dao.GameInfoDAO;

public class GameGenreDAO {
	private Properties prop;
	public GameGenreDAO() {
		prop = new Properties();
		
		String filePath = GameInfoDAO.class
							.getResource("/config/gameGenre-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<GameGenre> selectList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GameGenre> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GameGenre gg = new GameGenre();
				gg.setGmType(rset.getString("GM_TYPE"));
				gg.setGmTypeNum(rset.getInt("GM_TYPENUM"));
				
				list.add(gg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
