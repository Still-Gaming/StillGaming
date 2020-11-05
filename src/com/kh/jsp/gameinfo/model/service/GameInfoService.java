package com.kh.jsp.gameinfo.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.commit;
import static com.kh.jsp.common.JDBCTemplate.getConnection;
import static com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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


	public int insertGameInfo(GameInfo g, GameImage gi) {
		con = getConnection();
		
		int result = 0;
		
		// 1. 사진 게시글 저장
		int result1 = nDAO.insertGameInfo(con, g);
		
		if(result1 > 0) {
			int gino = nDAO.getCurrentGameInfono(con);
			
			gi.setGminfoNum(gino);
		}
		
		// 2. 첨부파일 여러개 저장
		int result2 = nDAO.insertGameImage(con, gi);
			
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		close(con);
			
		return result;
	}
	}


	
	
}
