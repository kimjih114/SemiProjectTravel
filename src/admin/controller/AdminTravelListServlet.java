package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.AdminRoom;
import travel.model.service.TravelService;
import travel.model.vo.Travel;

/**
 * Servlet implementation class AdminTravelListServlet
 */
@WebServlet("/travel/travelList")
public class AdminTravelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTravelListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int numPerPage =10;
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			
		}
		
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			
		}
		
		List<Travel> list = new TravelService().selectTravelList(cPage,numPerPage);
		
		int totalContents = new TravelService().selectTotalContents();
		
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		final int pageBarSize = 5;
		String pageBar = "";
		
		int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageStart + pageBarSize-1;
		
		int pageNo = pageStart;
		
		if(pageNo==1) {
			pageBar += "<span>[이전]</span>";
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/travel/travelList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}
		while(pageNo<=pageEnd && pageNo <=totalPage) {
			if(pageNo == cPage) {
				pageBar +="<span class ='cPage'>"+pageNo+"</span>";
			}
			else {
				pageBar +="<a href='"+request.getContextPath()+"/travel/travelList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>[다음]</span>";
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/travel/travelList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		
		//업체가 숙소인 방리스트 뽑기
		List<AdminRoom> roomList=new AdminService().selectAdminRoomList();
		request.setAttribute("roomList", roomList);
		
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.getRequestDispatcher("/WEB-INF/views/admin/travelListView.jsp")
			   .forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
