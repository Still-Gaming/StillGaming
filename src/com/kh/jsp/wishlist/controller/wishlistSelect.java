package com.kh.jsp.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.wishlist.model.service.WishlistService;
import com.kh.jsp.wishlist.model.vo.Wishlist;

/**
 * Servlet implementation class wishlistSelect
 */
@WebServlet("/select.wi")
public class wishlistSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishlistSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Wishlist> list = new ArrayList<>();
		
		list = new WishlistService().selectList();
		
		String page ="";
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "/StillGaming/views/mypage/myWishList.jsp";
		} else {
			request.setAttribute("error-msg", "사진 게시글 목록 조회 실패");
			page = "/StillGaming/views/common/errorPage.jsp";
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
