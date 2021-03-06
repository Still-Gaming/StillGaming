package com.kh.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.exception.BoardException;

/**
 * Servlet implementation class BoardUpdateView
 */
@WebServlet("/updateView.bo")
public class BoardUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateView() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardService bs = new BoardService();
		
		String page = "";
		
		try {
			Board b = bs.selectBoard(boardNo);
			
			request.setAttribute("board", b);
			
			page = "views/board/boardUpdate.jsp";
			
		} catch (BoardException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "게시글 수정 페이지 상세 조회 실패");
			
			page = "views/common/errorPage.jsp";
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
