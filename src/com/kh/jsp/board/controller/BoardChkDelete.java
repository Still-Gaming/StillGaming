package com.kh.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.common.exception.BoardException;

/**
 * Servlet implementation class BoardChkDelete
 */
@WebServlet("/chkDelete.bo")
public class BoardChkDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardChkDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String[] boardNos = request.getParameter("bno").split(",");
		BoardService bs = new BoardService();
		
		int cnt = 0;
		
		if(boardNos.length > 0) {
			for(int i = 0; i < boardNos.length; i++) {
				System.out.println(Integer.parseInt(boardNos[i]));
				try {
					bs.deleteBoard(Integer.parseInt(boardNos[i]));
					
					cnt++;
					
					if(cnt == boardNos.length) {
						response.sendRedirect("post.my?memberId=" + memberId);
					}
				} catch (NumberFormatException | BoardException e) {
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
