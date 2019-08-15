package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MypageService;
import travel.model.vo.RoomReservation;

/**
 * Servlet implementation class MyBasketDelServlet
 */
@WebServlet("/mypage/myBasketDel")
public class MyBasketDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBasketDelServlet() {
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
		
		String msg="";
		String loc="/mypage/myBasketView?userId="+r.getUserId();
		if(result>0) {
			msg="삭제에 성공하였습니다.";
		}else {
			msg="삭제에 실패하였습니다.";
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
