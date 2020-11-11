package com.kh.jsp.gameinfo.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import com.kh.jsp.common.MyRenamePolicy;

import com.kh.jsp.common.exception.GameInfoException;
import com.kh.jsp.gameinfo.model.service.GameInfoService;
import com.kh.jsp.gameinfo.model.vo.GameImage;
import com.kh.jsp.gameinfo.model.vo.GameInfo;
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
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("exception", new Exception("사진 게시글 등록 오류"));
			request.setAttribute("error-msg", "multipart로 전송되지 않았습니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		String root = request.getServletContext().getRealPath("/resources");
		String filePath = root + "/gameimageUploadFiles/";
		
		MultipartRequest mre = new MultipartRequest(
                request, filePath, maxSize, "UTF-8",
                new MyRenamePolicy() );
		
		
		String gminfoName = mre.getParameter("gminfoName");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date gminfoDate = null;
		try {
			gminfoDate = new Date(sdf.parse(mre.getParameter("gminfoDate")).getTime());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String gminfoCompany = mre.getParameter("gminfoCompany");
		String gminfoExp = mre.getParameter("gminfoExp");
		int gmTypeNum = Integer.parseInt(mre.getParameter("gmTypeNum"));
		int gminfoAge = Integer.parseInt(mre.getParameter("gminfoAge"));
		int gminfoPrice = Integer.parseInt(mre.getParameter("gminfoPrice"));
		
		String fileName = mre.getOriginalFileName("gameImg1");
		String fileChangeName = mre.getFilesystemName("gameImg1");
		
		GameInfo b = new GameInfo(gminfoName, gminfoDate, gminfoCompany, gminfoExp, gmTypeNum, gminfoAge, gminfoPrice);
		
		GameImage bf = null; 
		
		if(fileName != null) bf = new GameImage(fileName, fileChangeName, filePath);
		
		GameInfoService bs = new GameInfoService();
		
		try {
			bs.insertGameInfo(b, bf);
			
			response.sendRedirect("gamelist.do");
			
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
