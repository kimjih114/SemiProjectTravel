package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MypageService;
import travel.model.service.TravelService;
import travel.model.vo.RoomReservation;

/**
 * Servlet implementation class MyReservationViewServlet
 */
@WebServlet("/mypage/myReservationView")
public class MyReservationViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReservationViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		System.out.println("아이디는?="+userId);
		List<RoomReservation> room=new TravelService().myReservationRoom(userId);
		
		List<RoomReservation> friendRoom=new MypageService().friendReservationRoom(userId);
		
		request.setAttribute("friendRoom", friendRoom);
		request.setAttribute("room",room);
		request.getRequestDispatcher("/WEB-INF/views/mypage/myReservationView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
