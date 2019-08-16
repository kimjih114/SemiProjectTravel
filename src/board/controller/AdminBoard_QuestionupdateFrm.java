package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.model.exception.BoardQuestionException;
import board.model.service.Board_QuestionService;
import board.model.vo.Board_Question;

/**
 * Servlet implementation class Board_QuestionupdateFrm
 */
@WebServlet("/board/adminboardUpdateForm")
public class AdminBoard_QuestionupdateFrm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoard_QuestionupdateFrm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qboardNo ; 
		 try {
			 qboardNo =Integer.parseInt(request.getParameter("qboardNo"));
			 
		 }catch(NumberFormatException e) {
			 throw new BoardQuestionException("유효하지 않은 게시글 요청입니다."); 
		 }
		
		 Board_Question bq = new Board_QuestionService().selectOne(qboardNo);
		
		 request.setAttribute("bq", bq);
		 request.getRequestDispatcher("/WEB-INF/views/a/adminboard_questionUpdateFrm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
