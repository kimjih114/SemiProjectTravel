package sns.model.service;

import java.sql.Connection;
import java.util.List;

import sns.model.dao.SNSDAO;

import static common.JDBCTemplate.*;

public class SNSService {

	public List<String> friendIdSearch(String userId, String searchId) {
		Connection conn=getConnection();
		List<String> friendId=new SNSDAO().friendIdSearch(conn,userId,searchId);
		close(conn);
		return friendId;
	}

}
