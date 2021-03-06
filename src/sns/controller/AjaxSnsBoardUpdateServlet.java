package sns.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.util.MVCRenamePolicy;
import sns.model.service.SNSService;
import sns.model.vo.BoardSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;

/**
 * Servlet implementation class AjaxSnsBoardModifyServlet
 */
@WebServlet("/gson/sns/updateBoardSNS.do")
public class AjaxSnsBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0.파일업로드 체크 : enctype = "multipart/form-data"
				if (!ServletFileUpload.isMultipartContent(request)) {
					return;
				}
				/************* 파일업로드 로직시작 *************/
				// new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
				// FilerenamePolicy)
				// a.saveDirectory: 실제파일저장경로(절대경로)
				String root = getServletContext().getRealPath("/");
				// C:\Workspaces\webserver_workspace\03_HelloMVC\WebContent\

				String saveDirectory = root + "upload" + File.separator + "board";
				System.out.println("saveDirectory=" + saveDirectory);

				// b.maxPostSize: 파일최대용량(10mb) - 1kb * 1kb * 10
				int maxPostSize = 1024 * 1024 * 10;

				// c.encoding: UTF-8
				String encoding = "UTF-8";

				// d.FileRenamePolicy객체: 서버저장용 파일명생성객체
				FileRenamePolicy mvcRenamePolicy = new MVCRenamePolicy();

				MultipartRequest mReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, mvcRenamePolicy);

				/************* 파일업로드 로직끝 *************/

				// 1. 파라미터 : MultipartRequest객체 생성 후에는
				// 더이상 HttpServletRequest객체로부터 사용자입력값을 가져올 수없다.
				int boardNo = Integer.parseInt(mReq.getParameter("boardNo"));
				String boardWriter = mReq.getParameter("boardWriter");
				String boardContent = mReq.getParameter("boardContent");
				boardContent = boardContent.replace("<", "&lt;").replace(">", "&gt;");
				String boardType = mReq.getParameter("boardType");

				BoardSNS boardSNS = new BoardSNS();

				boardSNS.setBoardWriter(boardWriter);
				boardSNS.setBoardContent(boardContent);
				boardSNS.setBoardType(boardType);
				
				String contentId1 = null;
				String contentId2 = null;
				String contentId3 = null;

				String contentType1 = null;
				String contentType2 = null;
				String contentType3 = null;
				
				String contentThumbnail1 = null;
				String contentThumbnail2 = null;
				String contentThumbnail3 = null;
				
				String contentTitle1 = null;
				String contentTitle2 = null;
				String contentTitle3 = null;
				
				String contentAddress1 = null;
				String contentAddress2 = null;
				String contentAddress3 = null;

				int grade1 = 0;
				int grade2 = 0;
				int grade3 = 0;

				contentId1 = !"undefined".equals(mReq.getParameter("contentId1")) ? mReq.getParameter("contentId1") : null;
				contentId2 = !"undefined".equals(mReq.getParameter("contentId2")) ? mReq.getParameter("contentId2") : null;
				contentId3 = !"undefined".equals(mReq.getParameter("contentId3")) ? mReq.getParameter("contentId3") : null;

//				System.out.println("contentId1=" + contentId1);
//				System.out.println("contentId2=" + contentId2);
//				System.out.println("contentId3=" + contentId3);

				contentType1 = !"undefined".equals(mReq.getParameter("contentType1")) ? mReq.getParameter("contentType1")
						: null;
				contentType2 = !"undefined".equals(mReq.getParameter("contentType2")) ? mReq.getParameter("contentType2")
						: null;
				contentType3 = !"undefined".equals(mReq.getParameter("contentType3")) ? mReq.getParameter("contentType3")
						: null;

//				System.out.println("contentType1=" + contentType1);
//				System.out.println("contentType2=" + contentType2);
//				System.out.println("contentType3=" + contentType3);
				
				contentThumbnail1 = !"undefined".equals(mReq.getParameter("contentThumbnail1")) ? mReq.getParameter("contentThumbnail1")
						: null;
				contentThumbnail2 = !"undefined".equals(mReq.getParameter("contentThumbnail2")) ? mReq.getParameter("contentThumbnail2")
						: null;
				contentThumbnail3 = !"undefined".equals(mReq.getParameter("contentThumbnail3")) ? mReq.getParameter("contentThumbnail3")
						: null;

