package sns.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;

/**
 * Servlet implementation class AjaxSnsAddFollowServlet
 */
@WebServlet("/gson/sns/follow.do")
public class AjaxSnsFollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsFollowServlet() {
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
		String userFollowing = request.getParameter("userFollowing");
		String userFollowed= request.getParameter("userFollowed");
		
		System.out.println("following@servlet="+userFollowing);
		System.out.println("followed@servlet="+userFollowed);
								
		//2.business logic
		int result = new SNSService().follow(userFollowing, userFollowed);
								
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
