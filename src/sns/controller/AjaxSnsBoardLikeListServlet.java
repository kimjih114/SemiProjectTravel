package sns.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sns.model.service.SNSService;
import sns.model.vo.BoardSNS;
import sns.model.vo.CommentSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;
import sns.model.vo.LikeSNS;
import sns.model.vo.ProfileSNS;
import sns.model.vo.TotalSNS;

/**
 * Servlet implementation class AjaxSnsBoardLikeListServlet
 */
@WebServlet("/gson/sns/myLikeList.do")
public class AjaxSnsBoardLikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsBoardLikeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.parameter
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				int numPerPage = 5;
				String mypage = request.getParameter("mypage");
								
				//2.업무로직
				List<BoardSNS> boardSNSList = new SNSService().selectBoardSNSMore(mypage, boardNo, numPerPage);
				
				ProfileSNS profileSNS = null;
				List<ImageSNS> imageSNSList = null;
				List<GradeSNS> gradeSNSList = null;
				List<CommentSNS> commentSNSList = null;
				List<LikeSNS> likeSNSList = null;
				List<String> followerOneList = null;
				List<String> blockingSNSList = null;
				List<String> blockedSNSList = null;
				
				List<TotalSNS> totalSNSList = new ArrayList<>();
				
				if(boardSNSList!=null) {
					for(BoardSNS bs : boardSNSList) {
						
						profileSNS = new SNSService().selectOneProfile(bs.getBoardWriter());
						
						imageSNSList = new SNSService().selectImageSNS(bs.getBoardNo());
						
						gradeSNSList = new SNSService().selectGradeSNS(bs.getBoardNo());
						
						commentSNSList = new SNSService().selectCommentSNSList(bs.getBoardNo());
						
						likeSNSList = new SNSService().selectLikeSNSList(bs.getBoardNo());
						
						followerOneList = new SNSService().selectOneIdFollower(bs.getBoardWriter(), new SNSService().selectOneIdFollow(bs.getBoardWriter()));
						
						blockingSNSList = new SNSService().selectOneIdBlock(bs.getBoardWriter());

						blockedSNSList = new SNSService().selectOneIdBlocked(bs.getBoardWriter());
						
						TotalSNS totalSNS = new TotalSNS(bs, profileSNS, imageSNSList, gradeSNSList, commentSNSList, likeSNSList, followerOneList, blockingSNSList, blockedSNSList);
						
						totalSNSList.add(totalSNS);
					}
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