//				System.out.println("contentThumbnail1=" + contentType1);
//				System.out.println("contentThumbnail2=" + contentType2);
//				System.out.println("contentThumbnail3=" + contentType3);
				
				contentTitle1 = !"undefined".equals(mReq.getParameter("contentTitle1")) ? mReq.getParameter("contentTitle1")
						: null;
				contentTitle2 = !"undefined".equals(mReq.getParameter("contentTitle2")) ? mReq.getParameter("contentTitle2")
						: null;
				contentTitle3 = !"undefined".equals(mReq.getParameter("contentTitle3")) ? mReq.getParameter("contentTitle3")
						: null;
				
//				System.out.println("contentTitle1=" + contentType1);
//				System.out.println("contentTitle2=" + contentType2);
//				System.out.println("contentTitle3=" + contentType3);
				
				contentAddress1 = !"undefined".equals(mReq.getParameter("contentAddress1")) ? mReq.getParameter("contentAddress1")
						: null;
				contentAddress2 = !"undefined".equals(mReq.getParameter("contentAddress2")) ? mReq.getParameter("contentAddress2")
						: null;
				contentAddress3 = !"undefined".equals(mReq.getParameter("contentAddress3")) ? mReq.getParameter("contentAddress3")
						: null;
				
//				System.out.println("contentAddress1=" + contentType1);
//				System.out.println("contentAddress2=" + contentType2);
//				System.out.println("contentAddress3=" + contentType3);
				
				grade1 = !"undefined".equals(mReq.getParameter("grade1")) ? Integer.parseInt(mReq.getParameter("grade1")) : 0;
				grade2 = !"undefined".equals(mReq.getParameter("grade2")) ? Integer.parseInt(mReq.getParameter("grade2")) : 0;
				grade3 = !"undefined".equals(mReq.getParameter("grade3")) ? Integer.parseInt(mReq.getParameter("grade3")) : 0;

