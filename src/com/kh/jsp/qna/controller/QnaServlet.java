package com.kh.jsp.qna.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.jsp.qna.model.service.QnaService;
import com.kh.jsp.qna.model.vo.Qna;



/**
 * Servlet implementation class QnaServlet
 */
@WebServlet("/Servlet.do")
public class QnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	
		String qnaNo = request.getParameter("qnaNo");
		String memberId =request.getParameter("memberId");
		String qnaCode = request.getParameter("qnaCode");
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		String qnaDate = request.getParameter("qnaDate");
		String qnaAnswer = request.getParameter("qnaAnswer");
		
		
		
		Qna insertQna = new Qna(qnaNo, memberId, qnaCode, qnaTitle,
											qnaContent, qnaDate,qnaAnswer);
		
		System.out.println("Q&A 정보 : " + insertQna);
		
		
		
				QnaService qs = new QnaService();
				
				int result = qs.insertQna(insertQna);
				
				
				
				if( result > 0 ) {
					
					System.out.println("서블릿 : 입력 완료!");
					
					response.sendRedirect("index.jsp");
				} else {
					System.out.println("서블릿 : 실패!");
					
					
					RequestDispatcher view 
					      = request.getRequestDispatcher("views/common/errorPage.jsp");
					
					request.setAttribute("error-msg", " 실패!");
					
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
