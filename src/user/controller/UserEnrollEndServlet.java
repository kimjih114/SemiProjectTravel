package user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.MVCRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;


import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserenrollEndServlet
 */
@WebServlet("/enroll/userEnrollEnd")
public class UserEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

//		String root = "C:"+File.separator+"Workspaces"+File.separator+"webserver_workspace"+File.separator+"SemiProjectTravel";
		String root =  getServletContext().getRealPath("/");
//		String root  ="C:\\Workspaces\\webserver_workspace\\SemiProjectTravel\\WebContent"+File.separator;
		
		String saveDirectory = root +"upload"+File.separator+"enroll";
		System.out.println("saveDirectory => "+saveDirectory);

		int maxPostSize = 1024 * 1024 * 10;
		
		FileRenamePolicy policy
			= new MVCRenamePolicy();

		MultipartRequest mrequest = new MultipartRequest(request, 
														 saveDirectory, 
														 maxPostSize, 
														 "UTF-8", 
														 policy);
		
	
		String userId = mrequest.getParameter("userId");
		String nickName = mrequest.getParameter("usernickName");
		String password = mrequest.getParameter("userPassword");
		String userName = mrequest.getParameter("userName");
		
		java.sql.Date userBirth = java.sql.Date.valueOf(mrequest.getParameter("userBirth"));
		System.out.println("birthDate@servlet="+mrequest.getParameter("userBirth"));
		
		String email = mrequest.getParameter("userEmail");
		String phone = mrequest.getParameter("userPhone");
		String gender = mrequest.getParameter("userGender");
		String userType = mrequest.getParameter("userType");
		
		String fileName_ = mrequest.getFilesystemName("fileName");
		File f = mrequest.getFile("fileName_");
		
		
		
		String[] dplaces = mrequest.getParameterValues("location");
		String user_default_place = "";
		if(dplaces!=null)
			user_default_place = String.join(",",dplaces);
		
		String[] dactivitys = mrequest.getParameterValues("program");
		String user_default_activity = "";
		if(dactivitys!=null)
			user_default_activity = String.join(",",dactivitys);
		
		String[] splaces = mrequest.getParameterValues("promotion");
		String user_seller_place = "";
		if(splaces!=null)
			user_seller_place=String.join(",", splaces);
		
		String[] sproducttype = mrequest.getParameterValues("traveltype");
		String user_seller_producttype="";
		if(sproducttype!=null)
			user_seller_producttype=String.join(",", sproducttype);
		
		User u = new User();
		u.setUserId(userId);
		u.setUsernickName(nickName);
		u.setUserPassword(password);
		u.setUserName(userName);
		u.setUserBirth(userBirth);
		u.setUserEmail(email);
		u.setUserPhone(phone);
		u.setUserGender(gender);
		u.setUserType(userType);
		u.setFileName(fileName_);
		u.setUserDefaultPlace(user_default_place);
		u.setUserDefaultActivity(user_default_activity);
		
		System.out.println("입력한 회원 정보 : "+u);
		
		int result = new UserService().insertUser(u);
	
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		if(result>0)
			msg="축하합니다. 성공적으로 가입되었습니다 : )";
		else
			msg = "회원 등록에 실패하였습니다.";
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
