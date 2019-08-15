package travel.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.model.service.TravelService;
import travel.model.vo.Travel;

/**
 * Servlet implementation class TravelDeleteServlet
 */
@WebServlet("/travel/travelDelete")
public class TravelDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contentId_ = request.getParameter("contentId");
		String renamedFileName = request.getParameter("thumbnailRenamedFilename");
		Travel t = new TravelService().selectTravel(contentId_);
		
		int result = new TravelService().deleteTravel(contentId_);
		
		if(result>0 && !"".equals(renamedFileName)) {
			String saveDirectory
				=getServletContext().getRealPath("/upload/travel");
			File delFile 
			= new File(saveDirectory+File.separator+renamedFileName);
		System.out.println("delFile="+delFile);
		
		String delDirectory
		= getServletContext().getRealPath("/upload/delete");
		File renamedFile
		= new File(delDirectory+File.separator+renamedFileName);
		boolean bool = delFile.renameTo(renamedFile);
		System.out.println("삭제(파일이동)여부: "+bool);
		}
		
		String view="/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/travel/travelList";
		
		if(result>0)
			msg = "업체 삭제 성공";
		else
			msg = "업체 삭제 실패";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
