package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import admin.model.vo.AdminRoom;
import admin.model.vo.RoomImage;
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

	public List<User> selectUserByUserId(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<User> list = new AdminDAO().selectUserByUserId(conn,searchKeyword,cPage,numPerPage);
		close(conn);
		return list;
	}

	public List<User> selectUserByUserName(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<User> list = new AdminDAO().selectUSerByUserName(conn,searchKeyword, cPage, numPerPage);
		return list;
	}

	public List<User> selectUSerByUserPhone(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<User> list = new AdminDAO().selectUSerByUserPhone(conn, searchKeyword, cPage,numPerPage);
		
		return list;
	}

	public int selectUserCountByUserId(String searchKeyword) {
		Connection conn = getConnection();
		int totalUser = new AdminDAO().selectUserCountByUserId(conn, searchKeyword);
		close(conn);
		return totalUser;
	}

	public int selectUserCountByUserName(String searchKeyword) {
		Connection conn = getConnection();
		int totalUser = new AdminDAO().selectUserCountByUserName(conn, searchKeyword);
		close(conn);
		return totalUser;
	}

	public int selectUserCountByUserPhone(String searchKeyword) {
		Connection conn = getConnection();
		int totalUser = new AdminDAO().selectUserCountByUserPhone(conn,searchKeyword);
		close(conn);
		return totalUser;
	}

	public int adminRoomInsert(AdminRoom a) {
		Connection conn=getConnection();
		int result=new AdminDAO().adminRoomInsert(conn,a);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int adminRoomImageInsert(RoomImage r) {
		Connection conn=getConnection();
		int result=new AdminDAO().adminRoomImageInsert(conn,r);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
