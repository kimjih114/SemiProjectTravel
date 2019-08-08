package travel.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import travel.model.service.TravelService;
import travel.model.vo.RoomReservation;

/**
 * Servlet implementation class RoomSearchServlet
 */
@WebServlet("/travel/roomSearch.do")
public class RoomSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String startDate=request.getParameter("sdate");
		String endDate=request.getParameter("edate");
		String contentId=request.getParameter("contentId");
//		long day=0;
		
//		try {
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//			Date sDate=sdf.parse(startDate);
//			Date eDate=sdf.parse(endDate);
//			
//			day=(eDate.getTime()-sDate.getTime())/(24*60*60*1000);
//			
//			
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		List<RoomReservation> room=new TravelService().roomSearch(startDate,endDate,contentId);
		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(room, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
