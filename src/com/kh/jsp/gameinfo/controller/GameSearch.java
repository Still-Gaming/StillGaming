package com.kh.jsp.gameinfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.service.GameInfoService;
import com.kh.jsp.gameinfo.model.vo.GameImage;
import com.kh.jsp.gameinfo.model.vo.GameInfo;
import com.kh.jsp.gameinfo.model.vo.PageInfo;


/**
 * Servlet implementation class GameSearch
 */
@WebServlet("/searchGame.no")
public class GameSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("con");
		
		String keyword = request.getParameter("keyword");
		
		ArrayList<GameImage> list = new ArrayList<>();
		
		GameInfoService gi = new GameInfoService();
		
		String page = null;
		
		
		try {
			list = gi.searchGame(condition, keyword);
			
			PageInfo pi = new PageInfo(1, 10, 10, 1, 1, 1);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			page = "views/shop/shop.jsp";
			
			
		} catch (GameInfoException e) {
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "검색 실패!");
			page = "views/common/errorPage.jsp";
			
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(page).forward(request, response);
			
			
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

