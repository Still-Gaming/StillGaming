package com.kh.jsp.member.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

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
	
	public int insertMember(Connection con, Member joinMember) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
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
				result.setMemberPwd(    m.getMemberPwd()           );
				result.setMemberName(   rset.getString("membername")); 
				result.setGender(     rset.getString("gender")        );
				result.setMemberSsn(        rset.getString("MemberSsn")       );
				result.setPhone(      rset.getString("phone")  );
				result.setEmail(      rset.getString("email")  );
				result.setJoinDate(rset.getDate("joindate"));
				result.setReportNum(rset.getInt("reportnum"));
			}
			
			System.out.println("조회 결과 확인 : " + result);
			
		} catch (SQLException e) {
			
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection con, String memberId) {
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
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
public int updateMember(Connection con, Member m) throws MemberException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 비밀번호, 성별, 나이, 이메일, 연락처, 주소, 취미
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString( 1,  m.getMemberId() );
			pstmt.setString( 2,  m.getMemberName()  );
			pstmt.setString( 3,  m.getMemberPwd()     );
			pstmt.setString( 4,  m.getMemberSsn()   );
			pstmt.setString( 5,  m.getGender()   );
			pstmt.setString( 6,  m.getEmail() );
			pstmt.setString( 7,  m.getPhone()   );
			
			
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
