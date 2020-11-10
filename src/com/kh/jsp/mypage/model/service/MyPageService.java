package com.kh.jsp.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.exception.BoardException;
import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.mypage.model.dao.MyPageDAO;
import com.kh.jsp.mypage.model.vo.Cart;
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


	public int getCartCount(String memberId) throws MyPageException {
		con = getConnection();
		
		int result = mpDAO.getCartCount(con, memberId);
		
		close(con);
		
		return result;
	}


	public ArrayList<Cart> cartList(String memberId, int currentPage, int limit) throws MyPageException {
		con = getConnection();
		
		ArrayList<Cart> list = mpDAO.cartList(con, memberId, currentPage, limit);

		close(con);	
		
		return list;
	
	}


	public ArrayList<Ord> searchOrd(String memberId, String date1, String date2) throws MyPageException {
		
		con = getConnection();
		
		ArrayList<Ord> list = null;

		list = mpDAO.searchOrd(con, memberId, date1, date2);

		close(con);
		
		return list;	
		
		}


	public int deleteCart(int gminfoNum) throws MyPageException {
		con = getConnection();
		
		int result = mpDAO.deleteCart(con, gminfoNum);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
}

