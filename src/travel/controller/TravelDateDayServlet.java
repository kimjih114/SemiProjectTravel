package travel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import travel.model.service.TravelService;

/**
 * Servlet implementation class TravelDateDayServlet
 */
@WebServlet("/travel/dateDay.do")
public class TravelDateDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelDateDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sDate=request.getParameter("sDate");
		String eDate=request.getParameter("eDate");
		
		String[] sd1=sDate.split("-");
		String startDate=sd1[0]+sd1[1]+sd1[2];

		String[] ed1=eDate.split("-");
		String endDate=ed1[0]+ed1[1]+ed1[2];
		
		int day=new TravelService().selectDay(startDate,endDate);
		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(day, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
