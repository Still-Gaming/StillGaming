package com.kh.jsp.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.qna.model.service.QnaService;
import com.kh.jsp.qna.model.vo.Qna;

/**
 * Servlet implementation class InsertQnAServlet
 */
@WebServlet("/qna.do")
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
		
		
		String qTitle = request.getParameter("title");
		String qContent = request.getParameter("content");
		
		Qna q = new Qna(qTitle, qContent);
		QnaService qs= new QnaService();
		
		int result =  qs.insertQna(q);
		
		if(result > 0) {
			System.out.println("Q&A 제출 성공!");
			response.sendRedirect("index.jsp");
		} else { 
			System.out.println("Q&A 제출 실패!");
			request.setAttribute("error-msg", "게시글 작성 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp")
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
