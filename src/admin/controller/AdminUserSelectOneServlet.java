package admin.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.UserListSingletone;
import user.model.vo.User;

/**
 * Servlet implementation class AdminUserSelectOneServlet
 */
@WebServlet("/admin/selectOne.do")
public class AdminUserSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String searchId = request.getParameter("userId");
		
		List<User> userList = UserListSingletone.getInstance().getUserList();
		
		JSONObject result = null;
		
		for(User u : userList) {
			if(searchId.equals(u.getUserId())) {
				result = new JSONObject();
				result.put("userId", u.getUserId());
				result.put("userNickName",u.getUserName());
				result.put("userName",u.getUserName());
				result.put("userGender",u.getUserGender());
				result.put("userBirth",u.getUserBirth());
				result.put("userEmail",u.getUserEmail());
				result.put("userPhone",u.getUserPhone());
				result.put("originalFileName",u.getOriginalFileName());
				result.put("fileName",u.getFileName());
				result.put("userType",u.getUserType());
				result.put("userDefaultPlace",u.getUserDefaultPlace());
				result.put("userDefaultActivity",u.getUserDefaultActivity());
				result.put("userEnrollDate",u.getUserEnrollDate());
				break;
			}
		}
		response.getWriter().print(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
