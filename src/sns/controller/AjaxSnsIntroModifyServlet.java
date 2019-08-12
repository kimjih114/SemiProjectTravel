package sns.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;
import sns.model.vo.ProfileSNS;

/**
 * Servlet implementation class AjaxSnsIntroModifyServlet
 */
@WebServlet("/gson/sns/introModify.do")
public class AjaxSnsIntroModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsIntroModifyServlet() {
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
		String intro = request.getParameter("intro").replace("<", "&lt;")
				   									.replace(">", "&gt;");;
		String userId= request.getParameter("userid");
								
		//2.business logic
		int result = new SNSService().updateIntro(userId, intro);
		
		//ProfileSNS profileSNS = new SNSService().selectOneProfile(userId);
								
		//view단 작성
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
