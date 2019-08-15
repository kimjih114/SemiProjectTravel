package travel.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.util.MVCRenamePolicy;
import travel.model.service.TravelService;
import travel.model.vo.Travel;

/**
 * Servlet implementation class TravelUpdateEndServlet
 */
@WebServlet("/travel/travelUpdateEnd")
public class TravelUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "업체수정작성오류![form:enctype 관리자에게 문의하세요.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
		
		String contentId_= request.getParameter("contentId");
	
		Travel t = new TravelService().selectTravel(contentId_);
		
		
		request.setCharacterEncoding("utf-8");
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload"+File.separator+"travel";
		
		int maxPostSize = 1024 * 1024 * 10;
		FileRenamePolicy policy = new MVCRenamePolicy();
		
		MultipartRequest mrequest = new MultipartRequest(request, 
				 saveDirectory, 
				 maxPostSize, 
				 "UTF-8", 
				 policy);

		String contentId = mrequest.getParameter("contentId");
		String travelName = mrequest.getParameter("travelName");
		String travelLocation = mrequest.getParameter("travelLocation");
		
		String tOriginalFilename = mrequest.getOriginalFileName("fileUpdate");
		String tRenamedFilename = mrequest.getFilesystemName("fileUpdate");
		
		String oldOName = mrequest.getParameter("oldOName");
		String oldRName = mrequest.getParameter("oldRName");
		
		if(!"".equals(tOriginalFilename)) {
			System.out.println("*****기존 첨부 파일이 있는 경우, 후처리 시작*******");
			
			//업로드된 파일에 대한 객체생성
			File f = mrequest.getFile("fileUpdate");
			
			//1.전송된 파일이 있는 경우
			if(f!=null && f.length()>0) {
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+File.separator+mrequest.getParameter("oldRName"));
				System.out.println("delFIle+"+delFile);
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
					tOriginalFilename = oldOName;
					tRenamedFilename = oldRName;
			}
			
			}
			else if("".equals(tOriginalFilename)) {
				tOriginalFilename = oldOName;
				tRenamedFilename = oldRName;
			}
			
		String travelContent = mrequest.getParameter("content");
		String travelOfficierName = mrequest.getParameter("officierName");
		String travelOfficierphone = mrequest.getParameter("officierPhone");
		String travelType = mrequest.getParameter("program");
	
		t.setContentId(contentId);
		t.setTravelName(travelName);
		t.setTravelLocation(travelLocation);
		t.setThumbnailOriginalFilename(tOriginalFilename);
		t.setThumbnailRenamedFilename(tRenamedFilename);
		t.setTravelContent(travelContent);
		t.setTravelOfficierName(travelOfficierName);
		t.setTravelOfficierphone(travelOfficierphone);
		t.setTravelType(travelType);
		
		System.out.println("tttt==="+t);
		int result = new TravelService().updateTravel(t, travelType);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		if(result>0)
			msg = "업체가 수정 되었습니다.";
		else
			msg="업체 수정에 실패하였습니다.";
		
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
