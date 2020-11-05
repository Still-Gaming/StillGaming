package com.kh.jsp.qna.model.service;



import java.sql.Connection;


import com.kh.jsp.qna.model.dao.QnaDAO;
import com.kh.jsp.qna.model.vo.Qna;

public class QnaService {


		private Connection con;
		private QnaDAO qDAO = new QnaDAO();
		
		public Qna selectQna(Qna q) {
			
			con = getConnection();
			
			Qna result = qDAO.selectQna(con, q);
			
			close(con);
			
			return result;
			
		}

		private Connection getConnection() {
			// TODO Auto-generated method stub
			return null;
		}

		public int insertMember(Qna joinQna) {
			
			con = getConnection();
			int result = qDAO.insertQna(con, joinQna();
			
			if( result > 0 ) {
				commit(con);
			} else {        
				rollback(con);
			}
			
			close(con);
			
			return result;
		}

		private Object joinQna() {
			// TODO Auto-generated method stub
			return null;
		}


		
	}
