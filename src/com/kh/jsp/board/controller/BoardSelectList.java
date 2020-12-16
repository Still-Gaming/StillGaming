package com.kh.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.board.model.vo.PageInfo;
import com.kh.jsp.common.exception.BoardException;

/**
 * Servlet implementation class BoardSelectList
 */
@WebServlet("/selectList.bo")
public class BoardSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Board> list = new ArrayList<>();
		BoardService bs = new BoardService();
		
		String page = "";
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit = 10;
	      
	      currentPage = 1;
	      
	      if(request.getParameter("currentPage") != null) {
	         currentPage = Integer.parseInt(request.getParameter("currentPage"));
	      }
	      
	      int listCount = 0;
	      
	      try {
	         listCount = bs.getListCount();
	      } catch (BoardException e) {
	         
	         request.setAttribute("exception", e);
	         request.setAttribute("error-msg", "게시글 개수 조회 실패");
	         
	         page = "/views/common/errorPage.jsp";
	      }
	      maxPage = (int)Math.ceil((double)listCount/limit);
	      
	      startPage = (((currentPage - 1)/5) * 5) + 1;
	      
	      endPage = startPage + 4;
	      
	      if(endPage > maxPage) {
	         endPage = maxPage;
	      }
	      
		try {
			list = bs.selectList(currentPage, limit);
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			page = "views/board/boardList.jsp";
			
		} catch (BoardException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "게시글 조회 실패");
			
			page = "/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
