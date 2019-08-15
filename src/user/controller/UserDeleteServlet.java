package user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/user/userDelete")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userLoggedIn");
		System.out.println("user@deleteServlet"+user);
		String userId = user.getUserId();
		
		System.out.println("userId"+userId);
		String renamedFileName = request.getParameter("fileName");

		User u = new UserService().selectOne(userId);
		
		int result = new UserService().deleteUser(userId);
	
		if(result>0 && !"".equals(renamedFileName)) {
			String saveDirectory
				=getServletContext().getRealPath("/upload/enroll");
			File delFile 
			= new File(saveDirectory+File.separator+renamedFileName);
		System.out.println("delFile="+delFile);
		
		String delDirectory
		= getServletContext().getRealPath("/upload/delete");
		File renamedFile
		= new File(delDirectory+File.separator+renamedFileName);
		boolean bool = delFile.renameTo(renamedFile);
		System.out.println("삭제(파일이동)여부: "+bool);
		}
		
		String view ="/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		if(result>0)
			msg = "회원 탈퇴되었습니다.";
		else
			msg = "회원 탈퇴에 실패했습니다.";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
