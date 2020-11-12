package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MyMain
 */
@WebServlet("/main.my")
public class MyMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMain() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		
		MyPageService mps = new MyPageService();
		
		String page = "";
		
		try {
			int cartCount = mps.getCartCount(memberId);
			int ordCount = mps.getOrdCount(memberId);
			int listCount = mps.getListCount(memberId);
			
			HashMap<String, Integer> hmap = new HashMap<>();
			
			hmap.put("cartCount", cartCount);
			hmap.put("ordCount", ordCount);
			hmap.put("listCount", listCount);
			
			request.setAttribute("counts", hmap);
			
			page = "views/mypage/mypageMain.jsp";
		} catch (MyPageException e) {
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "마이페이지 조회 실패");
			
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
