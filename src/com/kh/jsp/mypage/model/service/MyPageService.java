package com.kh.jsp.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.mypage.model.dao.MyPageDAO;
import com.kh.jsp.mypage.model.vo.Ord;

import static com.kh.jsp.common.JDBCTemplate.*;

public class MyPageService {

	private Connection con;
	private MyPageDAO mpDAO = new MyPageDAO();
	
	public int getListCount(String memberId) throws MyPageException {
		
		con = getConnection();
		
		int result = mpDAO.getListCount(con, memberId);
		
		close(con);
		
		return result;
	}
	

	public ArrayList<Board> selectList(String memberId, int currentPage, int limit) throws MyPageException {

		con = getConnection();
		
		ArrayList<Board> list = mpDAO.selectList(con, memberId, currentPage, limit);

		close(con);	
		
		return list;
	}
	

	public int getOrdCount(String memberId) throws MyPageException {
		
		con = getConnection();
		
		int result = mpDAO.getOrdCount(con, memberId);
		
		close(con);
		
		return result;
	}

	
	public ArrayList<Ord> ordList(String memberId, int currentPage, int limit) throws MyPageException {
		con = getConnection();
		
		ArrayList<Ord> list = mpDAO.ordList(con, memberId, currentPage, limit);

		close(con);	
		
		return list;
	
		
	}



}

