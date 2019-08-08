package admin.model.dao;

import static common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import user.model.vo.User;

public class AdminDAO {

	private Properties prop;
	
	public AdminDAO() {
		prop = new Properties();
		
		String fileName 
			= AdminDAO.class
				   	  .getResource("/sql/admin/admin-query.properties")
				   	  .getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<User> selectMemberList(Connection conn, int cPage, int numPerPage) {
		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			//미완성쿼리객체생성
			pstmt = conn.prepareStatement(sql);
			//(페이징공식1)
			//cPage=1,numPerPage=10 => 1,10
			//cPage=2,numPerPage=10 => 11,20
			//cPage=3,numPerPage=10 => 21,30
			int start = (cPage-1)*numPerPage+1;
			int end = cPage * numPerPage;
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			
			//쿼리실행
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				User u = new User();
				u.setUserId(rset.getString("user_id"));//db에 사용자 정보를 가져오기    
				u.setUsernickName(rset.getString("user_nickname"));
				u.setUserPassword(rset.getString("user_password"));
				u.setUserName(rset.getString("user_name"));
				u.setUserGender(rset.getString("user_gender"));
				u.setUserBirth(rset.getDate("user_birth"));
				u.setUserEmail(rset.getString("user_email"));
				u.setUserPhone(rset.getString("user_phone"));
				u.setFileName(rset.getString("user_filename"));
				u.setUserType(rset.getString("user_type"));
				u.setUserDefaultPlace(rset.getString("user_default_place"));
				u.setUserDefaultActivity(rset.getString("user_default_activity"));
				
				list.add(u);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	public int selecTotalContents(Connection conn) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTotalContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContents = rset.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
	}

}
