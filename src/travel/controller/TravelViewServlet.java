package travel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.model.service.TravelService;
import travel.model.vo.Travel;

/**
 * Servlet implementation class TravelViewServlet
 */
@WebServlet("/travel/travelView")
public class TravelViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TravelViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		String[] searchName=request.getParameter("searchName").trim().split("#");

//		final int numPerPage = 6;
//		int cPage = 1;
//		try {
//			cPage = Integer.parseInt(request.getParameter("cPage"));
//		} catch(NumberFormatException e) {
//
//		}
//
//		List<Travel> list=new TravelService().travelView(searchName,cPage,numPerPage);
//		//전체관광지 수 구하기
//		int totalTravel=new TravelService().travelTotalCount(searchName);
//
//		//(공식2)totalPage구하기
//		int totalPage = (int)Math.ceil((double)totalTravel/numPerPage);
//
//		//페이지바 html코드
//		String pageBar = "";	
//		//페이지바 길이
//		int pageBarSize = 5;
//		//(공식3)시작페이지 번호 세팅
//		//cPage=5,pageBarSize=5 -> 1
//		//cPage=6,pageBarSize=5 -> 6
//		int pageStart = ((cPage - 1)/pageBarSize) * pageBarSize +1;
//		//종료페이지 번호 세팅
//		int pageEnd = pageStart+pageBarSize-1;
//		int pageNo = pageStart;
//
//		//이전 section
//		if(pageNo == 1 ){
//			pageBar+="[이전]";
//		}
//		else {
//			pageBar += "<a href='"+request.getContextPath()+"/travel/travelView?sido1="+sido+"&gugun1="+gugun+"&cPage="+(pageNo-pageBarSize)+"&numPerPage="+numPerPage+"'>[이전]</a> ";
//		}
//		// pageNo section
//		// 보통 !(빠져나가는 조건식)으로 많이 쓴다.
//		//					while(pageNo<=pageEnd && pageNo<=totalPage){
//		while(!(pageNo>pageEnd || pageNo > totalPage)){
//			if(cPage == pageNo ){
//				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
//			} 
//			else {
//				pageBar += "<a href='"+request.getContextPath()+"/travel/travelView?sido1="+sido+"&gugun1="+gugun+"&cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a> ";
//			}
//			pageNo++;
//		}
//
//		//[다음] section
//		if(pageNo > totalPage){
//			pageBar+="[다음]";
//		} else {
//			pageBar += "<a href='"+request.getContextPath()+"/travel/travelView?sido1="+sido+"&gugun1="+gugun+"&cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
//		}
//
//		request.setAttribute("pageBar", pageBar);
//		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/travel/travelView.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
