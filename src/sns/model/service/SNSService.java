package sns.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import sns.model.dao.SNSDAO;
import sns.model.vo.BoardSNS;
import sns.model.vo.CommentSNS;
import sns.model.vo.FollowSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;
import sns.model.vo.LikeSNS;
import sns.model.vo.ProfileSNS;
import user.model.vo.User;

public class SNSService {

	public List<String> friendIdSearch(String userId, String searchId) {
		Connection conn=getConnection();
		List<String> friendId=new SNSDAO().friendIdSearch(conn,userId,searchId);
		close(conn);
		return friendId;
	}

	public ProfileSNS selectOneProfile(String userId) {
		Connection conn=getConnection();
		ProfileSNS profileSNS=new SNSDAO().selectOneProfile(conn, userId);
		close(conn);
		return profileSNS;
	}

	public int updateHeaderText(String userId, String headerText) {
		Connection conn=getConnection();
		int result=new SNSDAO().updateHeaderText(conn, userId, headerText);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateNickName(String userId, String nickname) {
		Connection conn=getConnection();
		int result=new SNSDAO().updateNickName(conn, userId, nickname);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateIntro(String userId, String intro) {
		Connection conn=getConnection();
		int result=new SNSDAO().updateIntro(conn, userId, intro);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertBoardSNS(BoardSNS boardSNS) {
		Connection conn=getConnection();
		int boardNo = 0;
		int result=new SNSDAO().insertBoardSNS(conn, boardSNS);
		if(result>0) {
			boardNo = new SNSDAO().selectBoardSNSLastSeq(conn);
			commit(conn);
		}
		else rollback(conn);
		close(conn);
		
		return boardNo;
	}

	public int insertImage(List<ImageSNS> imageSNSList) {
		Connection conn=getConnection();
		int result=new SNSDAO().insertImage(conn, imageSNSList);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertGrade(List<GradeSNS> gradeSNSList) {
		Connection conn=getConnection();
		int result=new SNSDAO().insertGrade(conn, gradeSNSList);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int follow(String userFollowing, String userFollowed) {
		Connection conn=getConnection();
		int result=new SNSDAO().follow(conn, userFollowing, userFollowed);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int unFollow(String userFollowing, String userFollowed) {
		Connection conn=getConnection();
		int result=new SNSDAO().unFollow(conn, userFollowing, userFollowed);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<String> selectOneIdFollow(String userFollowing){
		Connection conn=getConnection();
		List<String> followOneList=new SNSDAO().selectOneIdFollow(conn, userFollowing);
		close(conn);
		return followOneList;
		
	}

	public List<ProfileSNS> selectOneProfileFollow(List<String> followOneList) {
		Connection conn=getConnection();
		List<ProfileSNS> followProfileList=new SNSDAO().selectOneProfileFollow(conn, followOneList);
		close(conn);
		return followProfileList;
	}

	public List<String> selectOneIdFollower(String userfollowed, List<String> followOneList) {
		Connection conn=getConnection();
		List<String> followedOneList=new SNSDAO().selectOneIdFollower(conn, userfollowed, followOneList);
		close(conn);
		return followedOneList;
	}

	public List<String> selectOneIdFollowed(String userLoggedIn) {
		Connection conn=getConnection();
		List<String> followedOneList=new SNSDAO().selectOneIdFollowed(conn, userLoggedIn);
		close(conn);
		return followedOneList;
	}

	public int selectBoardSNSCnt(String userId) {
		Connection conn=getConnection();
		int totalContents=new SNSDAO().selectBoardSNSCnt(conn, userId);
		close(conn);
		return totalContents;
	}

	public List<BoardSNS> selectBoardSNSMore(String mypage, int boardNo, int numPerPage) {
		Connection conn = getConnection();
		List<BoardSNS> list = new SNSDAO().selectBoardSNSMore(conn, mypage, boardNo, numPerPage);
		close(conn);
		return list;
	}

	public List<ImageSNS> selectImageSNS(int boardNo) {
		Connection conn = getConnection();
		List<ImageSNS> list = new SNSDAO().selectImageSNS(conn, boardNo);
		close(conn);
		return list;
	}

	public List<GradeSNS> selectGradeSNS(int boardNo) {
		Connection conn = getConnection();
		List<GradeSNS> list = new SNSDAO().selectGradeSNS(conn, boardNo);
		close(conn);
		return list;
	}

	public int block(String userBlocking, String userBlocked) {
		Connection conn=getConnection();
		int result=new SNSDAO().block(conn, userBlocking, userBlocked);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<String> selectOneIdBlock(String userBlocking) {
		Connection conn=getConnection();
		List<String> blockOneList=new SNSDAO().selectOneIdBlock(conn, userBlocking);
		close(conn);
		return blockOneList;
	}

	public int unblock(String userBlocking, String userBlocked) {
		Connection conn=getConnection();
		int result=new SNSDAO().unblock(conn, userBlocking, userBlocked);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<LikeSNS> selectLikeSNS(int boardNo) {
		Connection conn=getConnection();
		List<LikeSNS> likeSNSList=new SNSDAO().selectLikeSNS(conn, boardNo);
		close(conn);
		return likeSNSList;
	}

	public List<CommentSNS> selectCommentSNS(int boardNo) {
		Connection conn=getConnection();
		List<CommentSNS> commentSNSList=new SNSDAO().selectCommentSNS(conn, boardNo);
		close(conn);
		return commentSNSList;
	}

	public List<String> selectOneIdBlocked(String userBlocked) {
		Connection conn=getConnection();
		List<String> blocedkOneList=new SNSDAO().selectOneIdBlocked(conn, userBlocked);
		close(conn);
		return blocedkOneList;
	}

	public int selectLastBoardNo(String userId) {
		Connection conn = getConnection();
		int result = new SNSDAO().selectLastBoardNo(conn, userId);
		close(conn);
		return result;
	}

	public int deleteBoardSNS(int boardNo) {
		Connection conn=getConnection();
		int result=new SNSDAO().deleteBoardSNS(conn, boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<String> selectRenamedFileNames(int boardNo) {
		Connection conn=getConnection();
		List<String> list =new SNSDAO().selectRenamedFileNames(conn, boardNo);
		close(conn);
		return list;
	}

	public BoardSNS selectBoardSNS(int boardNo) {
		Connection conn=getConnection();
		BoardSNS boardSNS=new SNSDAO().selectBoardSNS(conn, boardNo);
		close(conn);
		return boardSNS;
	}

	
	
}
