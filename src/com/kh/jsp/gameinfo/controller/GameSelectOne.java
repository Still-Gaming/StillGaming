package com.kh.jsp.gameinfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.jsp.boardComment.model.service.BoardCommentService;
import com.kh.jsp.boardComment.model.vo.BoardComment;
import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.service.GameInfoService;
import com.kh.jsp.gameinfo.model.vo.GameImage;
import com.kh.jsp.gameinfo.model.vo.GameInfo;


/**
 * Servlet implementation class GameSelectOne
 */
@WebServlet("/selectone.do")
public class GameSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameSelectOne() {
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
			GameImage gie = bs.selectGameImage(gminfoNum);
		
			request.setAttribute("GameInfo", gi);
			request.setAttribute("GameImage", gie);
			
			
			
			page = "views/shop/gameDetail.jsp";
			
			
			} catch(GameInfoException g) {
			
			request.setAttribute("exception", g);
			request.setAttribute("error-msg", "게시글 조회 실패");
			
			page = "/views/common/errorPage.jsp";
		
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
