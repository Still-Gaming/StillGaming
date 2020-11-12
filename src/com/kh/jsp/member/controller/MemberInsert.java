package com.kh.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String memberId = request.getParameter("memberId");
	      String memberName = request.getParameter("memberName");
	      String memberPwd = request.getParameter("memberPwd");
	      String memberSsn = request.getParameter("memberSsn");
	      String gender = request.getParameter("gender");
	      String email = request.getParameter("email1") +"@" + request.getParameter("email2");
	      String phone = request.getParameter("phone1") + "-"
	              + request.getParameter("phone2") + "-"
	              + request.getParameter("phone3");
	      
	      Member m = new Member(memberId, memberPwd, memberName, memberSsn, gender,
	                        email, phone);
	      
		System.out.println("gender : " + gender); 
		// 회원 가입 실행
		MemberService ms = new MemberService();
			
		try {
			ms.insertMember(m);
			
			System.out.println("회원 가입 성공!");
			
			request.setAttribute("memberName", memberName);
			request.setAttribute("memberId", memberId);
			request.getRequestDispatcher("views/member/joinSuccess.jsp").forward(request, response);
			
		} catch(MemberException e) {
		
			System.out.println("회원 가입 실패!");
			RequestDispatcher view
			   = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "회원 가입 실패");
			
			view.forward(request, response);
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
