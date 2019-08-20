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

	public List<LikeSNS> selectLikeSNSList(int boardNo) {
		Connection conn=getConnection();
		List<LikeSNS> likeSNSList=new SNSDAO().selectLikeSNSList(conn, boardNo);
		close(conn);
		return likeSNSList;
	}

	public List<CommentSNS> selectCommentSNSList(int boardNo) {
		Connection conn=getConnection();
		List<CommentSNS> commentSNSList=new SNSDAO().selectCommentSNSList(conn, boardNo);
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

	public int updateBoardSNS(int boardNo, BoardSNS boardSNS) {
		Connection conn=getConnection();
		int result=new SNSDAO().updateBoardSNS(conn, boardNo, boardSNS);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public void deleteImageSNS(int boardNo) {
		Connection conn=getConnection();
		int result=new SNSDAO().deleteImageSNS(conn, boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
	}

	public void deleteGrade(int boardNo) {
		Connection conn=getConnection();
		int result=new SNSDAO().deleteGradeSNS(conn, boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
	}

	public List<LikeSNS> insertLikeSNS(String userId, int boardNo) {
		Connection conn=getConnection();
		int result=new SNSDAO().insertLikeSNS(conn, userId, boardNo);
		List<LikeSNS> list = null;
		if(result>0) {
			list = new SNSDAO().selectLikeSNSList(conn, boardNo);
			commit(conn);
		}
		else rollback(conn);
		close(conn);
		return list;
	}

	public List<LikeSNS> deleteLikeSNS(String userId, int boardNo) {
		Connection conn=getConnection();
		int result=new SNSDAO().deleteLikeSNS(conn, userId, boardNo);
		List<LikeSNS> list = null;
		if(result>0) {
			list = new SNSDAO().selectLikeSNSList(conn, boardNo);
			commit(conn);
		}
		else rollback(conn);
		close(conn);
		return list;
	}

	

	public CommentSNS selectCommentSNS(int commentNo) {
		Connection conn=getConnection();
		CommentSNS commentSNS=new SNSDAO().selectCommentSNS(conn, commentNo);
		close(conn);
		return commentSNS;
	}


	public int updateSetting(ProfileSNS ps) {
		Connection conn= getConnection(); 
		int result = new SNSDAO().updateSetting(conn,ps); 
		if(result>0) {
			commit(conn); 
		}else 
			rollback(conn); 
		
		close(conn); 
		
		
		return result;
	}

	public int updateCommentSNS(int commentNo, String commentNickname, String commentProfile, String commentContent) {
		Connection conn= getConnection(); 
		int result = new SNSDAO().updateCommentSNS(conn, commentNo, commentNickname, commentProfile, commentContent); 
		if(result>0) {
			commit(conn); 
		}else 
			rollback(conn); 
		close(conn); 
		
		
		return result;
	}

	public int deleteCommentSNS(int commentNo) {
		Connection conn= getConnection(); 
		int result = new SNSDAO().deleteCommentSNS(conn, commentNo); 
		if(result>0) {
			commit(conn); 
		}else 
			rollback(conn); 
		close(conn); 
		
		
		return result;
	}

	public int insertCommentSNS(CommentSNS commentSNS) {
		Connection conn=getConnection();
		int result=new SNSDAO().insertCommentSNS(conn, commentSNS);
		int commentNo = 0;
		if(result>0) {
			commentNo = new SNSDAO().selectCommentSNSLastSeq(conn); 
			commit(conn);
		}
		else rollback(conn);
		close(conn);
		return commentNo;
	}


	public List<Integer> selectLikeBoardNoList(String mypage) {
		Connection conn=getConnection();
		List<Integer> likeBoardNoList=new SNSDAO().selectLikeBoardNoList(conn, mypage);
		close(conn);
		return likeBoardNoList;
	}
	
	public int updateProfile(User u) {
		Connection conn = getConnection();
		int result = new SNSDAO().updateProfile(conn,u);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	
	public int changetype(User u) {
		Connection conn = getConnection();
		int result = new SNSDAO().changetype(conn,u);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

	public List<Integer> selectBoardNoList(String mypage) {
		Connection conn=getConnection();
		List<Integer> list=new SNSDAO().selectBoardNoList(conn, mypage);
		close(conn);
		return list;
	}

	public List<Integer> selectFollowerBoardNoList(List<String> followerSNSList) {
		Connection conn=getConnection();
		List<Integer> list=new SNSDAO().selectFollowerBoardNoList(conn, followerSNSList);
		close(conn);
		return list;
	}

	public List<Integer> selectFollowLikeBoardNoList(List<String> followerSNSList) {
		Connection conn=getConnection();
		List<Integer> list=new SNSDAO().selectFollowLikeBoardNoList(conn, followerSNSList);
		close(conn);
		return list;
	}

	public List<BoardSNS> selectBoardSNSAll() {
		Connection conn=getConnection();
		List<BoardSNS> list=new SNSDAO().selectBoardSNSAll(conn);
		close(conn);
		return list;
	}

	public List<ProfileSNS> selectProfileSNSAll() {
		Connection conn=getConnection();
		List<ProfileSNS> list=new SNSDAO().selectProfileSNSAll(conn);
		close(conn);
		return list;
	}

	

	
	
}
