package com.kh.jsp.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.board.model.vo.BoardFile;
import com.kh.jsp.boardComment.model.serivce.BoardCommentService;
import com.kh.jsp.boardComment.model.vo.BoardComment;
import com.kh.jsp.common.exception.BoardException;
import com.kh.jsp.qna.model.service.QnaService;

/**
 * Servlet implementation class BoardSelectOne
 */
@WebServlet("/adminselectone.do")
public class AdminSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelectOne() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		QnaService qs = new QnaService();
		ArrayList<QnaComment> qlist = new QnaCommentService().selectList(qNo);
		
		String page = "";
		
		try {
			QNA q = qs.selectOne(qNo);
			BoardFile bf = qs.selectBoardFile(qNo);
			
			bs.plusCount(boardNo);
			b.setBoardCount(b.getBoardCount() + 1);
			
			request.setAttribute("board", b);
			request.setAttribute("boardFile", bf);
			request.setAttribute("clist", clist);
			
			
			page = "views/board/boardDetail.jsp";
			
		} catch (BoardException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "게시글 상세 조회 실패");
			
			page = "views/common/errorPage.jsp";
			
		} finally {
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
