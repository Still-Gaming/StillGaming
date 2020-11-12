package com.kh.jsp.gamereview.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.gamereview.model.service.GameReviewService;
import com.kh.jsp.gamereview.model.vo.GameReview;

/**
 * Servlet implementation class ReviewInsert
 */
@WebServlet("/reviewInsert.do")
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		int gminfoNum = Integer.parseInt(request.getParameter("gminfoNum"));
		String comtCont = request.getParameter("comtCont");
		int refCno = Integer.parseInt(request.getParameter("refCno"));
		int comtLevel = Integer.parseInt(request.getParameter("comtLevel"));
		
		
		GameReview review = new GameReview(comtCont, memberId, gminfoNum, refCno, comtLevel);
	
		int result = new GameReviewService().insertReview(review);
		
		if( result > 0 ) {
			response.sendRedirect("selectone.do?gminfoNum="+ gminfoNum);
		} else {
			
			request.setAttribute("error-msg", "게시글 조회 실패");
			
			
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
