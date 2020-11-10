package com.kh.jsp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.MyPageException;
import com.kh.jsp.mypage.model.service.MyPageService;

/**
 * Servlet implementation class CartDelete
 */
@WebServlet("/chkDelete.my")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String[] CartGameNum = request.getParameter("gno").split(",");
		MyPageService mps = new MyPageService();
		
		int cnt = 0;
		
		if(CartGameNum.length > 0) {
			for(int i = 0; i < CartGameNum.length; i++) {
				System.out.println(Integer.parseInt(CartGameNum[i]));
				try {
					mps.deleteCart(Integer.parseInt(CartGameNum[i]));
					
					cnt++;
					
					if(cnt == CartGameNum.length) {
						response.sendRedirect("cart.my?memberId=" + memberId);
					}
				} catch (NumberFormatException | MyPageException e) {
					request.setAttribute("exception", e);
					request.setAttribute("error-msg", "게시글 삭제 실패");
					
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
					break;
				}
			}
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
