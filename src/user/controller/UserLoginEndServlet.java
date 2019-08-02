package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

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
		String userPassword = request.getParameter("userPassword");  
		
		
		User user = new User();
		user.setUserId(userId);
		user.setUserPassword(userPassword);
		
		
		System.out.println("user@loginServlet="+user);
		
		
		//업무로직 
		int result = new UserService().loginCheck(user);
		System.out.println("result@loginendServlet="+result);
		
		String view = "/"; 
		String loc = "/";
		
		String referer = request.getHeader("Referer");
		String origin = request.getHeader("Origin");
		String url = request.getRequestURI().toString(); 
		String uri = request.getRequestURI();
		
		System.out.println("referer=" + referer);
		System.out.println("origin=" + origin);
		System.out.println("url=" + url);
		System.out.println("uri=" + uri);
		
		// referer  
		
		
		
		
		if(result == UserService.LOGIN_OK) {
			view = "/index.jsp";   //로그인 성공시      Index페이지로 
			
			User userLoggedIn = new UserService().selectOne(userId);
			
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(10*60);
			session.setAttribute("userLoggedIn", userLoggedIn);
			
			//아이디 저장관련 쿠키 처리  
			
			
			//
			//response.sendRedirect(referer);
			
			
		}else {
			
			view = "/WEB-INF/views/common/msg.jsp"; 
			String msg=""; 
			if(result == UserService.WRONG_PASSWORD) {
				msg="비밀번호가 틀렸습니다."; 
				
			}else if(result == UserService.ID_NOT_EXIST) {
				msg="존재하지 않는 아이디 입니다."; 
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher(view).forward(request, response);
			
			
			
			
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
