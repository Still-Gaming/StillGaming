package com.kh.jsp.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.jsp.common.exception.QnaException;


import com.kh.jsp.qna.model.service.QnaService;
import com.kh.jsp.qna.model.vo.Qna;

/**
 * Servlet implementation class NoticeSelectList
 */
@WebServlet("/adminselectlist.do")
public class AdminSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항 여러 개 조회를 위한 배열(ArrayList)
		// 목록 형태로 (ArrayList) 데이터를 전달하는 서블릿
		ArrayList<Qna> list = new ArrayList<>();
		
		QnaService qs = new QnaService();
		
		String page = null; // 이동할 페이지 정보
		
		try {
			list = qs.selectList();
			
			request.setAttribute("list", list);
			
			page = "views/Q&A/admin_qnaList.jsp";
			
		} catch (QnaException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "공지사항 조회 실패!");
			
			page = "views/common/errorPage.jsp";
			
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
