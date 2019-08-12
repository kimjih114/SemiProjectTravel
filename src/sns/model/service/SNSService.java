package sns.model.service;

import java.sql.Connection;
import java.util.List;
import sns.model.dao.SNSDAO;
import sns.model.vo.BoardSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;
import sns.model.vo.ProfileSNS;
import user.model.vo.User;

import static common.JDBCTemplate.*;

public class SNSService {

	public List<String> friendIdSearch(String userId, String searchId) {
		Connection conn=getConnection();
		List<String> friendId=new SNSDAO().friendIdSearch(conn,userId,searchId);
		close(conn);
		return friendId;
	}

	public ProfileSNS selectOneProfile(User userLoggedIn) {
		Connection conn=getConnection();
		ProfileSNS profileSNS=new SNSDAO().selectOneProfile(conn, userLoggedIn);
		close(conn);
		return profileSNS;
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

	public int addFollow(String userFollowing, String userFollowed) {
		Connection conn=getConnection();
		int result=new SNSDAO().addFollow(conn, userFollowing, userFollowed);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
