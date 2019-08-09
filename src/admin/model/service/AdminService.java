package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import user.model.vo.User;


public class AdminService {

	public List<User> selectMemberList() {
		Connection conn = getConnection();
		List<User> list 
			= new AdminDAO().selectMemberList(conn);
		close(conn);
		return list;
	}

	public int selecTotalContents() {
		Connection conn = getConnection();
		int totalContents = new AdminDAO().selecTotalContents(conn);
		close(conn);
		return totalContents;
	}

}
