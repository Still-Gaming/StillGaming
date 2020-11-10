package com.kh.jsp.member.controller;

import java.io.IOException;
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
@WebServlet("/searchId.me")
public class MemberSearchId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchId() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("idName");
		String email = request.getParameter("idEmail");
		
		MemberService ms = new MemberService();
		
		String page = "";
		
		try {
			String memberId = ms.searchId(name, email);
			
			if(memberId == null) {
				request.setAttribute("exception", new MemberException("없는 회원입니다."));
				request.setAttribute("error-msg", "입력하신 정보로 가입한 회원이 없습니다.");
				
				page = "views/common/errorPage.jsp";
			} else {
				request.setAttribute("memberId", memberId);
				
				page = "views/member/searchIdSuccess.jsp";
			}
		} catch (MemberException e) {
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "아이디 찾기 실패");
			
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
