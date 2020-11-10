package com.kh.jsp.board.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

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

	public int updateBoard(Board b, BoardFile bf, String filePath) throws BoardException {
		con = getConnection();
		
		int totalResult = 0;
		int result1 = bDAO.updateBoard(con, b);
		int result2 = 0;
		
		if(result1 > 0 && bf != null) {
			bf.setBoardNo(b.getBoardNo());
			
			BoardFile oldFile = bDAO.selectBoardFile(con, bf.getBoardNo());
			
			result2 = bDAO.updateBoardFile(con, bf);
			
			new File(filePath + oldFile.getFileChangeName()).delete();
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

	public BoardFile selectBoardFile(int boardNo) throws BoardException {
		con = getConnection();
		
		BoardFile result = bDAO.selectBoardFile(con, boardNo);
		
		close(con);
		
		return result;
	}

	public Board selectBoard(int boardNo) throws BoardException {
		con = getConnection();
		
		Board result = bDAO.selectBoard(con, boardNo);
		
		close(con);
		
		return result;
	}

	public void plusCount(int boardNo) throws BoardException {
		con = getConnection();
		
		int result = bDAO.plusCount(con, boardNo);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
	}

	public int deleteBoard(int boardNo) throws BoardException {
		con = getConnection();
		
		int result = bDAO.deleteBoard(con, boardNo);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> searchBoard(int currentPage, int limit, String category, String searchWord) throws BoardException {
		con = getConnection();
		
		HashMap<String, Object> hmap = bDAO.searchBoard(con, currentPage, limit, category, searchWord);
		
		close(con);
		
		return hmap;
	}

}
