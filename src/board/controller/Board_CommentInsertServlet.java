package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.Board_QuestionService;
import board.model.vo.Board_QuestionComment;

/**
 * Servlet implementation class Board_CommentInsertServlet
 */
@WebServlet("/board/qboardCommentInsert")
public class Board_CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board_CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int qboardref = Integer.parseInt(request.getParameter("qboardRef")); 
		String qboardCommentWriter = request.getParameter("qboardCommentWriter"); 
		String qboardCommentContent =  request.getParameter("qboardCommentContent"); 
		int qboardCommentLevel = Integer.parseInt(request.getParameter("qboardCommentLevel")); 
		int qboardCommentRef = Integer.parseInt(request.getParameter("qboardCommentRef")); 
		
		Board_QuestionComment bc = new Board_QuestionComment(0, qboardCommentLevel, qboardCommentWriter, qboardCommentContent, qboardref, qboardCommentRef, null); 

		System.out.println("bcbcbccommentIIIInsert@servlet="+bc);
		
		int result = new Board_QuestionService().insertQBoardComment(bc); 
		
		String view = "/WEB-INF/views/common/msg.jsp"; 
		String msg=""; 
		String loc = "/board/qboardView?qboardNo="+qboardref;
		
		if(result >0 ) {
			msg = "댓글 등록 성공!";
		}
		else {
			msg = "댓글 등록 실패!";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
