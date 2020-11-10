package com.kh.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
 * Servlet implementation class BoardSearch
 */
@WebServlet("/search.bo")
public class BoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearch() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String searchWord = request.getParameter("searchWord");
		String page = "";
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit = 5;
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BoardService bs = new BoardService();
		
		try {
			HashMap<String, Object> hmap = bs.searchBoard(currentPage, limit, category, searchWord);
			
			int listCount = (int)hmap.get("listCount");
			ArrayList<Board> list = (ArrayList<Board>)hmap.get("list");
			
			maxPage = (int)Math.ceil((double)listCount/limit);
			startPage = ((currentPage - 1)/limit) * limit + 1;
			endPage = startPage + limit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, category, searchWord);
			
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
