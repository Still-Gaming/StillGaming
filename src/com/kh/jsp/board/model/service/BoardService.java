package com.kh.jsp.board.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.board.model.dao.BoardDAO;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.board.model.vo.BoardFile;
import com.kh.jsp.common.exception.BoardException;

public class BoardService {
	private Connection con;
	private BoardDAO bDAO = new BoardDAO();
	
	public void insertBoard(Board b, BoardFile bf) throws BoardException {
		con = getConnection();
		
		int result1 = bDAO.insertBoard(con, b);
		int result2 = 0;
		
		if(result1 > 0) {
			int boardNo = bDAO.getCurrentBoardNo(con);

			if(boardNo > 0 && bf != null) {
				bf.setBoardNo(boardNo);
				
				result2 = bDAO.insertBoardFile(con, bf);
			}
		}
		
		if(result1 > 0 && (bf == null || result2 > 0)) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
	}

	public int getListCount() throws BoardException {
		con = getConnection();
		
		int result = bDAO.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) throws BoardException {
		con = getConnection();
		
		ArrayList<Board> list = bDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int updateBoard(Board b, BoardFile bf) throws BoardException {
		con = getConnection();
		
		int totalResult = 0;
		int result1 = bDAO.updateBoard(con, b);
		int result2 = 0;
		
		if(result1 > 0 && bf != null) {
			bf.setBoardNo(b.getBoardNo());
			
			result2 = bDAO.updateBoardFile(con, bf);
		}
		
		close(con);
		
		if(result1 > 0 && (bf == null || result2 > 0)) {
			totalResult = b.getBoardNo();
		}
		
		return totalResult;
	}

}
