package com.kh.jsp.gamereview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.boardComment.model.service.BoardCommentService;
import com.kh.jsp.gamereview.model.service.GameReviewService;

/**
 * Servlet implementation class ReviewDelete
 */
@WebServlet("/reviewDelete.do")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comtNum = Integer.parseInt(request.getParameter("comtNum"));
		int gminfoNum = Integer.parseInt(request.getParameter("gminfoNum"));
		
		int result = new GameReviewService().deleteReview(comtNum);
		
		
		if (result > 0) {
			response.sendRedirect("selectone.do?gminfoNum=" + gminfoNum);
		} else {
			request.setAttribute("error-msg", "댓글 삭제 실패!");
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
