package com.kh.jsp.gamereview.model.service;


import com.kh.jsp.gamereview.model.dao.GameReviewDAO;
import com.kh.jsp.gamereview.model.vo.GameReview;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class GameReviewService {

	private Connection con;
	private GameReviewDAO grDAO = new GameReviewDAO();
	
	public int insertReview(GameReview review) {
		con = getConnection();
		
		int result = grDAO.insertReview(con, review);
		
		if( result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public ArrayList<GameReview> selectList(int gminfoNum) {
		con = getConnection();
		
		ArrayList<GameReview> clist = grDAO.selectList(con, gminfoNum);
		
		close(con);
		
		return clist;

	}

	public int updateReview(GameReview bco) {
		con = getConnection();
		
		int result = grDAO.updateReview(con, bco);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteReview(int comtNum) {
		con = getConnection();
		
		int result = grDAO.deleteReview(con, comtNum);
		
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
}	
