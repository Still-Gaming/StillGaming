package com.kh.jsp.member.model.dao;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		String filePath = MemberDAO.class.getResource("/config/member-sql.properties")
						 .getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection con, Member joinMember) throws MemberException  {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		System.out.println(joinMember.getGender()+"1234");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, joinMember.getMemberId());
			pstmt.setString(2, joinMember.getMemberName());
			pstmt.setString(3, joinMember.getMemberPwd());
			pstmt.setString(4, joinMember.getMemberSsn());
			pstmt.setString(5, joinMember.getGender());
			pstmt.setString(6, joinMember.getEmail());
			pstmt.setString(7, joinMember.getPhone());
			
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());


		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public Member selectMember(Connection con, Member m) {
		
		Member result = null;  
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			
			rset = pstmt.executeQuery();

			if(rset.next()) { 

				result = new Member();
				
				result.setMemberId(m.getMemberId());
				result.setMemberPwd(m.getMemberPwd());
				result.setMemberName(rset.getString("member_name")); 
				result.setGender(rset.getString("gender") );
				result.setMemberSsn( rset.getString("Member_Ssn"));
				result.setPhone(rset.getString("phone"));
				result.setEmail( rset.getString("email"));
				result.setJoinDate(rset.getDate("join_date"));
				result.setReportNum(rset.getInt("report_num"));
			}
			
			System.out.println("조회 결과 확인 : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection con, String memberId) throws MemberException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());

		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMember(Connection con, Member m) throws MemberException {
		
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberPwd() );
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getMemberId());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public int idDupCheck(Connection con, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int emailDupCheck(Connection con, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("emailDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public String searchId(Connection con, String name, String email) throws MemberException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String memberId = null;
		
		String sql = prop.getProperty("searchId");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberId = rset.getString("MEMBER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberId;
	}

	public int searchPwd(Connection con, Member m) throws MemberException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("searchPwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePwd(Connection con, Member m) throws MemberException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberPwd());
			pstmt.setString(2, m.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
