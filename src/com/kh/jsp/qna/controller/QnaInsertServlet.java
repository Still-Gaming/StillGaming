package com.kh.jsp.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.common.exception.BoardException;
import com.kh.jsp.common.exception.QnaException;
import com.kh.jsp.qna.model.service.QnaService;
import com.kh.jsp.qna.model.vo.Qna;
import com.kh.jsp.qna.model.vo.QnaFile;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertQnAServlet
 */
@WebServlet("/qna.do")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int maxSize = 1024 * 1024 * 10;
		
		
		if( ! ServletFileUpload.isMultipartContent(request)) {
			//에러 페이지
			
			request.setAttribute("error-msg", "multipart로 전송되지 않았습니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp")
					 .forward(request, response);
		}
		String root = request.getServletContext().getRealPath("/");
		String filePath = root + "resources/qnaUploadFiles";
		
		MultipartRequest mre = new MultipartRequest(request, filePath,
																	maxSize, "UTF-8",
																	new DefaultFileRenamePolicy());
		
		String memberId = mre.getParameter("memberId");
		int qcode = Integer.parseInt(mre.getParameter("qcode"));
		String qtitle = mre.getParameter("qtitle");
		String qcontent = mre.getParameter("qcontent");
		
		String fileName = mre.getOriginalFileName("file");
		String fileChangeName = mre.getFilesystemName("file");
		
		Qna q = new Qna(memberId, qcode, qtitle, qcontent);
	
		QnaFile qf = null;
		
		
		if(fileName != null) qf = new QnaFile(fileName, fileChangeName, filePath);
		
		QnaService qs= new QnaService();
		
		try {
			qs.insertQna(q, qf);
			
			
		} catch (QnaException e) {
			
			request.setAttribute("exception", e);
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
