package sns.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;
import sns.model.vo.CommentSNS;

/**
 * Servlet implementation class AjaxSnsCommentUpdateServlet
 */
@WebServlet("/gson/sns/updateComment.do")
public class AjaxSnsCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0.encoding
				response.setContentType("application/json; charset=utf-8");
					
				//1.parameter handling
				int commentNo = Integer.parseInt(request.getParameter("commentNo"));
				String commentNickname = request.getParameter("commentNickname");
				String commentProfile= request.getParameter("commentProfile");
				String commentContent= request.getParameter("commentContent");
				
				CommentSNS commentSNS = null;
				//2.business logic
				int result = new SNSService().updateCommentSNS(commentNo, commentNickname, commentProfile, commentContent);
				
				commentSNS =  new SNSService().selectCommentSNS(commentNo);	
	
				//view단 작성
				response.setContentType("application/json; charset=utf-8");
				new Gson().toJson(commentSNS, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
