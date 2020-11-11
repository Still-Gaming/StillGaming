package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.vo.PageInfo;
import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.mypage.model.service.MyPageService;
import com.kh.jsp.mypage.model.vo.Ord;

/**
 * Servlet implementation class MyOrder
 */
@WebServlet("/ord.my")
public class MyOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		
		MyPageService mps = new MyPageService();
		
		ArrayList<Ord> list = null;

		String page = "";
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit = 10;
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = 0;
		
		try {
			listCount = mps.getOrdCount(memberId);
			
			System.out.println("총 구매내역 수 : " + listCount);

		} catch (MyPageException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "주문내역 개수 조회 실패");
			
			page = "/views/common/errorPage.jsp";
		}
		
		maxPage = (int)Math.ceil((double)listCount/limit);
		
		startPage = ((currentPage - 1)/limit) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		try {
			list = mps.ordList(memberId, currentPage, limit);
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			page = "/views/mypage/myOrder.jsp";
			
		} catch (MyPageException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "주문내역 조회 실패");
			
			page = "/views/common/errorPage.jsp";
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
