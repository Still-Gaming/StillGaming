package com.kh.jsp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.mypage.model.service.MyPageService;

/**
 * Servlet implementation class CartInsert
 */
@WebServlet("/insert.cart")
public class CartInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsert() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		int gminfoNum = Integer.parseInt(request.getParameter("gminfoNum"));
		System.out.println("멤버 아이디 : " + memberId);
		System.out.println("게임 번호 : " + gminfoNum);
		MyPageService mps = new MyPageService();
		
		int result = 0;
		
		try {
			result = mps.insertCart(memberId, gminfoNum);
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
