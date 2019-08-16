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
 * Servlet implementation class AjaxBoardFollowWithListServlet
 */
@WebServlet("/gson/sns/followerWithList.do")
public class AjaxSnsFollowWithListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsFollowWithListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		//1.parameter handling
		String mypage = request.getParameter("mypage");
		String userLoggedIn = request.getParameter("userLoggedIn");
		
		//2.business logic
		List<String> followMyList = new SNSService().selectOneIdFollow(mypage);
		
		List<String> followerMyList = new SNSService().selectOneIdFollower(mypage, followMyList);
		
		List<String> followLoggedInList = new SNSService().selectOneIdFollow(userLoggedIn);
		
		List<String> followerLoggedInList = new SNSService().selectOneIdFollower(userLoggedIn, followLoggedInList);
		
		List<String> followerWithList = new ArrayList<>();
		
		if(followerMyList!=null && followerLoggedInList!=null) {
			for(String my : followerMyList) {
				for(String loggedIn : followerLoggedInList) {
					if(my.equals(loggedIn)) {
						followerWithList.add(my);
					}
				}
			
			}
		}
		
		List<ProfileSNS> followerWithProfileList = new SNSService().selectOneProfileFollow(followerWithList);

		//view단 작성
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(followerWithProfileList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
