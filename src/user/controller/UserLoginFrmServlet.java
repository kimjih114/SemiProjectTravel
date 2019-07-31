package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import user.vo.User;
import user.vo.service.UserService;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/user/userLoginFrm")
public class UserLoginFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//01.인코딩 
		request.setCharacterEncoding("utf-8");
		
		//1.파라미터 핸들링 
		String userId = request.getParameter("userId"); 
		String userPassword =  request.getParameter("password"); 
	
		
		User user = new User(); 
		user.setUserId(userId);
		user.setUserPassword(userPassword);
		
		int result = new UserService().loginCheck(user);
		
		System.out.println("UserLogin@servlet="+user);
		
		String view ="";
		String loc = "/";
		
		
		if (result == UserService.LOGIN_OK) {
			
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/login/userLoginFrm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
