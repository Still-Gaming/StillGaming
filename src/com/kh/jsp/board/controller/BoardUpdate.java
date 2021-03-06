package com.kh.jsp.board.controller;

import java.io.IOException;
import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.board.model.vo.BoardFile;
import com.kh.jsp.common.MyRenamePolicy;
import com.kh.jsp.common.exception.BoardException;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/update.bo")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdate() {
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
		String filePath = root + "resources/boardUploadFiles";
		
		MultipartRequest mre = new MultipartRequest(request, filePath,
				maxSize, "UTF-8", new MyRenamePolicy());
		
		int boardNo = Integer.parseInt(mre.getParameter("boardNo"));
		
		String fileName = mre.getOriginalFileName("file");
		String fileChangeName = mre.getFilesystemName("file");
		
		BoardService bs = new BoardService();
		
		try {
			Board b = bs.selectBoard(boardNo);
			
			BoardFile bf = null;
			
			if(fileName != null) {
				bf = bs.selectBoardFile(boardNo);
				
				bf.setFileName(fileName);
				bf.setFileChangeName(fileChangeName);
			}
			
			int result = bs.updateBoard(b, bf, filePath);
			
			response.sendRedirect("selectOne.bo?boardNo=" + boardNo);
			
		} catch (BoardException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "게시글 수정 실패");
			
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
