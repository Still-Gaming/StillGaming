package com.kh.jsp.qna.model.dao;



import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.kh.jsp.qna.model.vo.Qna;

public class QnaDAO {
	
		public Qna selectQna1(Connection con, Qna q) {
			// 1. SQL 실행에 사용할 변수 선언
			Qna result = null;    
			Statement stmt = null;    
			ResultSet rset = null;    
			
			
			
		//String sql = "SELECT * FROM QNA " 
				
	
			
			
			
			try {
				stmt = con.createStatement();
				String sql;
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) { 
			
					result = new Qna();
					
					result.set qnaNo(     q.get qnaNo()            );
					result.setmemberId(    q.getmemberId()           );
					result.setqnaCode(   rset.getqnaCode();
					result.setGender(     rset.getString(4)        );
					result.setAge(        rset.getInt("AGE")       );
					result.setPhone(      rset.getString("phone")  );
					result.setAddress(    rset.getString("address"));
					result.setEmail(      rset.getString("email")  );
					result.setHobby(      rset.getString("hobby")  );
				}
				private int qnaNo;
				private String memberId;
				private int qnaCode;
				private String qnaTitle;
				private String qnaContent;
				private Date qnaDate;
				private String qnaAnswer;
				
				
				
				
				
				
				
				System.out.println("조회 결과 확인 : " + result);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			} finally {
				close(rset);
				close(stmt);
			}
			
			return result;
		}

		
		public Qna selectQna(Connection con, Qna q) {
			// TODO Auto-generated method stub
			return null;
		}


		public int insertQna(Connection con, Object joinQna) {
			// TODO Auto-generated method stub
			return 0;
		}