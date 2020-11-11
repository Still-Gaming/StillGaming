package com.kh.jsp.gamegenre.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.gamegenre.model.dao.GameGenreDAO;
import com.kh.jsp.gamegenre.model.vo.GameGenre;
import static com.kh.jsp.common.JDBCTemplate.*;

public class GameGenreService {
	private Connection con;
	private GameGenreDAO grDAO = new GameGenreDAO();
	
	public ArrayList<GameGenre> selectList() {
		con = getConnection();
		
		ArrayList<GameGenre> list = grDAO.selectList(con);
		
		close(con);
		
		return list;
	}

}
