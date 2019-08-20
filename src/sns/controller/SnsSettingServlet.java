package sns.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.util.MVCRenamePolicy;
import sns.model.service.SNSService;
import sns.model.vo.ProfileSNS;

/**
 * Servlet implementation class SnsSettingServlet
 */
@WebServlet("/setting/updateSet")
public class SnsSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SnsSettingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "설정변경오류![form:enctype 관리자에게 문의하세요.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
		
		

		request.setCharacterEncoding("utf-8");
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root +"upload"+File.separator+"profile";
		
		int maxPostSize = 1024 * 1024* 10;
		
		FileRenamePolicy policy = new MVCRenamePolicy();
		
		MultipartRequest mreq = new MultipartRequest(request, 
				 saveDirectory, 
				 maxPostSize, 
				 "UTF-8", 
				 policy);
		String profileUserId = mreq.getParameter("setName");
		
		String setnickName = mreq.getParameter("SmodifyNick"); 
		String setheaderText = mreq.getParameter("SmodifyText"); 
		String setThema = mreq.getParameter("themaColor");
		
		String renamedProfileName=  mreq.getFilesystemName("SmodifyProfile"); 
		String originalProfileName=  mreq.getOriginalFileName("SmodifyProfile"); 
		
		String renamedHeaderfileName = mreq.getFilesystemName("SmodifyHeader"); 
		String originalHeaderfileName= mreq.getOriginalFileName("SmodifyHeader");
		
		String oldprofileOName = mreq.getParameter("oldprofileOName");
		String oldprofileRName = mreq.getParameter("oldprofileRName");
		
		String oldHeaderOName = mreq.getParameter("oldHeaderOName");
		String oldHeaderRName = mreq.getParameter("oldHeaderRName");
		
		if(!"".equals(oldprofileOName)) {
			//업로드된 파일에 대한 객체생성
			File f = mreq.getFile("SmodifyProfile");
			
			//1.전송된 파일이 있는 경우
			if(f!=null && f.length()>0) {
				//기존파일이 있다면, 삭제
				File delFile 
					= new File(saveDirectory+"/"+mreq.getParameter("oldprofileRName"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//2.기존첨부파일을 삭제하려는 경우
			else if(mreq.getParameter("delFile") != null){
				//기존파일이 삭제
				//기존파일이 있다면, 삭제
				File delFile 
					= new File(saveDirectory+"/"+mreq.getParameter("oldRName"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//3.첨부한 파일이 없는 경우
			else {
				//기존파일명을 다시 대입
				originalProfileName = oldprofileOName;
				renamedProfileName = oldprofileRName;
			}
		}
		//헤더 
		
		if(!"".equals(oldHeaderOName)) {
			//업로드된 파일에 대한 객체생성
			File f = mreq.getFile("SmodifyHeader");
			
			//1.전송된 파일이 있는 경우
			if(f!=null && f.length()>0) {
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+"/"+mreq.getParameter("oldHeaderRName"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//2.기존첨부파일을 삭제하려는 경우
			else if(mreq.getParameter("delFile") != null){
				//기존파일이 삭제
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+"/"+mreq.getParameter("oldHeaderRName"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//3.첨부한 파일이 없는 경우
			else {
				//기존파일명을 다시 대입
				originalHeaderfileName = oldHeaderRName;
				renamedHeaderfileName = oldHeaderRName;
			}
		}
		
		
		
		ProfileSNS ps = new ProfileSNS(); 
		ps.setProfileUserId(profileUserId);
		ps.setHeaderText(setheaderText);
		ps.setThemeColor(setThema);
		ps.setProfileOriginalFilename(originalProfileName);
		ps.setProfileRenamedFilename(renamedProfileName);
		ps.setHeaderOriginalFilename(originalHeaderfileName);
		ps.setHeaderRenamedFilename(renamedHeaderfileName);
		ps.setProfileUserNickname(setnickName);
		
		int result = new SNSService().updateSetting(ps);		
		String view = "/WEB-INF/views/common/msg.jsp"; 
		String msg= ""; 
		String loc= "/"; 
		
		if(result >0) {
			msg ="설정변경 성공"; 
			loc = "/story/storyMain?mypage="+profileUserId;   
		}else {
			msg="설정변경 실패"; 
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
