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
 * Servlet implementation class MemberList
 */
@WebServlet("/MemberList.me")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항 여러 개 조회를 위한 배열(ArrayList)
		ArrayList<Member> list = new ArrayList<>();
		
		MemberService ms = new MemberService();
		
		String page = null; // 이동할 페이지 정보
		
		try {
			list = ms.selectList();
			
			request.setAttribute("list", list);
			
			page = "views/manage/member_manage.jsp";
			
		} catch (MemberException e) {
			// TODO Auto-generated catch block
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
