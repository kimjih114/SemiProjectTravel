package board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Board_QuestionFileDownloadServlet
 */
@WebServlet("/board/qboardFileDownload")
public class Board_QuestionFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board_QuestionFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파라미터핸들링
				String oName = request.getParameter("oName");
				String rName = request.getParameter("rName");
				System.out.printf("oName=%s, rName=%s\n", oName, rName);
				
				
				String saveDirectory 
					= getServletContext().getRealPath("/upload/board");
				File downFile 
					= new File(saveDirectory+File.separator+rName);
		
				BufferedInputStream bis 
				= new BufferedInputStream(new FileInputStream(downFile));
		
				ServletOutputStream sos = response.getOutputStream();
				BufferedOutputStream bos 
					= new BufferedOutputStream(sos);
				
				String resFileName = "";
				System.out.println(request.getHeader("user-agent"));
				boolean isMSIE 
					= request.getHeader("user-agent").indexOf("MSIE") != -1 
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
				
				if(isMSIE) {
					
					resFileName = URLEncoder.encode(oName, "utf-8");
					System.out.println("resFileName="+resFileName);
					
					resFileName = resFileName.replaceAll("\\+", "%20");
					System.out.println("resFileName="+resFileName);
				}
				else {
					resFileName	
					= new String(oName.getBytes("UTF-8"), "ISO-8859-1");			
				}
				
				
				
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition", 
								   "attachment;filename="+resFileName);
				
				
				//4.파일쓰기
				int read = -1;
				while((read=bis.read()) != -1) {
					bos.write(read);
				}
				
				//자원반납
				bos.close();
				bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
