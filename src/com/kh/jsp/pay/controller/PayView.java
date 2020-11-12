package com.kh.jsp.pay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.vo.PageInfo;
import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.gameinfo.model.vo.GameInfo;
import com.kh.jsp.mypage.model.service.MyPageService;
import com.kh.jsp.mypage.model.vo.Cart;
import com.kh.jsp.pay.model.service.PayService;

/**
 * Servlet implementation class PayView
 */
@WebServlet("/view.pay")
public class PayView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String memberId = request.getParameter("memberId");
		String[] gin = request.getParameter("gameInfoNums").split(",");
		int[] gameInfoNums = new int[gin.length];
		
		for(int i = 0; i < gin.length; i++) {
			gameInfoNums[i] = Integer.parseInt(gin[i]);
		}
		
		PayService ps = new PayService();
		
		String page = "";
		
		try {
			
			ArrayList<GameInfo> list = ps.selectList(gameInfoNums);
			
			request.setAttribute("list", list);
			for(GameInfo gi : list) {
				System.out.println(gi.getGminfoName());
			}
			page = "views/mypage/orderForm.jsp";
		
		} catch (GameInfoException e) {
		
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "게임 정보를 가져오지 못했습니다.");
			
			page = "views/common/errorPage.jsp";
		
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
