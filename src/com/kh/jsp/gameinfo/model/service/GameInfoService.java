package com.kh.jsp.gameinfo.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.commit;
import static com.kh.jsp.common.JDBCTemplate.getConnection;
import static com.kh.jsp.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.dao.GameInfoDAO;
import com.kh.jsp.gameinfo.model.vo.GameImage;
import com.kh.jsp.gameinfo.model.vo.GameInfo;



public class GameInfoService {
	private Connection con;
	private GameInfoDAO nDAO = new GameInfoDAO();
	
	
	public ArrayList<GameImage> selectList(int currentPage, int limit) throws GameInfoException {
		con = getConnection();
		
		ArrayList<GameImage> list = nDAO.selectList(con, currentPage, limit);
		
		
		
		close(con);
		
		return list;
		
	}


	public int getListCount() {
		con = getConnection();
		
		int result = nDAO.getListCount(con);
		
		close(con);
		
		return result;
	}


	public int insertGameInfo(GameInfo g, GameImage gi) throws GameInfoException {
		con = getConnection();
		int result = 0;
		
		int result1 = nDAO.insertGameInfo(con, g);
		int result2 = 0;
		
		
		if(result1 > 0) {
			int gminfoNum = nDAO.getCurrentGminfoNum(con);
					
			if(gminfoNum > 0 && gi != null) {
					gi.setGminfoNum(gminfoNum);
					
					result2 = nDAO.insertGameImage(con, gi);
			}
			
		}
		
		
		if( result1 > 0 && result2 > 0 ) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		close(con);
			
		return result;
	}


	public GameInfo selectGameInfo(int gminfoNum) throws GameInfoException {
			con = getConnection();
			
			GameInfo result = nDAO.selectGameInfo(con, gminfoNum);
			
			close(con);
			
			return result;
	}



	public GameImage selectGameImage(int gminfoNum) throws GameInfoException {
			con = getConnection();
			
			GameImage result = nDAO.selectGameImage(con, gminfoNum);
			
			
			
			close(con);
		
			return result;
	}

	public int updateGameInfo(GameInfo b, GameImage bf, String filePath) throws GameInfoException {
			con = getConnection();
			
			int totalResult = 0;
			int result1 = nDAO.updateGameInfo(con, b);
			int result2 = 0;
			
			if(result1 > 0 && bf != null) {
				
				bf.setGminfoNum(b.getGminfoNum());
				
			GameImage oldFile = nDAO.selectGameImage(con, bf.getGminfoNum());
				
				result2 = nDAO.updateGameImage(con, bf);
				
			new File(filePath + oldFile.getGmimgCgfile()).delete();
		}	
			
		if(result1 > 0 && (bf == null || result2 > 0)) {
			totalResult = 1;
			
			
			commit(con);
		} else {
			rollback(con);
			
		}
		close(con);
			
		return totalResult;

	
	}

	public int deleteGameInfo(int gminfoNum, String filePath) throws GameInfoException {
	
		con = getConnection();
		
		int result = nDAO.deleteGameInfo(con, gminfoNum);
		
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	
	}


	public ArrayList<GameImage> searchGame(String condition, String keyword) throws GameInfoException {
		con = getConnection();
		
		ArrayList<GameImage> list = null;
		
		// 검색 옵션에 제목, 작성자 등 그 어떤 것이라도
		// 조건을 달았다면 조건부 검색을 실시
		if( condition.length() > 0 ) {
			
			list = nDAO.searchList(con, condition, keyword);
			
		} else {
			// 검색 옵션을 선택하지 않았다면 전체 검색
			list = nDAO.searchAll(con, keyword);
		}
		
		close(con);
		
		return list;
	}


	public ArrayList<GameImage> indexList() throws GameInfoException {
		con = getConnection();
		
		ArrayList<GameImage> list = nDAO.indexList(con);
		
		close(con);
		
		return list;
	}

}
	

