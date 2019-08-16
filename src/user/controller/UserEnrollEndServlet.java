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
import common.util.MVCUtils;

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
		
		String saveDirectory = root +"upload"+File.separator+"profile";
	

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
		
		String password_ = mrequest.getParameter("userPassword");
		String password = MVCUtils.getSha512(password_);
		String userName = mrequest.getParameter("userName");
		
		java.sql.Date userBirth = java.sql.Date.valueOf(mrequest.getParameter("userBirth"));
		
		String email = mrequest.getParameter("userEmail");
		String phone = mrequest.getParameter("userPhone");
		String gender = mrequest.getParameter("userGender");
		String userType = mrequest.getParameter("userType");
		
		String originalFileName = mrequest.getOriginalFileName("fileName");
		String fileName_ = mrequest.getFilesystemName("fileName");
		
		if(fileName_==null) {
			fileName_ = "사용자.png";
		}
		
		File f = mrequest.getFile("fileName_");
		
		
		
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
		u.setOriginalFileName(originalFileName);
		u.setFileName(fileName_);

		
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
