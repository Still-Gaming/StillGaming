package com.kh.jsp.member.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.commit;
import static com.kh.jsp.common.JDBCTemplate.getConnection;
import static com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.dao.MemberDAO;
import com.kh.jsp.member.model.vo.Member;



public class MemberService {

	public MemberService(){}
	
	
	private Connection con;
	
	private MemberDAO mDAO = new MemberDAO();

	public int insertMember(Member joinMember) {
		
		con = getConnection();
		int result = mDAO.insertMember(con, joinMember);
		
		if( result > 0 ) { 
			commit(con);
		} else {   
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	public Member selectMember(Member m) {
		
		con = getConnection();
		
		Member result = mDAO.selectMember(con, m);
		
		close(con);
		
		return result;
	}


	public int deleteMember(String memberId) {

		con = getConnection();
		
		int result = mDAO.deleteMember(con, memberId);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	
	}

	public int updateMember(Member m) throws MemberException { 
		con = getConnection(); 
		
		int result = mDAO.updateMember(con, m); 
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;
	}


	public int idDupCheck(String id) {
		con = getConnection();
		
		int result = mDAO.idDupCheck(con, id);
		
		close(con);
		
		return result;
	}


	public int emailDupCheck(String email) {
		con = getConnection();
		
		int result = mDAO.emailDupCheck(con, email);
		
		close(con);
		
		return result;
	}
	
	public ArrayList<Member> searchMember( String keyword) throws MemberException {
		con = getConnection();
		
		ArrayList<Member> list = null;
		
		// 검색 옵션에 제목, 작성자 등 그 어떤 것이라도
		// 조건을 달았다면 조건부 검색을 실시
		
			
			list = mDAO.searchMember(con, keyword);
			
		
		
		close(con);
		
		return list;
	}


	public ArrayList<Member> selectList() throws MemberException {
		con = getConnection();
		
		ArrayList<Member> list =mDAO.selectList(con);
		return list;
		
		
	}

	
	
}




