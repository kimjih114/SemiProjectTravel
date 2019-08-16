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

/**
 * Servlet implementation class AjaxSnsFollowerOneListServlet
 */
@WebServlet("/gson/sns/followerOneList.do")
public class AjaxSnsFollowerOneListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsFollowerOneListServlet() {
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
		
		//2.business logic
		List<String> followOneList = new SNSService().selectOneIdFollow(mypage);
		
		List<String> followerOneList = new SNSService().selectOneIdFollower(mypage, followOneList);
		
		List<ProfileSNS> followerProfileList = new SNSService().selectOneProfileFollow(followerOneList);
	
		//view단 작성
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(followerProfileList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
