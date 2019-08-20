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
import sns.model.vo.CommentSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;
import sns.model.vo.LikeSNS;
import sns.model.vo.ProfileSNS;
import sns.model.vo.TotalSNS;

/**
 * Servlet implementation class AjaxSnsMyLikeListServlet
 */
@WebServlet("/gson/sns/myLikeSNSList.do")
public class AjaxSnsBoardMyLikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsBoardMyLikeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		//1.parameter
				String mypage = request.getParameter("mypage");
				final int numPerPage = 5;
				int cnt = Integer.parseInt(request.getParameter("cnt"));

								
				//2.업무로직
				
				//내가 좋아요 누른 번호 골라내기
				List<Integer> likeBoardNoList = new SNSService().selectLikeBoardNoList(mypage);
				
				int totalContents = likeBoardNoList.size();
				int totalPages = (int)Math.ceil(totalContents/(numPerPage*1.0));
				
				
				BoardSNS boardSNS = null;
				ProfileSNS profileSNS = null;
				List<ImageSNS> imageSNSList = null;
				List<GradeSNS> gradeSNSList = null;
				List<CommentSNS> commentSNSList = null;
				List<LikeSNS> likeSNSList = null;
				List<String> followerOneList = null;
				List<String> blockingSNSList = null;
				List<String> blockedSNSList = null;
				
				List<TotalSNS> totalSNSList = new ArrayList<>();
				List<TotalSNS> result = new ArrayList<>();
				
				
				if(likeBoardNoList!=null) {
					for(int ln : likeBoardNoList) {
							boardSNS = new SNSService().selectBoardSNS(ln);
					
							profileSNS = new SNSService().selectOneProfile(boardSNS.getBoardWriter());
							
							imageSNSList = new SNSService().selectImageSNS(boardSNS.getBoardNo());
							
							gradeSNSList = new SNSService().selectGradeSNS(boardSNS.getBoardNo());
							
							commentSNSList = new SNSService().selectCommentSNSList(boardSNS.getBoardNo());
							
							likeSNSList = new SNSService().selectLikeSNSList(boardSNS.getBoardNo());
							
							followerOneList = new SNSService().selectOneIdFollower(boardSNS.getBoardWriter(), new SNSService().selectOneIdFollow(boardSNS.getBoardWriter()));
							
							blockingSNSList = new SNSService().selectOneIdBlock(boardSNS.getBoardWriter());
	
							blockedSNSList = new SNSService().selectOneIdBlocked(boardSNS.getBoardWriter());
							
							TotalSNS totalSNS = new TotalSNS(boardSNS, profileSNS, imageSNSList, gradeSNSList, commentSNSList, likeSNSList, followerOneList, blockingSNSList, blockedSNSList);
							
							totalSNSList.add(totalSNS);
					}
				}
				
				if(cnt<totalPages) {
					int idx = 0;
					for(int i=(cnt-1)*5; i<cnt*5; i++) {
						result.add(idx, totalSNSList.get(i));
						idx++;
					}
				} else if (cnt==totalPages) {
					int idx = 0;
					for(int i=(cnt-1)*5; i<totalContents; i++) {
						result.add(idx, totalSNSList.get(i));
						idx++;
					}
				}
			
				
				//3.view단처리
				response.setContentType("application/json; charset=utf-8");
				new Gson().toJson(totalSNSList, response.getWriter());
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
