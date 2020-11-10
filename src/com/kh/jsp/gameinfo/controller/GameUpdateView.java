package com.kh.jsp.gameinfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.service.GameInfoService;
import com.kh.jsp.gameinfo.model.vo.GameInfo;

/**
 * Servlet implementation class GameUpdateView
 */
@WebServlet("/updateView.do")
public class GameUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameUpdateView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gminfoNum = Integer.parseInt(request.getParameter("gminfoNum"));
	
		GameInfoService bs = new GameInfoService();
	
		String page = "";
		
		try {
			GameInfo gi = bs.selectGameInfo(gminfoNum);
			
			request.setAttribute("gameInfo", gi);
			
			page = "views/shop/gameUpdate.jsp";
					
		} catch (GameInfoException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "게시글 수정 페이지 상세 조회 실패");
			
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
