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
import sns.model.vo.ProfileSNS;
import user.model.vo.User;

/**
 * Servlet implementation class AjaxSnsFollowOneListServlet
 */
@WebServlet("/gson/sns/followOneList.do")
public class AjaxSnsFollowOneListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsFollowOneListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		//1.parameter handling
		String userFollowing = request.getParameter("mypage");
		System.out.println("userFollowing@serlvet="+userFollowing);
		
		//2.business logic
		List<String> followOneList = new SNSService().selectOneIdFollow(userFollowing);
		System.out.println("followOneList@servlet="+followOneList);
		List<ProfileSNS> followProfileList = new SNSService().selectOneProfileFollow(followOneList);
		System.out.println("followProfileList@servlet="+followProfileList);
						
		//view단 작성
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(followProfileList, response.getWriter());
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
