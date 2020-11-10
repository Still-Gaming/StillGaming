package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.mypage.model.service.MyPageService;
import com.kh.jsp.mypage.model.vo.Ord;

/**
 * Servlet implementation class OrdSearch
 */
@WebServlet("/searchOrd.my")
public class OrdSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		
		ArrayList<Ord> list = new ArrayList<>();
		
		MyPageService mps = new MyPageService();
		
		String page = null;
		
		try {
			list = mps.searchOrd(memberId, date1, date2);
		
			request.setAttribute("list", list);
			
			page = "/views/mypage/myOrder.jsp";
			
		} catch (MyPageException e) {
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "검색 실패!");
			page = "/views/common/error-Page.jsp";
			
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(page)
						.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
