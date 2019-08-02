package user.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import user.model.dao.UserDAO;
import user.model.vo.User;

public class UserService {

	public static final int LOGIN_OK = 1;  //로그인 성공
	public static final int WRONG_PASSWORD = 0; //패스워드 잘못침 
	public static final int ID_NOT_EXIST = -1; //존재하지 않는 아이디 
	
	public int loginCheck(User user) {
		Connection conn =getConnection();
		int result = new UserDAO().loginCheck(conn,user);
		close(conn);
		return result;
	}

	public User selectOne(String userId) {
		Connection conn =getConnection();
		User u = new UserDAO().selectOne(conn, userId); 
		close(conn);
		System.out.println("service@u="+u);
		
		return u;
	}

}
