package travel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.Location;

import travel.model.service.TravelService;
import travel.model.vo.RoomReservation;

/**
 * Servlet implementation class ReservationInsertServlet
 */
@WebServlet("/travel/reservationInsert")
public class ReservationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contentTypeId=request.getParameter("contentTypeId");
		String userId=request.getParameter("userId");
		String contentId=request.getParameter("contentId");
		String title=request.getParameter("title");
		String roomTitle=request.getParameter("roomTitle");
		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		String friendId=request.getParameter("friendId");
		int price=Integer.parseInt(request.getParameter("price"));
		
		RoomReservation r=new RoomReservation(userId, contentId, title, roomTitle, startDate, endDate, friendId, null, price);
		
		int result=new TravelService().reservationInsert(r);
		String msg="";
		String loc="";
		if(result>0) {
			msg="예약이 완료되었습니다.";
			loc="/mypage/myReservationView?userId="+userId;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}else {
			msg="예약이 실패하였습니다.";
			loc="/travel/reservationForm?contentId="+contentId+"&contentTypeId="+contentTypeId+"&title="+title;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
