package com.kh.jsp.pay.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.gameinfo.model.vo.GameInfo;
import com.kh.jsp.mypage.model.vo.Ord;
import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.common.exception.PayException;
import com.kh.jsp.gameinfo.model.dao.GameInfoDAO;
import com.kh.jsp.pay.model.dao.PayDAO;

import static com.kh.jsp.common.JDBCTemplate.*;

public class PayService {

	private Connection con;
	private PayDAO pDAO = new PayDAO();
	
	public ArrayList<GameInfo> selectList(int[] gameInfoNums) throws GameInfoException {
		con = getConnection();
		
		ArrayList<GameInfo> list = new ArrayList<>();
		
		for(int i = 0; i < gameInfoNums.length; i++) {
			GameInfo gi = new GameInfoDAO().selectGameInfo(con, gameInfoNums[i]);
			
			list.add(gi); 
		}
		
		return list;
	}

	public int insertPay(ArrayList<Ord> list) throws PayException {
		con = getConnection();
		
		int totalresult = 0;
		
		for(Ord o : list) {
			int result = pDAO.insertPay(con, o);
			
			if(result > 0)totalresult++;
		}
		
		if( totalresult > 0  && totalresult == list.size() ) { 
			commit(con);
			System.out.println(list.size());

		} else {   
			rollback(con);
		}
		
		close(con);
		
		return totalresult;
	}
		
	}
	
	
	
