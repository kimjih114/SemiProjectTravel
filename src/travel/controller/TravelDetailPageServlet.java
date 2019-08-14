package travel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sns.model.vo.GradeSNS;
import travel.model.service.TravelService;

/**
 * Servlet implementation class TravelDetailPageServlet
 */
@WebServlet("/travel/detailPage")
public class TravelDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelDetailPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
String contentId=request.getParameter("contentId");
		
		List<GradeSNS> gradeList=new TravelService().contentGradeSelect(contentId);
		double sumGrade=0;
		double avgGrade=0;
		
		//평점총갯수
		int totalContentSize=gradeList.size();
		
		if(totalContentSize==0) {
			request.setAttribute("avgGrade", avgGrade);

		}else {
			
			for(int i=0;i<gradeList.size();i++) {
				sumGrade+=gradeList.get(i).getGrade();
			}
			
			avgGrade=Math.round((sumGrade/totalContentSize)*10)/10.0;
			request.setAttribute("avgGrade", avgGrade);
			
		}
		
		
		request.getRequestDispatcher("/WEB-INF/views/travel/travelDetailPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
