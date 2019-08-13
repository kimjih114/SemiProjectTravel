package travel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import travel.model.service.TravelService;
import travel.model.vo.RoomReservation;

/**
 * Servlet implementation class ReservationBasketInsertServlet
 */
@WebServlet("/travel/reservationBasket")
public class ReservationBasketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationBasketInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		String contentId=request.getParameter("contentId");
		String contentTypeId=request.getParameter("contentTypeId");
		String travelName=request.getParameter("title");
		String roomName=request.getParameter("roomTitle");
		String reservationStartDate=request.getParameter("startDate");
		String reservationEndDate=request.getParameter("endDate");
		int price=Integer.parseInt(request.getParameter("price"));
		
		RoomReservation r=new RoomReservation(userId, contentId, contentTypeId, travelName, roomName, reservationStartDate, reservationEndDate, price);
		
		int result=new TravelService().reservationBasketInsert(r);
		
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
