package sns.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;
import sns.model.vo.ProfileSNS;

/**
 * Servlet implementation class AjaxSnsFollowedOneListServlet
 */
@WebServlet("/gson/sns/followedOneList.do")
public class AjaxSnsFollowedOneListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsFollowedOneListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		String userLoggedIn = request.getParameter("userLoggedIn");
		
		//2.business logic
		List<String> followedOneList = new SNSService().selectOneIdFollowed(userLoggedIn);
		List<String> followOneList = new SNSService().selectOneIdFollow(userLoggedIn);
		List<String> followerOneList = new SNSService().selectOneIdFollower(userLoggedIn, followOneList);
		
		if(followedOneList!=null && followerOneList!=null) {
			for(String er : followerOneList) {
				System.out.println(er);
				if(followedOneList.contains(er)) {
					followedOneList.remove(followedOneList.indexOf(er));
				}
			}
		}
		List<ProfileSNS> followedProfileList = new SNSService().selectOneProfileFollow(followedOneList);
	
		//view단 작성
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(followedProfileList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
