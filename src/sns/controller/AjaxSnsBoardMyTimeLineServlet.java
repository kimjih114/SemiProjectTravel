package sns.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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
 * Servlet implementation class AjaxSnsBoardMyTimeLineServlet
 */
@WebServlet("/gson/sns/myTimeLine.do")
public class AjaxSnsBoardMyTimeLineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsBoardMyTimeLineServlet() {
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
		
		//내가 쓴글번호
		List<Integer> boardNoList = new SNSService().selectBoardNoList(mypage);
		//System.out.println("내가쓴글번호:"+boardNoList);
		
		//팔로우가 쓴글번호 
		List<String> followerSNSList = new SNSService().selectOneIdFollower(mypage, new SNSService().selectOneIdFollow(mypage));
		List<Integer> followerBoardNoList = new SNSService().selectFollowerBoardNoList(followerSNSList);
		
		//System.out.println("팔로워가쓴글번호:"+followerBoardNoList);
		
		List<Integer> tempList = new ArrayList<>();
		tempList.addAll(boardNoList);
		tempList.addAll(followerBoardNoList);
		
	//내가 좋아요 누른 글 번호
		List<Integer> likeBoardNoList = new SNSService().selectLikeBoardNoList(mypage);
		//System.out.println("좋아요:"+likeBoardNoList );
		for(Integer lb : likeBoardNoList) {
			if(!tempList.contains(lb)) {
				tempList.add(lb);
			}
		}
		
		//필로우가 좋아요 누른 글번호
		List<Integer> followerLikeBoardNoList = new SNSService().selectFollowLikeBoardNoList(followerSNSList);
		//System.out.println("팔로워의 좋아요:"+followerLikeBoardNoList );
		for(Integer fb : followerLikeBoardNoList) {
			if(!tempList.contains(fb)) {
				tempList.add(fb);
			}
		}

		int totalContents = tempList.size();
		//System.out.println(totalContents);
		int totalPages = (int)Math.ceil(totalContents/(numPerPage*1.0));
		//System.out.println(totalPages);
		
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
		if(tempList!=null) {
			for(int ln : tempList) {
		
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
		new Gson().toJson(result, response.getWriter());
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
