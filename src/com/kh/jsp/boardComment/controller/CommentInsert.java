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
@WebServlet("/insert.do")
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
		
		int commentNo = Integer.parseInt(request.getParameter("commnetNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String memberId = request.getParameter("memberId");
		String commentText = request.getParameter("commentText");
		
		BoardComment comment = new BoardComment(commentNo, boardNo, memberId, commentText);
		
		int result = new BoardCommentService().insertComment(comment);
		
		if( result > 0 ) {
			response.sendRedirect("selectOne.bo?bno="+ boardNo);
		} else {
			// 에러 페이지 작성 . . . 생략
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
