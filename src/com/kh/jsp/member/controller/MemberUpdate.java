package com.kh.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/update.me")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String memberPwd = request.getParameter("memberPwd");		
	    String email = request.getParameter("email1") +"@" + request.getParameter("email2");
	    String phone = request.getParameter("phone1") + "-"
	              + request.getParameter("phone2") + "-"
	              + request.getParameter("phone3");
		
		
	    HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("[서블릿] 원본 정보 : " + m);
		
		
		m.setMemberPwd(memberPwd);
		m.setEmail(email);
		m.setPhone(phone);

		
		System.out.println("[서블릿] 변경 후 정보 :" + m);
		
		// 5. 회원 서비스 찾아가기
		MemberService ms = new MemberService();
		
		
		try {
			ms.updateMember(m);
	
			System.out.println("회원 정보 수정 완료!");
				
			response.sendRedirect("index.do");
						
		} catch(MemberException e) {
			
			request.setAttribute("error-msg", "회원 정보 수정 중 에러 발생!");
			request.setAttribute("exception", e);
			
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
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
