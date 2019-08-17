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

import admin.model.vo.AdminRoom;
import admin.model.vo.RoomImage;
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
	public List<User> selectUserList(Connection conn,int cPage, int numPerPage) {
		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserList");
		
		try {
			//미완성쿼리객체생성
			pstmt = conn.prepareStatement(sql);
			
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
				u.setUserEnrollDate(rset.getDate("user_enrolldate"));
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
		System.out.println("list@dao="+list);
		
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
	public List<User> selectUserByUserId(Connection conn, String searchKeyword, int cPage, int numPerPage) {
		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPagedUserByUserID");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+searchKeyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
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
				u.setUserEnrollDate(rset.getDate("user_enrolldate"));
				list.add(u);		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public List<User> selectUSerByUserName(Connection conn, String searchKeyword, int cPage, int numPerPage) {
		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPagedUserByUserName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
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
				u.setUserEnrollDate(rset.getDate("user_enrolldate"));
				list.add(u);		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public List<User> selectUSerByUserPhone(Connection conn, String searchKeyword, int cPage, int numPerPage) {
		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPagedUserByUserPhone");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
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
				u.setUserEnrollDate(rset.getDate("user_enrolldate"));
				list.add(u);		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int selectUserCountByUserId(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		int totalUser = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectUserCountByUserId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+searchKeyword+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				totalUser = rset.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return totalUser;
	}
	public int selectUserCountByUserName(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		int totalUser = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectUserCountByUserName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+searchKeyword+"%");
			
			rset  = pstmt.executeQuery();
			while(rset.next()) {
				totalUser = rset.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return totalUser;
	}
	public int selectUserCountByUserPhone(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		int totalUser = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectUserCountByUserPhone");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				totalUser = rset.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return totalUser;
	}
	public int adminRoomInsert(Connection conn, AdminRoom a) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("adminRoomInsert");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, a.getContentId());
			pstmt.setString(2, a.getRoomName());
			pstmt.setInt(3, a.getRoomWeekDayHighPrice());
			pstmt.setInt(4, a.getRoomWeekDayLowPrice());
			pstmt.setInt(5, a.getRoomWeekEndHighPrice());
			pstmt.setInt(6, a.getRoomWeekEndLowPrice());
			pstmt.setString(7, a.getRoomSize());
			pstmt.setString(8, a.getRoomPerson());
			pstmt.setString(9, a.getContent());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int adminRoomImageInsert(Connection conn, RoomImage r) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("adminRoomImageInsert");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getContentId());
			pstmt.setString(2, r.getRoomName());
			pstmt.setString(3, r.getOriginalFileName1());
			pstmt.setString(4, r.getRenameFileName1());
			pstmt.setString(5, r.getOriginalFileName2());
			pstmt.setString(6, r.getRenameFileName2());
			pstmt.setString(7, r.getOriginalFileName3());
			pstmt.setString(8, r.getRenameFileName3());
						
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public List<AdminRoom> selectAdminRoomList(Connection conn) {
		List<AdminRoom> roomList=new ArrayList<AdminRoom>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectAdminRoomList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				String contentId=rset.getString("content_id");
				String roomName=rset.getString("room_name");
				int roomWeekDayHighPrice=rset.getInt("room_weekday_high_price");
				int roomWeekDayLowPrice=rset.getInt("room_weekday_low_price");
				int roomWeekEndHighPrice=rset.getInt("room_weekend_high_price");
				int roomWeekEndLowPrice=rset.getInt("room_weekend_low_price");
				String roomSize=rset.getString("room_size");
				String roomPerson=rset.getString("room_person");
				String content=rset.getString("room_content");
				AdminRoom a=new AdminRoom(contentId, roomName, roomWeekDayHighPrice, roomWeekDayLowPrice, roomWeekEndHighPrice, roomWeekEndLowPrice, roomSize, roomPerson, content);
				roomList.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return roomList;
	}
	public List<AdminRoom> roomUpdateForm(Connection conn, String contentId, String roomName) {
		List<AdminRoom> roomList=new ArrayList<AdminRoom>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("roomUpdateForm");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, contentId);
			pstmt.setString(2, roomName);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				int roomWeekDayHighPrice=rset.getInt("room_weekday_high_price");
				int roomWeekDayLowPrice=rset.getInt("room_weekday_low_price");
				int roomWeekEndHighPrice=rset.getInt("room_weekend_high_price");
				int roomWeekEndLowPrice=rset.getInt("room_weekend_low_price");
				String roomSize=rset.getString("room_size");
				String roomPerson=rset.getString("room_person");
				String content=rset.getString("room_content");
				AdminRoom a=new AdminRoom(contentId, roomName, roomWeekDayHighPrice, roomWeekDayLowPrice, roomWeekEndHighPrice, roomWeekEndLowPrice, roomSize, roomPerson, content);
				roomList.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return roomList;
	}
	public List<RoomImage> roomImageUpdateForm(Connection conn, String contentId, String roomName) {
		List<RoomImage> roomImage=new ArrayList<RoomImage>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("roomImageUpdateForm");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, contentId);
			pstmt.setString(2, roomName);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				String originalFileName1=rset.getString("room1_original_filename");
				String renameFileName1=rset.getString("room1_renamed_filename");
				String originalFileName2=rset.getString("room2_original_filename");
				String renameFileName2=rset.getString("room2_renamed_filename");
				String originalFileName3=rset.getString("room3_original_filename");
				String renameFileName3=rset.getString("room3_renamed_filename");
				RoomImage r=new RoomImage(contentId, roomName, originalFileName1, renameFileName1, originalFileName2, renameFileName2, originalFileName3, renameFileName3);
				roomImage.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return roomImage;
	}
	public int roomUpdateEnd(Connection conn, AdminRoom a) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("roomUpdateEnd");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, a.getRoomWeekDayHighPrice());
			pstmt.setInt(2, a.getRoomWeekDayLowPrice());
			pstmt.setInt(3, a.getRoomWeekEndHighPrice());
			pstmt.setInt(4, a.getRoomWeekEndLowPrice());
			pstmt.setString(5, a.getRoomSize());
			pstmt.setString(6, a.getRoomPerson());
			pstmt.setString(7, a.getContent());
			pstmt.setString(8, a.getContentId());
			pstmt.setString(9, a.getRoomName());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int roomImageUpdateEnd(Connection conn, RoomImage r) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("roomImageUpdateEnd");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getOriginalFileName1());
			pstmt.setString(2, r.getRenameFileName1());
			pstmt.setString(3, r.getOriginalFileName2());
			pstmt.setString(4, r.getRenameFileName2());
			pstmt.setString(5, r.getOriginalFileName3());
			pstmt.setString(6, r.getRenameFileName3());
			pstmt.setString(7, r.getContentId());
			pstmt.setString(8, r.getRoomName());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
