package sns.model.service;

import java.sql.Connection;
import java.util.List;

import sns.model.dao.SNSDAO;
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

}