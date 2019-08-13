package sns.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;
import sns.model.vo.BoardSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;
import sns.model.vo.ProfileSNS;

/**
 * Servlet implementation class AjaxMyBoardSNSListServlet
 */
@WebServlet("/gson/sns/myBoardSNSList.do")
public class AjaxMyBoardSNSListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMyBoardSNSListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.parameter
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		int numPerPage = 5+cPage;
						
		//2.업무로직
		List<BoardSNS> boardSNSList = new SNSService().selectBoardSNSMore(cPage, numPerPage);
		List<BoardSNS> boardSNSResultList = new ArrayList<>();
		if(boardSNSList!=null) {
			for(BoardSNS bs : boardSNSList) {
				ProfileSNS profileSNS = new SNSService().selectOneProfile(bs.getBoardWriter());
				
				List<ImageSNS> imageList = new SNSService().selectImageSNS(bs.getBoardNo());
				
				ImageSNS imageSNS1 = null;
				ImageSNS imageSNS2 = null;
				ImageSNS imageSNS3 = null;
				ImageSNS imageSNS4 = null;
				ImageSNS imageSNS5 = null;
				
				if(imageList!=null) {
				if(imageList.size()>0) {
					imageSNS1 = imageList.get(0);
				}
				if(imageList.size()>1) {
					imageSNS2 = imageList.get(1);
				}
				if(imageList.size()>2) {
					imageSNS3 = imageList.get(2);
				}
				if(imageList.size()>3) {
					imageSNS4 = imageList.get(3);
				}
				if(imageList.size()>4) {
					imageSNS5 = imageList.get(4);
				}
				}
				
				List<GradeSNS> gradeList = new SNSService().selectGradeSNS(bs.getBoardNo());
				
				GradeSNS gradeSNS1 = null;
				GradeSNS gradeSNS2 = null;
				GradeSNS gradeSNS3 = null;
				if(gradeList!=null) {
					if(gradeList.size()>0) {
						gradeSNS1 = gradeList.get(0);
					}
					if(gradeList.size()>1) {
						gradeSNS2 = gradeList.get(1);
					}
					if(gradeList.size()>2) {
						gradeSNS3 = gradeList.get(2);
					}
					
				}
				
				bs.setProfileSNS(profileSNS);
				bs.setImageSNS1(imageSNS1);
				bs.setImageSNS2(imageSNS2);
				bs.setImageSNS3(imageSNS3);
				bs.setImageSNS4(imageSNS4);
				bs.setImageSNS5(imageSNS5);
				bs.setGradeSNS1(gradeSNS1);
				bs.setGradeSNS2(gradeSNS2);
				bs.setGradeSNS3(gradeSNS3);
				
				boardSNSResultList.add(bs);
				
			}
		}
		
	
		
		//3.view단처리
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(boardSNSResultList, response.getWriter());
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
