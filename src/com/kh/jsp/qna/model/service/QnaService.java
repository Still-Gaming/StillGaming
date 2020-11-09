package com.kh.jsp.qna.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;


import java.sql.Connection;



import com.kh.jsp.qna.model.dao.QnaDAO;
import com.kh.jsp.qna.model.vo.Qna;

public class QnaService {
	private Connection con;
	private QnaDAO qDAO = new QnaDAO();

	
	public int insertQna(Qna q) {
		
		con = getConnection();
		int result = qDAO.insertQna(con, q);
		
		if( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	

	}
	
	

