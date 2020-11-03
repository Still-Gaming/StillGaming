package com.kh.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.MyRenamePolicy;
import com.kh.jsp.common.exception.BoardException;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsert
 */
@WebServlet("/insert.bo")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsert() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024 * 1024 * 10;
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("error-msg", "multipart로 전송되지 않았습니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + "resources/boardUploadFiles";
		
		MultipartRequest mre = new MultipartRequest(request, savePath,
				maxSize, "UTF-8", new MyRenamePolicy());
		
		String memberId = mre.getParameter("memberId");
		int boardType = Integer.parseInt(mre.getParameter("boardType"));
		String boardTitle = mre.getParameter("boardTitle");
		String boardText = mre.getParameter("boardText");
		
		Board b = new Board(memberId, boardType, boardTitle, boardText);
		
		BoardService bs = new BoardService();
		
		try {
			bs.insertBoard(b);
			
			response.sendRedirect("selectList.bo");
			
		} catch (BoardException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "게시글 작성 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
