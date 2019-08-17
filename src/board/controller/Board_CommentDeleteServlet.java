package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.Board_QuestionService;

/**
 * Servlet implementation class Board_CommentDeleteServlet
 */
@WebServlet("/board/qboardCommentDelete")
public class Board_CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board_CommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qboardNo = Integer.parseInt(request.getParameter("qboardNo")); 
		int qboardCommentNo = Integer.parseInt(request.getParameter("del"));
		
		int result =  new Board_QuestionService().deleteBoardComment(qboardCommentNo); 
		
	
		String view = "/WEB-INF/views/common/msg.jsp"; 
		String msg = ""; 
		String loc = "/board/qboardView?qboardNo="+qboardNo;
		
		if(result>0) 
			
			msg = "댓글 삭제 성공!";
		
			
		else 
			msg = "댓글 삭제 실패!";	
			
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
