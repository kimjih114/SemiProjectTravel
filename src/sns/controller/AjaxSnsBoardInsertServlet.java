package sns.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.util.MVCRenamePolicy;

/**
 * Servlet implementation class AjaxSnsBoardInsertServlet
 */
@WebServlet("/gson/sns/insertBoard.do")
public class AjaxSnsBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsBoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0.파일업로드 체크 : enctype = "multipart/form-data"
				if(!ServletFileUpload.isMultipartContent(request)) {
					return;
				}
				/*************파일업로드 로직시작*************/
				//new MultipartRequest(request, saveDirectory, maxPostSize, encoding, FilerenamePolicy)
				//a.saveDirectory: 실제파일저장경로(절대경로)
				String root = getServletContext().getRealPath("/");
				//C:\Workspaces\webserver_workspace\03_HelloMVC\WebContent\
				
				String saveDirectory = root + "upload" + File.separator + "board";
				System.out.println("saveDirectory="+saveDirectory);
				
				//b.maxPostSize: 파일최대용량(10mb) - 1kb * 1kb * 10
				int maxPostSize = 1024 * 1024 * 10;
				
				//c.encoding: UTF-8
				String encoding = "UTF-8";
				
				//d.FileRenamePolicy객체: 서버저장용 파일명생성객체
				FileRenamePolicy mvcRenamePolicy = new MVCRenamePolicy();
				
				MultipartRequest mReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, mvcRenamePolicy);
				
				/*************파일업로드 로직끝*************/
				
				//1. 파라미터 : MultipartRequest객체 생성 후에는
				//더이상 HttpServletRequest객체로부터 사용자입력값을 가져올 수없다.
				String boardTitle = mReq.getParameter("boardTitle");
				String boardWriter = mReq.getParameter("boardWriter");
			
				String renamedFileName = mReq.getFilesystemName("upFile");
				String originalFileName = mReq.getOriginalFileName("upFile");
				
				//Secure-Coding
				//XSS Cross-site Scripting
				//사용자 작성 내용이 필터링 없이 db에 저장될 경우
				//개인정보 탈취 및 보안상 여러 위험을 야기할 수 있다.
				String boardContent = mReq.getParameter("boardContent");
				boardContent = boardContent.replace("<", "&lt;")
										   .replace(">", "&gt;");
				
				Board board = new Board();
				
				board.setBoardTitle(boardTitle);
				board.setBoardWriter(boardWriter);
				board.setBoardContent(boardContent);
				board.setOriginalFileName(originalFileName);
				board.setRenamedFileName(renamedFileName);
				
				//2.업무로직
				int boardNo = new BoardService().insertBoard(board);
				String msg = "";
				String loc = "/board/boardList";
				
				if(boardNo>0) {
					msg = "게시물 등록 성공!";
					loc = "/board/boardView?boardNo="+boardNo;
				}
				else {
					msg = "게시물 등록 실패!";
				}
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
