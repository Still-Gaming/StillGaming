package com.kh.jsp.boardComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.boardComment.model.serivce.BoardCommentService;
import com.kh.jsp.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class CommentInert
 */
@WebServlet("/insert.co")
public class CommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String MemberId = request.getParameter("memberId");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String commentText = request.getParameter("commentText");
		int refcno = Integer.parseInt(request.getParameter("refcno"));
		int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
		
		
		BoardComment comment = new BoardComment(boardNo, commentText, MemberId, refcno, commentLevel);
		
		int result = new BoardCommentService().insertComment(comment);
		
		if( result > 0 ) {
			response.sendRedirect("selectOne.bo?boardNo="+ boardNo);
		} else {
			
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
