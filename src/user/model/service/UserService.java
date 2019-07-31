package user.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import user.model.dao.UserDAO;
import user.model.vo.User;

public class UserService {

	public static final int LOGIN_OK = 1;
	public static final int WRONG_PASSWORD = 0;
	public static final int ID_NOT_EXIST = -1;
	
	public int loginCheck(User user) {
		Connection conn =getConnection();
		int result = new UserDAO().loginCheck(conn,user);
		return result;
	}

	public User selectOne(String userId) {
		Connection conn =getConnection();
		User u = new UserDAO().selectOne(conn, userId); 
		close(conn);
		
		
		return u;
	}

}
