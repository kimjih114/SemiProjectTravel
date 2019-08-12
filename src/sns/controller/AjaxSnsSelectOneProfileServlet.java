package sns.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import sns.model.service.SNSService;
import sns.model.vo.ProfileSNS;
import user.model.vo.User;

/**
 * Servlet implementation class AjaxSnsSelectOneServlet
 */
@WebServlet("/gson/sns/selectOneProfile.do")
public class AjaxSnsSelectOneProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsSelectOneProfileServlet() {
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
		HttpSession session =  request.getSession(false);
		String userId= ((User)session.getAttribute("userLoggedIn")).getUserId();
				
		//2.business logic
		ProfileSNS profileSNS = new SNSService().selectOneProfile(userId);
				
		//view단 작성
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(profileSNS, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
