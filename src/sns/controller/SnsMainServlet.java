package sns.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sns.model.service.SNSService;
import sns.model.vo.ProfileSNS;
import user.model.vo.User;

/**
 * Servlet implementation class StoryMainServlet
 */
@WebServlet("/story/storyMain")
public class SnsMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SnsMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("mypage");
		ProfileSNS profileSNS = new SNSService().selectOneProfile(userId);
		
		//1.business logic
		//총페이지 = 올림(총게시물/numPerPage)
		int totalContents = new SNSService().selectBoardSNSCnt(userId);
		final int numPerPage = 5;
		int totalPage = (int)Math.ceil(totalContents*1.0/numPerPage);
		System.out.println("totalPage="+totalPage);
				
		//2.view단 처리
		request.setAttribute("totalPage", totalPage);
		
		if(profileSNS!=null) {
			request.setAttribute("profileSNS", profileSNS);
			request.getRequestDispatcher("/WEB-INF/views/story/storyMain.jsp").forward(request, response);
		}
		else if(profileSNS==null){
			request.setAttribute("msg", "해당하는 페이지가 없습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
