package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mypage.model.service.MypageService;
import travel.model.vo.RoomReservation;

/**
 * Servlet implementation class ReservationAfterBasketDelServlet
 */
@WebServlet("/mypage/reservationAfterBasketDel")
public class ReservationAfterBasketDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationAfterBasketDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		String contentId=request.getParameter("contentId");
		String roomName=request.getParameter("roomName");
		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		
		RoomReservation r=new RoomReservation(userId, contentId, null, null, roomName, startDate, endDate, 0);
		
		int result=new MypageService().myBasketDel(r);
		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
