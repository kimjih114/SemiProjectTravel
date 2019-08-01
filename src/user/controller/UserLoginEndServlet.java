package user.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.vo.User;
import user.model.service.UserService;

/**
 * Servlet implementation class UserLoginEndServlet
 */
@WebServlet("/user/loginEnd")
public class UserLoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
		// 서블릿 생성시 최초1회만 호출된다.
		System.out.println("MemberLoginServlet.init 호출됨!");
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//인코딩 
		request.setCharacterEncoding("utf-8");
		
		
		//파라미터 핸들링 
		String userId = request.getParameter("userId"); 
		String userPassword = request.getParameter("userpassword");  
		
		
		User user = new User();
		user.setUserId(userId);
		user.setUserPassword(userPassword);
		
		System.out.println("user@loginServlet="+user);
		
		
		//업무로직 
		int result = new UserService().loginCheck(user);
		
		
		
		//view단 처리 
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
