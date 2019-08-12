package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import user.model.vo.User;


public class AdminService {

	public List<User> selectUserList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<User> list 
			= new AdminDAO().selectUserList(conn,cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectTotalContents() {
		Connection conn = getConnection();
		int totalContents = new AdminDAO().selecTotalContents(conn);
		close(conn);
		return totalContents;
	}

}
