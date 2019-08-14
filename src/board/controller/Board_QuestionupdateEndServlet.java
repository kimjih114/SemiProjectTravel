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
 * Servlet implementation class Board_QuestionupdateEndServlet
 */
@WebServlet("/board/qboardUpdateEnd")
public class Board_QuestionupdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board_QuestionupdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판작성오류![form:enctype 관리자에게 문의하세요.");
			request.setAttribute("loc", "/"); //여기 링크    
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		String root= getServletContext().getRealPath("/"); 
		String saveDirectory = root +"upload"+File.separator+"board"; 
		
		System.out.println("saveDirectory="+saveDirectory);
		
		int maxPostSize = 1024*1024*10; 
		
		FileRenamePolicy  policy = new MVCRenamePolicy(); 
		
		MultipartRequest mReq = new MultipartRequest(request, saveDirectory,maxPostSize,"UTF-8",policy); 
		
		int qboardNo = Integer.parseInt(mReq.getParameter("qboardNo")); 
		String qboardTitle = mReq.getParameter("qboardTitle"); 
		String qboardWriter = mReq.getParameter("qboardWriter"); 
		String qboardContent = mReq.getParameter("qboardContent"); 
		
		String newfileName= mReq.getFilesystemName("upFile"); 
		String fileName= mReq.getOriginalFileName("upFile"); 
		
		String oldOName = mReq.getParameter("oldOName");
		String oldRName = mReq.getParameter("oldRName");
		
		
		//기존에 첨부한 파일이 있다면, 후처리작업
				if(!"".equals(oldOName)) {
					System.out.println("******* 기존 첨부파일이 있는 경우, 후처리 ********");
					
					
					//업로드된 파일에 대한 객체생성
					File f = mReq.getFile("upFile");
					
					//1.전송된 파일이 있는 경우
					if(f!=null && f.length()>0) {
						//기존파일이 있다면, 삭제
						File delFile 
							= new File(saveDirectory+"/"+mReq.getParameter("oldRName"));
						boolean bool = delFile.delete();
						System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
						
					}
					//2.기존첨부파일을 삭제하려는 경우
					else if(mReq.getParameter("delFile") != null){
						//기존파일이 삭제
						//기존파일이 있다면, 삭제
						File delFile 
							= new File(saveDirectory+"/"+mReq.getParameter("oldRName"));
						boolean bool = delFile.delete();
						System.out.println(bool?"파일 삭제 성공":"파일 삭제 실패");
						
					}
					//3.첨부한 파일이 없는 경우
					else {
						//기존파일명을 다시 대입
						fileName = oldOName;
						newfileName = oldRName;
					}
				}
				
				
				Board_Question bq = new Board_Question(); 
				
				bq.setQboardNo(qboardNo);
				bq.setQboardTitle(qboardTitle);
				bq.setQboardWriter(qboardWriter);
				bq.setQboardContent(qboardContent);
				bq.setQboardFileName(fileName);
				bq.setQboardNewFileName(newfileName);
				
				
				int result = new Board_QuestionService().updateqBoard(bq); 
				
				String view = "/WEB-INF/views/common/msg.jsp"; 
				String msg = ""; 
				String loc = "/ajax/board_questionList";   ///   이것도 경로         <%=request.getContextPath()%>/dfsfddf;    
				
				if(result>0) {
					msg="게시글 수정 성공"; 
					loc = "/board/qboardView?qboardNo="+qboardNo;
				}else {
					msg="게시글 수정 실패"; 
				}
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher(view).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
