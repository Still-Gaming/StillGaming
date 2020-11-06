package com.kh.jsp.gameinfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.gameinfo.model.service.GameInfoService;
import com.kh.jsp.gameinfo.model.vo.GameInfo;
import com.kh.jsp.gameinfo.model.vo.PageInfo;



/**
 * Servlet implementation class GameList
 */
@WebServlet("/gamelist.do")
public class GameInfoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameInfoList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				ArrayList<GameInfo> list = new ArrayList<>();
				GameInfoService bs = new GameInfoService();
			
				int startPage;
			
				int endPage;
			
				int maxPage;
			
				int currentPage;
			
				int limit = 10;
				
			
				currentPage = 1;
				
				
				if(request.getParameter("currentPage") != null) {
					currentPage
					  = Integer.parseInt(request.getParameter("currentPage")); 
				}
				
			
				int listCount = bs.getListCount();

				maxPage = (int)((double)listCount/limit + 0.9);
		
				startPage = (int)(((double)currentPage/limit + 0.9) - 1) * limit + 1;
				
				endPage = startPage + limit - 1;
			
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				list = bs.selectList(currentPage, limit);
				
				String page = "";
				
				if( list != null && list.size() > 0) {
					PageInfo pi = new PageInfo(currentPage, listCount, limit, 
							                   maxPage, startPage, endPage);
					
					request.setAttribute("pi", pi);
					request.setAttribute("list", list);
					
					page = "views/shop/shop.jsp";
				} else {
					request.setAttribute("error-msg", "게시글 조회 실패");
					page = "views/common/errorPage.jsp";
				}
				
					request.getRequestDispatcher(page).forward(request, response);
				
				
	}
		
			
			
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
