package travel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.model.service.TravelService;
import travel.model.vo.RoomReservation;

/**
 * Servlet implementation class ReservationDelServlet
 */
@WebServlet("/mypage/reservationDel")
public class ReservationDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		String contentId=request.getParameter("contentId");
		String travelName=request.getParameter("travelName");
		String roomName=request.getParameter("roomName");
		String reservationStartDate=request.getParameter("reservationStartDate"); 
		String reservationEndDate=request.getParameter("reservationEndDate");
		
		RoomReservation r=new RoomReservation(userId, contentId, travelName, roomName, reservationStartDate, reservationEndDate, null, null, 0);
		
		int result=new TravelService().reservationDelete(r);
		
		String msg="";
		String loc="/mypage/myReservationView?userId="+userId;
		if(result>0) {
			msg="예약취소에 성공하였습니다.";
			
		}else {
			msg="예약취소에 실패하였습니다";
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
