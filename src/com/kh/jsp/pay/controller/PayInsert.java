package com.kh.jsp.pay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.PayException;
import com.kh.jsp.mypage.model.vo.Ord;
import com.kh.jsp.pay.model.service.PayService;

/**
 * Servlet implementation class PayInsert
 */
@WebServlet("/insert.pay")
public class PayInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Ord> list = new ArrayList<>();
		String memberId = request.getParameter("memberId");
		String[] gin = request.getParameter("gameInfoNums").split(",");
		int[] gameInfoNums = new int[gin.length];
		int ordPrice = Integer.parseInt(request.getParameter("price"));
		

		for(int i = 0; i < gin.length; i++) {
			gameInfoNums[i] = Integer.parseInt(gin[i]);
			
			Ord or = new Ord(memberId, gameInfoNums[i], ordPrice);
			
			System.out.println(gameInfoNums[i]);

			list.add(or);

		}
		

		PayService ps = new PayService();
		
		String page = "";
		
		try {
			ps.insertPay(list);
			
			request.setAttribute("list", list);

			page = "views/mypage/orderSuccess.jsp";

		} catch (PayException e) {
			request.setAttribute("msg", "주문정보 추가 에러 발생");
			request.setAttribute("exception", e);
		
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
