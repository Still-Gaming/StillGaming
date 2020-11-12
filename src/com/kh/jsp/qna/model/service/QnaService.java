package com.kh.jsp.qna.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import com.kh.jsp.common.exception.QnaException;

import com.kh.jsp.qna.model.dao.QnaDAO;
import com.kh.jsp.qna.model.vo.Qna;
import com.kh.jsp.qna.model.vo.QnaFile;

public class QnaService {
	private Connection con;
	private QnaDAO qDAO = new QnaDAO();

	
	public int insertQna(Qna q, QnaFile qf) throws QnaException {
		
		con = getConnection();
		int result = qDAO.insertQna(con, q, qf);
		
		if( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	
	
	public Qna selectOne(int qno) {
		con = getConnection();
		Qna q = qDAO.selectOne(con, qno);
		
		close(con);
		
		return q;
	}




	public ArrayList<Qna> selectList() throws QnaException {

		con = getConnection();
		
		ArrayList<Qna> list = qDAO.selectList(con);
		
		close(con);
		
		return list;
	}

	
	

	}
	
	

