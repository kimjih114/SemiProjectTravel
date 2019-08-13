package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.Board_QuestionService;

/**
 * Servlet implementation class Board_QuestionDeleteServlet
 */
@WebServlet("/board/qboardDelete")
public class Board_QuestionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board_QuestionDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int qboardNo = Integer.parseInt(request.getParameter("qboardNo")); 
		
		String newFileName= request.getParameter("newFileName");
		int result = new Board_QuestionService().deleteQBoard(qboardNo);
		
		if(result >0 && !"".equals(newFileName)) {
			String saveDirectory = getServletContext().getRealPath("/upload/board"); 
			File delFile = new File(saveDirectory+File.separator+newFileName);
			
			System.out.println("delFile="+ delFile);
			
			String delDirectory =getServletContext().getRealPath("deleteFiles/board"); 
			File newFile = new File(delDirectory+File.separator+newFileName);
			boolean bool = delFile.renameTo(newFile);
			System.out.println("삭제(파일이동)여부:"+bool);
			
			
		}
		
		String view = "/WEB-INF/views/common/msg.jsp"; 
		String msg ="";
		String loc = "/ajax/board_questionView"; 
		
		if(result>0) {
			msg="게시글 삭제 성공"; 
		}
		else {
			msg="게시글 삭제 실패"; 
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(view); 
		requestDispatcher.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
