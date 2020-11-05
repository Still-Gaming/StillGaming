package com.kh.jsp.gameinfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class GameInfoInsert
 */
@WebServlet("/gameinsert.do")
public class GameInfoInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameInfoInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				int maxSize = 1024 * 1024 * 10; 
			
				if(! ServletFileUpload.isMultipartContent(request)) {
					
					
					request.setAttribute("error-msg", "multipart로 전송되지 않았습니다.");
					
					request.getRequestDispatcher("views/common/errorPage.jsp")
					       .forward(request, response);
				}
				
			
				String root = request.getServletContext().getRealPath("/");
				String savePath = root + "resources/gameimage";
				
				
				MultipartRequest mre = new MultipartRequest(request, savePath,
						                                    maxSize, "UTF-8",
						                                    new DefaultFileRenamePolicy());
				
				String gminfoName = mre.getParameter("gminfoName");
				String content = mre.getParameter("");
				String userId = mre.getParameter("userId");
				
				// 5-2. 파일 저장 및 정보 처리하기
				//     JSP로부터 전달받은 파일을 먼저 저장하고
				//     해당 파일의 이름을 따온다.
				
				String filename = mre.getFilesystemName("file");
				
				// 6. 전달받은 값을 서비스로 넘기기
				Board b = new Board(title, content, userId, filename);
				
				int result = new BoardService().insertBoard(b);
				
				if (result > 0) {
					response.sendRedirect("selectList.bo");
				} else {
					request.setAttribute("error-msg", "게시글 작성 실패!");
					
					request.getRequestDispatcher("views/common/errorPage.jsp")
					       .forward(request, response);
				
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
