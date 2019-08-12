package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.Board_QuestionService;
import board.model.vo.Board_Question;
import board.model.vo.Board_QuestionComment;

/**
 * Servlet implementation class Board_QuestionViewServlet
 */
@WebServlet("/ajax/board_questionView.do")
public class Board_QuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board_QuestionViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qboardNo = Integer.parseInt(request.getParameter("qboardNo"));
		
		Cookie[] cookies  = request.getCookies(); 
		String qboardCookieVal=""; 
		boolean hasRead = false; 
		if(cookies != null) {
			for(Cookie c: cookies) {
				String name = c.getName(); 
				String value = c.getValue(); 
				if("qboardCookie".contentEquals(name)) {
					qboardCookieVal = value; 
					if(value.contains("|"+qboardNo+"|")) {
						hasRead = true; 
						break;
					}
				}
			}
			
			
		}
		
		if(!hasRead) {
			
			Cookie qboardCookie = new Cookie("qboardCookie", qboardCookieVal+"|"+qboardNo+"|"); 
			
			qboardCookie.setPath(request.getContextPath()+"/board");
			
			response.addCookie(qboardCookie);
		}
		System.out.println("viewservlet@qboardNo="+qboardNo);
		Board_Question qb = new Board_QuestionService().selectOne(qboardNo, hasRead); 
		 //List<Board_QuestionComment> commentList= new Board_QuestionService().selectCommentList(qboardNo);
 		
		request.setAttribute("qb", qb);
		//request.setAttribute("commentList", commentList);
		
		String view = "/ajax/board_questionView.jsp"; 
		
		if(qb == null) {
			
			request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
			request.setAttribute("loc", "/ajax/board_questionList.jsp");

			
			view="/WEB-INF/views/common/msg.jsp"; 
			
			
		}
		request.getRequestDispatcher("/ajax/board_questionView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}