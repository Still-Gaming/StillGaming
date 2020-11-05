package com.kh.jsp.gameinfo.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.commit;
import static com.kh.jsp.common.JDBCTemplate.getConnection;
import static com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.dao.GameInfoDAO;
import com.kh.jsp.gameinfo.model.vo.GameImage;
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


	public void insertGameInfo(GameInfo g, GameImage gi) throws GameInfoException {
		con = getConnection();
		
		int result1 = nDAO.insertGameInfo(con, g);
		int result2 = 0;
		
		
		if(result1 > 0) {
			int gminfoNum = nDAO.getCurrentGminfoNum(con);
					
			if(gminfoNum > 0 && gi != null) {
					gi.setGminfoNum(gminfoNum);
					
					result2 = nDAO.insertGameImage(con, gi);
			}
			
		}
		
		
		if( result1 > 0 ) {
			commit(con);
			result1 = 1;
		} else {
			rollback(con);
		}
		close(con);
			
		
	}
}


	

