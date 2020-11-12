package com.kh.jsp.gameinfo.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.service.GameInfoService;
import com.kh.jsp.gameinfo.model.vo.GameInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class GameDelete
 */
@WebServlet("/delete.do")
public class GameDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gminfoNum = Integer.parseInt(request.getParameter("gminfoNum"));
			
				GameInfoService bs = new GameInfoService();
				
				String root = request.getServletContext().getRealPath("/resources");
				String filePath = root + "/gameimageUploadFiles/";
				
				try {
				
					int result = bs.deleteGameInfo(gminfoNum, filePath);
					
					if( result > 0 ) {
						response.sendRedirect("gamelist.do");
					}
				
				} catch (GameInfoException g) {
					
					request.setAttribute("exception", g);
					request.setAttribute("error-msg", "게시글 작성 실패");
					
					
					 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
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
