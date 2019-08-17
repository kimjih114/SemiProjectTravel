package admin.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import admin.model.service.AdminService;
import admin.model.vo.AdminRoom;
import admin.model.vo.RoomImage;
import common.util.MVCRenamePolicy;

/**
 * Servlet implementation class AdminRoomUpdateEndServlet
 */
@WebServlet("/admin/roomUpdateEnd")
public class AdminRoomUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRoomUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		String contentId=mrequest.getParameter("contentId");
		String roomName=mrequest.getParameter("roomName");
		String roomSize=mrequest.getParameter("roomSize");
		String roomPerson=mrequest.getParameter("roomPerson");
		int roomWeekDayHighPrice=Integer.parseInt(mrequest.getParameter("roomWeekDayHighPrice"));
		int roomWeekEndHighPrice=Integer.parseInt(mrequest.getParameter("roomWeekEndHighPrice"));
		int roomWeekDayLowPrice=Integer.parseInt(mrequest.getParameter("roomWeekDaylowPrice"));
		int roomWeekEndLowPrice=Integer.parseInt(mrequest.getParameter("roomWeekEndlowPrice"));
		String content=mrequest.getParameter("content");
		
		String originalFileName1 = mrequest.getOriginalFileName("fileName1");
		String renameFileName1 = mrequest.getFilesystemName("fileName1");
		mrequest.getFile("renameFileName1");
		
		String originalFileName2 = mrequest.getOriginalFileName("fileName2");
		String renameFileName2 = mrequest.getFilesystemName("fileName2");
		mrequest.getFile("renameFileName2");
		
		String originalFileName3 = mrequest.getOriginalFileName("fileName3");
		String renameFileName3 = mrequest.getFilesystemName("fileName3");
		mrequest.getFile("renameFileName3");
		
		String oldOName1 = mrequest.getParameter("oldOName1");
		String oldRName1 = mrequest.getParameter("oldRName1");
		String oldOName2 = mrequest.getParameter("oldOName2");
		String oldRName2 = mrequest.getParameter("oldRName2");
		String oldOName3 = mrequest.getParameter("oldOName3");
		String oldRName3 = mrequest.getParameter("oldRName3");
		
		if(!"".equals(originalFileName1)) {
			System.out.println("*****기존 첨부 파일이 있는 경우, 후처리 시작*******");
			
			//업로드된 파일에 대한 객체생성
			File f = mrequest.getFile("fileName1");
			
			//1.전송된 파일이 있는 경우
			if(f!=null && f.length()>0) {
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+File.separator+mrequest.getParameter("oldRName1"));
				System.out.println("delFIle+"+delFile);
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//2.기존첨부파일을 삭제하려는 경우
			else if(mrequest.getParameter("delFile1") != null){
				//기존파일이 삭제
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+"/"+mrequest.getParameter("oldRName1"));
				boolean bool = delFile.delete();
				System.out.println(delFile);
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//3.첨부한 파일이 없는 경우
			else if(f==null) {
				//기존파일명을 다시 대입
				originalFileName1 = oldOName1;
				renameFileName1 = oldRName1;
			}
			
		}
		else if("".equals(originalFileName1)) {
			originalFileName1 = oldOName1;
			renameFileName1 = oldRName1;
		}
		
		if(!"".equals(originalFileName2)) {
			System.out.println("*****기존 첨부 파일이 있는 경우, 후처리 시작*******");
			
			//업로드된 파일에 대한 객체생성
			File f = mrequest.getFile("fileName2");
			
			//1.전송된 파일이 있는 경우
			if(f!=null && f.length()>0) {
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+File.separator+mrequest.getParameter("oldRName2"));
				System.out.println("delFIle+"+delFile);
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//2.기존첨부파일을 삭제하려는 경우
			else if(mrequest.getParameter("delFile2") != null){
				//기존파일이 삭제
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+"/"+mrequest.getParameter("oldRName2"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//3.첨부한 파일이 없는 경우
			else if(f==null) {
				//기존파일명을 다시 대입
				originalFileName2 = oldOName2;
				renameFileName2 = oldRName2;
			}
			
		}
		else if("".equals(originalFileName2)) {
			originalFileName2 = oldOName2;
			renameFileName2 = oldRName2;
		}
		
		if(!"".equals(originalFileName3)) {
			System.out.println("*****기존 첨부 파일이 있는 경우, 후처리 시작*******");
			
			//업로드된 파일에 대한 객체생성
			File f = mrequest.getFile("fileName3");
			
			//1.전송된 파일이 있는 경우
			if(f!=null && f.length()>0) {
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+File.separator+mrequest.getParameter("oldRName3"));
				System.out.println("delFIle+"+delFile);
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//2.기존첨부파일을 삭제하려는 경우
			else if(mrequest.getParameter("delFile3") != null){
				//기존파일이 삭제
				//기존파일이 있다면, 삭제
				File delFile 
				= new File(saveDirectory+"/"+mrequest.getParameter("oldRName3"));
				boolean bool = delFile.delete();
				System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
				
			}
			//3.첨부한 파일이 없는 경우
			else if(f==null) {
				//기존파일명을 다시 대입
				originalFileName3 = oldOName3;
				renameFileName3 = oldRName3;
			}
			
		}
		else if("".equals(originalFileName3)) {
			originalFileName3 = oldOName3;
			renameFileName3 = oldRName3;
		}
		
		//
		AdminRoom a=new AdminRoom(contentId, roomName, roomWeekDayHighPrice, roomWeekDayLowPrice, roomWeekEndHighPrice, roomWeekEndLowPrice, roomSize, roomPerson, content);
		RoomImage r=new RoomImage(contentId, roomName, originalFileName1, renameFileName1, originalFileName2, renameFileName2, originalFileName3, renameFileName3);
		
		int result1=new AdminService().roomUpdateEnd(a);
		int result2=new AdminService().roomImageUpdateEnd(r);
		
		String msg="";
		String loc="/travel/travelList";
		if(result1>0&&result2>0) {
			msg="방수정에 성공하였습니다.";
		}else {
			msg="방수정에 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
