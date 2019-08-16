package sns.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;

/**
 * Servlet implementation class AjaxSNSDeleteBoardSNSServlet
 */
@WebServlet("/gson/sns/deleteBoardSNS.do")
public class AjaxSnsBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsBoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0.encoding
		response.setContentType("application/json; charset=utf-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
										
		//2.business logic
		List<String> renamedFileNames = new SNSService().selectRenamedFileNames(boardNo);
		int result = new SNSService().deleteBoardSNS(boardNo);
		
		
		if(result > 0 && renamedFileNames!=null) {
			for(String rfn : renamedFileNames) {
					String saveDirectory = getServletContext().getRealPath("/upload/board");
					File delFile  = new File(saveDirectory+File.separator+rfn);
					System.out.println("delFile="+delFile);
				
					String delDirectory = getServletContext().getRealPath("/delete/board");
					File renamedFile = new File(delDirectory+File.separator+rfn);
					boolean bool = delFile.renameTo(renamedFile);
			}
		}
										
		//view단 작성
		if(result>0) {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(result, response.getWriter());
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
