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
 * Servlet implementation class MemberSearchPwd
 */
@WebServlet("/searchPwd.me")
public class MemberSearchPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchPwd() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("pwdId");
		String name = request.getParameter("pwdName");
		String email = request.getParameter("pwdEmail");
		
		Member m = new Member();
		
		m.setMemberId(memberId);
		m.setMemberName(name);
		m.setEmail(email);
		
		MemberService ms = new MemberService();
		
		String page = "";
		
		try {
			int result = ms.searchPwd(m);
			
			if(result == 1) {
				request.setAttribute("searchMember", m);
				
				page = "views/member/updatePwd.jsp";
			} else {
				request.setAttribute("exception", new Exception("회원 특정 실패"));
				request.setAttribute("error-msg", "입력하신 정보와 일치하는 회원을 찾을 수 없습니다.");
				
				page = "views/common/errorPage.jsp";
			}
		} catch (MemberException e) {
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "회원 조회 실패");
			
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
