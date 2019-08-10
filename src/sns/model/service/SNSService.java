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

}
