package com.kh.jsp.board.model.service;

import java.sql.Connection;

import com.kh.jsp.board.model.dao.BoardDAO;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.exception.BoardException;

import static com.kh.jsp.common.JDBCTemplate.*;

public class BoardService {
	private Connection con;
	private BoardDAO bDAO = new BoardDAO();
	
	public void insertBoard(Board b) throws BoardException {
		con = getConnection();
		
		int result = bDAO.insertBoard(con, b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
	}
	
	
}
