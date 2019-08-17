package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.AdminRoom;
import admin.model.vo.RoomImage;

/**
 * Servlet implementation class AdminRoomUpdateFormServlet
 */
@WebServlet("/admin/roomUpdateForm")
public class AdminRoomUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRoomUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contentId=request.getParameter("contentId");
		String roomName=request.getParameter("roomName");
		
		List<AdminRoom> roomList=new AdminService().roomUpdateForm(contentId,roomName);
		List<RoomImage> roomImage=new AdminService().roomImageUpdateForm(contentId,roomName);
		
		request.setAttribute("roomList", roomList);
		request.setAttribute("roomImage", roomImage);
		request.getRequestDispatcher("/WEB-INF/views/admin/roomUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
