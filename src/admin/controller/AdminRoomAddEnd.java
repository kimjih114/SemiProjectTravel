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
 * Servlet implementation class AdminRoomAddEnd
 */
@WebServlet("/admin/roomAddEnd")
public class AdminRoomAddEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRoomAddEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String root =  getServletContext().getRealPath("/");
		
		String saveDirectory = root +"upload"+File.separator+"travel";
		
		int maxPostSize = 1024 * 1024 * 10;
		
		FileRenamePolicy policy
			= new MVCRenamePolicy();
		
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
		int roomWeekDaylowPrice=Integer.parseInt(mrequest.getParameter("roomWeekDaylowPrice"));
		int roomWeekEndlowPrice=Integer.parseInt(mrequest.getParameter("roomWeekEndlowPrice"));
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
		
		AdminRoom a=new AdminRoom(contentId, roomName, roomWeekDayHighPrice, roomWeekDaylowPrice, roomWeekEndHighPrice, roomWeekEndlowPrice, roomSize, roomPerson, content);
		int result1=new AdminService().adminRoomInsert(a);
		
		RoomImage r=new RoomImage(contentId, roomName, originalFileName1, renameFileName1, originalFileName2, renameFileName2, originalFileName3, renameFileName3);
		int result2=new AdminService().adminRoomImageInsert(r);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
