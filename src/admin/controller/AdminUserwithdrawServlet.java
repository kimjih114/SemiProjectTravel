package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

/**
 * Servlet implementation class AdminUserwithdrawServlet
 */
@WebServlet("/admin/userwithdraw")
public class AdminUserwithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserwithdrawServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		
		int result = new UserService().deleteUser(userId);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/admin/adminUserList";
		
		if(result>0)
			msg = "회원이 탈퇴되었습니다.";
		else
			msg="회원 탈퇴를 실패했습니다.";
		
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
