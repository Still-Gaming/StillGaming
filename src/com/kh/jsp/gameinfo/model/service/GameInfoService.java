package com.kh.jsp.gameinfo.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.gameinfo.model.dao.GameInfoDAO;
import com.kh.jsp.gameinfo.model.vo.GameInfo;


public class GameInfoService {
	private Connection con;
	private GameInfoDAO nDAO = new GameInfoDAO();
	
	
	public ArrayList<GameInfo> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<GameInfo> list = nDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
		
	}


	public int getListCount() {
		con = getConnection();
		
		int result = nDAO.getListCount(con);
		
		close(con);
		
		return result;
	}


	
	
}