//				System.out.println("grade1=" + grade1);
//				System.out.println("grade2=" + grade2);
//				System.out.println("grade3=" + grade3);

				String originalFileName1 = mReq.getOriginalFileName("file1") != null ? mReq.getOriginalFileName("file1") : null;
				String renamedFileName1 = mReq.getFilesystemName("file1") != null ? mReq.getFilesystemName("file1") : null;
				String originalFileName2 = mReq.getOriginalFileName("file2") != null ? mReq.getOriginalFileName("file2") : null;
				String renamedFileName2 = mReq.getFilesystemName("file2") != null ? mReq.getFilesystemName("file2") : null;
				String originalFileName3 = mReq.getOriginalFileName("file3") != null ? mReq.getOriginalFileName("file3") : null;
				String renamedFileName3 = mReq.getFilesystemName("file3") != null ? mReq.getFilesystemName("file3") : null;
				String originalFileName4 = mReq.getOriginalFileName("file4") != null ? mReq.getOriginalFileName("file4") : null;
				String renamedFileName4 = mReq.getFilesystemName("file4") != null ? mReq.getFilesystemName("file4") : null;
				String originalFileName5 = mReq.getOriginalFileName("file5") != null ? mReq.getOriginalFileName("file5") : null;
				String renamedFileName5 = mReq.getFilesystemName("file5") != null ? mReq.getFilesystemName("file5") : null;
				String oldFileName1 =  mReq.getParameter("oldname1") != null? mReq.getParameter("oldname1") : null;
				String oldFileName2 =  mReq.getParameter("oldname2") != null? mReq.getParameter("oldname2") : null;
				String oldFileName3 =  mReq.getParameter("oldname3") != null? mReq.getParameter("oldname3") : null;
				String oldFileName4 =  mReq.getParameter("oldname4") != null? mReq.getParameter("oldname4") : null;
				String oldFileName5 =  mReq.getParameter("oldname5") != null? mReq.getParameter("oldname5") : null;
				
				File f1 = mReq.getFile("file1");
				//1. 전송된 파일이 있는 경우
				if(f1!=null && f1.length()>0) {
					new SNSService().deleteImageSNS(boardNo);
					
					if(mReq.getParameter("oldname1") != null) {
						File delFile = new File(saveDirectory+File.separator+mReq.getParameter("oldname1"));
						boolean bool = delFile.delete();
					}
					if(mReq.getParameter("oldname2") != null) {
						File delFile = new File(saveDirectory+File.separator+mReq.getParameter("oldname2"));
						boolean bool = delFile.delete();
					}
					if(mReq.getParameter("oldname3") != null) {
						File delFile = new File(saveDirectory+File.separator+mReq.getParameter("oldname3"));
						boolean bool = delFile.delete();
					}
					if(mReq.getParameter("oldname4") != null) {
						File delFile = new File(saveDirectory+File.separator+mReq.getParameter("oldname4"));
						boolean bool = delFile.delete();
					}
					if(mReq.getParameter("oldname5") != null) {
						File delFile = new File(saveDirectory+File.separator+mReq.getParameter("oldname5"));
						boolean bool = delFile.delete();
					}
				}
				//2. 기존 첨부파일을 삭제하려는 경우
				else if(mReq.getParameter("delFile") != null) {
					//기존파일이 있다면 삭제
					File delFile = new File(saveDirectory+File.separator+mReq.getParameter("oldRName"));
					delFile.delete();		
					System.out.println("이거 맞잖");
					new SNSService().deleteImageSNS(boardNo);
				}
				//3. 첨부한 파일이 없는 경우
				else {
					//기존파일명을 다시 대입
					if(mReq.getParameter("oldname1") != null) {
						originalFileName1 = oldFileName1;
					}
					if(mReq.getParameter("oldname2") != null) {
						originalFileName2 = oldFileName2;
					}
					if(mReq.getParameter("oldname3") != null) {
						originalFileName3 = oldFileName3;
					}
					if(mReq.getParameter("oldname4") != null) {
						originalFileName4 = oldFileName4;
					}
					if(mReq.getParameter("oldname5") != null) {
						originalFileName5 = oldFileName5;
					}
				}
				
				int result = new SNSService().updateBoardSNS(boardNo ,boardSNS);

				if(result>0) {
					List<ImageSNS> imageSNSList = new ArrayList<>();
					List<GradeSNS> gradeSNSList = new ArrayList<>();
					
					if(originalFileName1!=null && originalFileName1 != oldFileName1) {
						imageSNSList.add(new ImageSNS(boardNo, boardWriter, originalFileName1,renamedFileName1, 1, null));
					}
					if(originalFileName2!=null && originalFileName2 != oldFileName2) {
						imageSNSList.add(new ImageSNS(boardNo, boardWriter, originalFileName2,renamedFileName2, 2, null));
					}
					if(originalFileName3!=null && originalFileName3 != oldFileName3) {
						imageSNSList.add(new ImageSNS(boardNo, boardWriter, originalFileName3,renamedFileName3, 3, null));
					}
					if(originalFileName4!=null && originalFileName4 != oldFileName4) {
						imageSNSList.add(new ImageSNS(boardNo, boardWriter, originalFileName4,renamedFileName4, 4, null));
					}
					if(originalFileName5!=null && originalFileName5 != oldFileName5) {
						imageSNSList.add(new ImageSNS(boardNo, boardWriter, originalFileName5,renamedFileName5, 5, null));
					}
					if(imageSNSList!=null) {
						new SNSService().insertImage(imageSNSList);
					}					
					if(contentId1!=null) {
						gradeSNSList.add(new GradeSNS(boardNo, boardWriter, contentId1, contentType1, contentThumbnail1, contentTitle1, contentAddress1, grade1, 1,  null));
					}
					if(contentId2!=null) {
						gradeSNSList.add(new GradeSNS(boardNo, boardWriter, contentId2, contentType2, contentThumbnail2, contentTitle2, contentAddress2, grade2, 2, null));
					}
					if(contentId3!=null) {
						gradeSNSList.add(new GradeSNS(boardNo, boardWriter, contentId3, contentType3, contentThumbnail3, contentTitle3, contentAddress3, grade3, 3, null));
					}

					if(gradeSNSList!=null) {
						new SNSService().deleteGrade(boardNo);
						new SNSService().insertGrade(gradeSNSList);
					}
				}
				 
					new Gson().toJson(boardNo, response.getWriter());
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
