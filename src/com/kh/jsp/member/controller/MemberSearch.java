package com.kh.jsp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberSearch
 */
@WebServlet("/MemberSearch.me")
public class MemberSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		ArrayList<Member> list = new ArrayList<>();
		
		
		// 검색 키워드(keyword)
		String keyword = request.getParameter("memberId");
		
		MemberService ms = new MemberService();
		
		String page = null;
		
		try {
			list = ms.searchMember(keyword);
			
			request.setAttribute("list", list);
			
			page = "views/manage/member_manage.jsp";
			
		} catch (MemberException e) {
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "검색 실패!");
			page = "views/common/errorPage.jsp";
			
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(page).forward(request, response);
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
