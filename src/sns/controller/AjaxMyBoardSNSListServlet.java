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
				
				bs.setProfileSNS(profileSNS);
				
				List<ImageSNS> imageSNSList = new SNSService().selectImageSNS(bs.getBoardNo());
				
				bs.setImageSNSList(imageSNSList);
	
				
				List<GradeSNS> gradeSNSList = new SNSService().selectGradeSNS(bs.getBoardNo());
				
				bs.setGrandeSNSList(gradeSNSList);
				
				
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
