package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserUpdatePasswordEndServlet
 */
@WebServlet("/user/updatePasswordEnd")
public class UserUpdatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdatePasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String password_new = request.getParameter("password_new");
		
		System.out.println("userId"+userId+"password"+password+"password_new"+password_new);
		
		User user = new User();
		user.setUserId(userId);
		user.setUserPassword(password);
		
		int result = UserService.loginCheck(user);
		
		String msg = "";
		String loc = "";
		String view = "/WEB-INF/views/common/msg.jsp";
		if(result==UserService.LOGIN_OK) {
			user.setUserPassword(password_new);
			result = userService.updateUser(user);
			if(result>0) {
				msg = "패스워드 변경 성공";
				String script = "self.close()";
				request.setAttribute("script", script);
			}
		}else {
			msg = "올바르지 않은 패스워드입니다.";
			loc = "/user/updatePassword?userId="+userId;
		}
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
