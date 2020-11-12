package com.kh.jsp.common;

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

/**
 * Servlet implementation class Index
 */
@WebServlet("/index.do")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GameInfoService gis = new GameInfoService();
		
		String page = "";
		
		try {
			ArrayList<GameImage> list = gis.indexList();
			
			request.setAttribute("list", list);
			
			page = "index.jsp";
			
		} catch (GameInfoException e) {
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "최신 게임 조회 실패");
			
			page = "views/common/errorPage.jsp";
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
