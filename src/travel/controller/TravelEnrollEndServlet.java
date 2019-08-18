package travel.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.util.MVCRenamePolicy;
import travel.model.service.TravelService;
import travel.model.vo.Travel;

/**
 * Servlet implementation class TravelEnrollEndServlet
 */
@WebServlet("/travel/travelEnrollEnd")
public class TravelEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String root =  getServletContext().getRealPath("/");
		
		String saveDirectory = root +"upload"+File.separator+"travel";
		
		int maxPostSize = 1024 * 1024 * 10;
		
		FileRenamePolicy policy
			= new MVCRenamePolicy();
		
		MultipartRequest mrequest = new MultipartRequest(request, 
				 saveDirectory, 
				 maxPostSize, 
				 "UTF-8", 
				 policy);
		
		String travelName = mrequest.getParameter("travelName");
		String travelLocation = mrequest.getParameter("travelLocation");
		String originalFileName = mrequest.getOriginalFileName("fileName");
		
		String fileName_ = mrequest.getFilesystemName("fileName");
		File f = mrequest.getFile("fileName_");
		
		String officierName = mrequest.getParameter("officierName");
		String officierPhone = mrequest.getParameter("officierPhone");
		
		String[] sproducttype = mrequest.getParameterValues("program");
		String user_seller_producttype="";
		if(sproducttype!=null)
			user_seller_producttype=String.join(",", sproducttype);
		String content = mrequest.getParameter("content");
		
		Travel t = new Travel();
		t.setTravelName(travelName);
		t.setTravelLocation(travelLocation);
		t.setThumbnailOriginalFilename(originalFileName);
		t.setThumbnailRenamedFilename(fileName_);
		t.setTravelOfficierName(officierName);
		t.setTravelOfficierphone(officierPhone);
		t.setTravelType(user_seller_producttype);
		t.setTravelContent(content);
		
		System.out.println("입력한 정보: "+t);
		int result = new TravelService().insertTravel(t);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/travel/travelList";
		
		if(result>0)
			msg="입력되었습니다. : )";
		else
			msg = "입력에 실패하였습니다.";
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
