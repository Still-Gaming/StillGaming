package com.kh.jsp.pay.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jsp.common.JDBCTemplate.*;
import com.kh.jsp.common.exception.PayException;
import com.kh.jsp.member.model.dao.MemberDAO;
import com.kh.jsp.mypage.model.vo.Ord;

public class PayDAO {
	
	private Properties prop;
	
	public PayDAO() {
		prop = new Properties();
		
		String filePath = MemberDAO.class.getResource("/config/pay-sql.properties")
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

	public int insertPay(Connection con, Ord o) throws PayException {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPay");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, o.getMemberId());
			pstmt.setInt(2, o.getGminfoNum());
			pstmt.setInt(3, o.getGminfoPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new PayException("[DAO] : " + e.getMessage());
		} finally {
			
			close(pstmt);
		}
		
		
		return result;
	}

}
