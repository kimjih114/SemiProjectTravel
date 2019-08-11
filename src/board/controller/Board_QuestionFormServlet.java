package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.Board_QuestionService;
import board.model.vo.Board_Question;
import common.util.MVCRenamePolicy;

/**
 * Servlet implementation class Board_QuestionFormServlet
 */
@WebServlet("/board/boardQuestionFrm")
public class Board_QuestionFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board_QuestionFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "문의게시판 파일등록오류!");
			request.setAttribute("loc", "/");
			
			request.getRequestDispatcher("/WEB-INF/vies/common/msg.jsp").forward(request, response);
			
			return; 
		}
		
		String root =getServletContext().getRealPath("/");
		String saveDirectory = root +"upload"+File.separator+"board"; 
		System.out.println("saveDirectory"+saveDirectory);
		
		int maxPostSize = 1024*1024*10;
		
		String encoding ="utf-8"; 
		
		FileRenamePolicy mvcRenamePolicy = new MVCRenamePolicy(); 
		
		MultipartRequest mReq = new MultipartRequest(request, saveDirectory,maxPostSize, encoding,mvcRenamePolicy) ; 
		
		
		
		String qboardTitle = mReq.getParameter("qboardTitle"); 
		String qboardWriter = mReq.getParameter("qboardWriter"); 
		
		String qboardNewFileName =mReq.getFilesystemName("upFile"); 
		String originalFileName =mReq.getOriginalFileName("upFile"); 
		int qboardtravel_ref = 0;/*Integer.parseInt(mReq.getParameter("qboard_travel_ref"));*/
		String qboardContent=mReq.getParameter("qboardContent"); 
		
		int qboard_status = 0;   
		
		qboardContent = qboardContent.replaceAll("<", "&lt;"); 
		qboardContent = qboardContent.replaceAll(">", "&gt;"); 
		
		
		Board_Question bq = new Board_Question(); 
		bq.setQboardTitle(qboardTitle);
		bq.setQboardWriter(qboardWriter);
		bq.setQboardContent(qboardContent);
		bq.setQboardTravel_ref(qboardtravel_ref);
		bq.setQboardFileName(originalFileName);
		bq.setQboardNewFileName(qboardNewFileName);
		bq.setQboardStatus(qboard_status);
	
		
		int result = new Board_QuestionService().insertQBoard(bq); 
		
		String msg = ""; 
		String loc = "/ajax/board_questionList"; 
		
		if(result >0) {
			msg ="게시글 등록 성공"; 
			loc = "/";/*"/ajax/"+result;  */  //view로 간다    
		}else {
			msg="게시글 등록실패"; 
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
