package user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.util.MVCRenamePolicy;
import sns.model.service.SNSService;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserUpdateEndServlet
 */
@WebServlet("/update/userUpdateEnd")
public class UserUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "회원수정작성오류![form:enctype 관리자에게 문의하세요.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
		
		String userId_ = request.getParameter("userId"); 
		
		User u  = new UserService().selectOne(userId_);

		
		request.setCharacterEncoding("utf-8");
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root +"upload"+File.separator+"profile";
		
		int maxPostSize = 1024 * 1024* 10;
		
		FileRenamePolicy policy = new MVCRenamePolicy();
		
		MultipartRequest mrequest = new MultipartRequest(request, 
				 saveDirectory, 
				 maxPostSize, 
				 "UTF-8", 
				 policy);

		String userId = mrequest.getParameter("userId");
		String nickName = mrequest.getParameter("usernickName");
		String userName = mrequest.getParameter("userName");		
		java.sql.Date userBirth = java.sql.Date.valueOf(mrequest.getParameter("userBirth"));
		String email = mrequest.getParameter("userEmail");
		String phone = mrequest.getParameter("userPhone");
		String gender = mrequest.getParameter("userGender");
		
		
		String renamedFileName = mrequest.getFilesystemName("fileUpdate");
//		System.out.println("renamedFileName="+renamedFileName);
		String originalFileName = mrequest.getOriginalFileName("fileUpdate");
//		System.out.println("originalFileName="+originalFileName);
		
		String oldOName = mrequest.getParameter("oldOName");
		String oldRName = mrequest.getParameter("oldRName");
		
		if(!"".equals(originalFileName)) {
			System.out.println("*****기존 첨부 파일이 있는 경우, 후처리 시작*******");
			
			//업로드된 파일에 대한 객체생성
			File f = mrequest.getFile("fileUpdate");
			
			//1.전송된 파일이 있는 경우
			if(f!=null && f.length()>0) {
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+File.separator+mrequest.getParameter("oldRName"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//2.기존첨부파일을 삭제하려는 경우
			else if(mrequest.getParameter("delFile") != null){
				//기존파일이 삭제
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+"/"+mrequest.getParameter("oldRName"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//3.첨부한 파일이 없는 경우
			else if(f==null) {
				//기존파일명을 다시 대입
				originalFileName = oldOName;
				renamedFileName = oldRName;
			}
			
		}
		else if("".equals(originalFileName)) {
			originalFileName = oldOName;
			renamedFileName = oldRName;
		}
		
		u.setUsernickName(nickName);
		u.setUserName(userName);
		u.setUserBirth(userBirth);
		u.setUserEmail(email);
		u.setUserPhone(phone);
		u.setUserGender(gender);
		u.setOriginalFileName(originalFileName);
		u.setFileName(renamedFileName);
		
//		System.out.println("u@userUpdateEnd"+u);
		
		int result = new UserService().updateUser(u);
		
		int profile = new SNSService().updateProfile(u);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		if(result>0)
			msg = "회원 수정이 되었습니다.";
		else
			msg="회원 수정에 실패하였습니다.";
		
		
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
