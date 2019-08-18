package sns.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;
import sns.model.vo.CommentSNS;

/**
 * Servlet implementation class AjaxSnsCommentInsertServlet
 */
@WebServlet("/gson/sns/insertComment.do")
public class AjaxSnsCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsCommentInsertServlet() {
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
			int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
			String commentWriter = request.getParameter("commentWriter");
			String commentNickname = request.getParameter("commentNickname");
			String commentProfile = request.getParameter("commentProfile");
			
			int commentRef = 0;
			if(request.getParameter("commentRef")!=null) {
				commentRef = Integer.parseInt(request.getParameter("commentRef"));
			}
			String commentContent= request.getParameter("commentContent").replace("<", "&lt;").replace(">", "&gt;");
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			
			CommentSNS commentSNS = new CommentSNS();
			
			commentSNS.setCommentLevel(commentLevel);
			commentSNS.setCommentWriter(commentWriter);
			commentSNS.setCommentNickname(commentNickname);
			commentSNS.setCommentProfile(commentProfile);
			commentSNS.setCommentContent(commentContent);
			commentSNS.setBoardNo(boardNo);
			commentSNS.setCommentRef(commentRef);
			
			System.out.println(commentSNS);
			
			//2.business logic
			int commentNo = new SNSService().insertCommentSNS(commentSNS);
			
			CommentSNS commentSNSOne= new SNSService().selectCommentSNS(commentNo);
											
			//view단 작성
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(commentSNSOne, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
