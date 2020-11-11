package com.kh.jsp.gamereview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.boardComment.model.service.BoardCommentService;
import com.kh.jsp.boardComment.model.vo.BoardComment;
import com.kh.jsp.gamereview.model.service.GameReviewService;
import com.kh.jsp.gamereview.model.vo.GameReview;

/**
 * Servlet implementation class ReviewUpdate
 */
@WebServlet("/reviewUpdate.do")
public class ReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comtNum = Integer.parseInt(request.getParameter("comtNum"));
		int gminfoNum = Integer.parseInt(request.getParameter("gminfoNum"));
		String comtCont = request.getParameter("comtCont");
		
		GameReview bco = new GameReview();
		bco.setComtNum(comtNum);
		bco.setComtCont(comtCont);
		
		int result = new GameReviewService().updateReview(bco);
		
		if( result > 0 ) {
			response.sendRedirect("selectone.do?gminfoNum="+ gminfoNum);
			System.out.println(result);
		} else {
			
			request.setAttribute("error-msg", "댓글 수정 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
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
