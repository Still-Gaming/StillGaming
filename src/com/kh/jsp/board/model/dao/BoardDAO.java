package com.kh.jsp.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.board.model.vo.BoardFile;
import com.kh.jsp.common.exception.BoardException;

import static com.kh.jsp.common.JDBCTemplate.*;

public class BoardDAO {
	private Properties prop;

	public BoardDAO() {
		prop = new Properties();
		
		String filePath = BoardDAO.class.getResource("/config/board-sql.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertBoard(Connection con, Board b) throws BoardException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getMemberId());
			pstmt.setInt(2, b.getBoardType());
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardText());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertBoardFile(Connection con, BoardFile bf) throws BoardException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoardFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bf.getBoardNo());
			pstmt.setString(2, bf.getFileName());
			pstmt.setString(3, bf.getFileChangeName());
			pstmt.setString(4, bf.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) throws BoardException {
		int result = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) throws BoardException {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");

		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + 9;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardType(rset.getInt("BOARD_TYPE"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardText(rset.getString("BOARD_TEXT"));
				b.setMemberId(rset.getString("MEMBER_ID"));
				b.setBoardCount(rset.getInt("BOARD_COUNT"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}

	public int getCurrentBoardNo(Connection con) throws BoardException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("currentBoardNo");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection con, Board b) throws BoardException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardText());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoardFile(Connection con, BoardFile bf) throws BoardException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateBoardFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bf.getFileName());
			pstmt.setString(2, bf.getFileChangeName());
			pstmt.setString(3, bf.getFilePath());
			pstmt.setInt(4, bf.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public BoardFile selectBoardFile(Connection con, int boardNo) throws BoardException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardFile result = null;
		
		String sql = prop.getProperty("selectBoardFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new BoardFile();
				
				result.setFileNo(rset.getInt("FILE_NO"));
				result.setBoardNo(boardNo);
				result.setFileName(rset.getString("FILE_NAME"));
				result.setFileChangeName(rset.getString("FILE_CHANGE_NAME"));
				result.setFilePath(rset.getString("FILE_PATH"));
				result.setFileUploadDate(rset.getDate("FILE_UPLOADDATE"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Board selectBoard(Connection con, int boardNo) throws BoardException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board result = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Board();
				
				result.setBoardNo(boardNo);
				result.setMemberId(rset.getString("MEMBER_ID"));
				result.setBoardType(rset.getInt("BOARD_TYPE"));
				result.setBoardTitle(rset.getString("BOARD_TITLE"));
				result.setBoardText(rset.getString("BOARD_TEXT"));
				result.setBoardDate(rset.getDate("BOARD_DATE"));
				result.setBoardCount(rset.getInt("BOARD_COUNT"));
				result.setBoardStatus(rset.getString("BOARD_STATUS").charAt(0));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int plusCount(Connection con, int boardNo) throws BoardException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("plusCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoard(Connection con, int boardNo) throws BoardException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> searchBoard(Connection con, int currentPage, int limit, String category, String searchWord) throws BoardException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = new HashMap<>();
		ArrayList<Board> list = new ArrayList<>();
		int listCount = 0;
		
		String sql = prop.getProperty("search" + category);
		
		int startRow = (currentPage - 1) * limit + 1; 
		int endRow = startRow + 9;
		System.out.println(category + " / " + startRow + " / " + endRow + " / " + searchWord);
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%" + searchWord + "%");
			pstmt.setString(2, "%" + searchWord + "%");
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardType(rset.getInt("BOARD_TYPE"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardText(rset.getString("BOARD_TEXT"));
				b.setMemberId(rset.getString("MEMBER_ID"));
				b.setBoardCount(rset.getInt("BOARD_COUNT"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				
				list.add(b);
				
				if(listCount == 0) {
					listCount = rset.getInt("LISTCOUNT");
				}
			}
			
			if(list.size() > 0) hmap.put("list", list);
			hmap.put("listCount", listCount);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BoardException("[DAO] : " + e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

}
