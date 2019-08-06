package user.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import user.model.vo.User;



public class UserDAO {
	private Properties prop = new Properties();
	
	public UserDAO() {
		String fileName = UserDAO.class.getResource("/sql/member/member-query.properties").getPath();  
		try {
			prop.load(new FileReader(fileName));
			System.out.println("[[prop loading 완료:"+fileName+"]]");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	


	public User selectOne(Connection conn, String userId) {

		User u = null; 
		PreparedStatement pstmt= null; 
		ResultSet rset = null; 
		
		String sql =prop.getProperty("selectOne"); 
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new User(); 
				
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
			
				System.out.println("userdao @ user selectOne="+u);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
	}



	public int loginCheck(Connection conn, User user) {
		int result = -1; 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		String sql = prop.getProperty("loginCheck");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserId());
			
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				result = rset.getInt("login_check");
				 
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset); 
			close(pstmt);
		}
		return result;
	}




	public int insertMember(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUsernickName());
			pstmt.setString(3, u.getUserPassword());
			pstmt.setString(4, u.getUserName());
			pstmt.setDate(5, u.getUserBirth());
			pstmt.setString(6, u.getUserEmail());
			pstmt.setString(7, u.getUserPhone());
			pstmt.setString(8, u.getUserGender());
			pstmt.setString(9, u.getUserType());
			pstmt.setString(10,u.getFileName());
			pstmt.setString(11, u.getUserDefaultPlace());
			pstmt.setString(12, u.getUserDefaultActivity());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}

}
