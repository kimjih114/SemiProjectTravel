package travel.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import travel.model.vo.RoomReservation;
import travel.model.vo.Travel;
import travel.model.vo.TravelFood;

public class TravelDAO {

	private Properties prop = new Properties();	

	public TravelDAO() {
		String fileName = TravelDAO.class.getResource("/sql/travel/travel-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Travel> travelView(Connection conn, String searchName, int cPage, int numPerPage) {
		List<Travel> list=new ArrayList<Travel>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("travelView");
		
		try {
			pstmt=conn.prepareStatement(sql);
			int start = (cPage-1)*numPerPage+1;
			int end = cPage * numPerPage;
			pstmt.setString(1, "%"+searchName+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				int travelNo=rset.getInt("travel_no");
				String userId=rset.getString("user_id");
				String travelName=rset.getString("travel_name");
				String oldProfileName=rset.getString("travel_oldprofilename");
				String newProfileName=rset.getString("travel_newprofilename");
				String travelContent=rset.getString("travel_content");
				Date travelEnrolldate=rset.getDate("travel_enrolldate");
				int viewCount=rset.getInt("travel_view_count");
				int like=rset.getInt("travel_like");
				int grade=rset.getInt("travel_grade");
				String travelAddress=rset.getString("travel_address");
				Travel t=new Travel(travelNo, userId, travelName, oldProfileName, newProfileName, travelContent, travelEnrolldate, viewCount, like, grade, travelAddress);
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}

	public int travelTotalCount(Connection conn, String searchName) {
		int totalTravel=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("travelTotalCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchName+"%");
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				totalTravel=rset.getInt("totaltravel");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return totalTravel;
	}

	public List<TravelFood> travelFoodView(Connection conn, String searchAddress, int cPage, int numPerPage) {
		List<TravelFood> list=new ArrayList<TravelFood>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("travelFoodView");
		
		try {
			pstmt=conn.prepareStatement(sql);
			int start = (cPage-1)*numPerPage+1;
			int end = cPage * numPerPage;
			pstmt.setString(1, "%"+searchAddress+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				int foodNo=rset.getInt("food_no");
				String userId=rset.getString("user_id");
				String foodName=rset.getString("food_name");
				String oldProfileName=rset.getString("food_oldprofilename");
				String newProfileName=rset.getString("food_newprofilename");
				String foodContent=rset.getString("food_content");
				Date foodEnrolldate=rset.getDate("food_enrolldate");
				int viewCount=rset.getInt("food_view_count");
				int like=rset.getInt("food_like");
				int grade=rset.getInt("food_grade");
				String foodAddress=rset.getString("food_address");
				TravelFood t=new TravelFood(foodNo, userId, foodName, oldProfileName, newProfileName, foodContent, foodEnrolldate, viewCount, like, grade, foodAddress);
				list.add(t);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int travelFoodTotalCount(Connection conn, String searchAddress) {
		int totalTravelFood=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("travelFoodTotalCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchAddress+"%");
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				totalTravelFood=rset.getInt("totaltravelfood");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return totalTravelFood;
	}

	public List<RoomReservation> roomSearch(Connection conn, String startDate, String endDate, String contentId) {
		List<RoomReservation> room=new ArrayList<RoomReservation>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("roomSearch");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, contentId);
			pstmt.setString(2, "%"+startDate+"%");
			pstmt.setString(3, "%"+endDate+"%");
			rset=pstmt.executeQuery();
			
			while (rset.next()) {
				String userId=rset.getString("user_id");
				String roomName=rset.getString("room_name");
				String reservationDate=rset.getString("reservation_date");
				String friendId=rset.getString("friend_id");
				RoomReservation r=new RoomReservation(userId, contentId, roomName, reservationDate, friendId);
				room.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return room;
	}

	public int insertTravel(Connection conn,Travel travel) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertTravel");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			
			pstmt.setString(1, travel.getTravelLocation());
			pstmt.setString(2, travel.getTravelName());
			pstmt.setString(3, travel.getThumbnailOriginalFilename());
			pstmt.setString(4, travel.getThumbnailRenamedFilename());
			pstmt.setString(5,travel.getTravelContent());
			pstmt.setString(6, travel.getTravelOfficierName());
			pstmt.setString(7, travel.getTravelOfficierphone());
			pstmt.setString(8, travel.getTravelType());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Travel> selectTravelList(Connection conn) {
		List<Travel> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTravelList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Travel t = new Travel();
				t.setContentId(rset.getString("content_id"));
				t.setTravelName(rset.getString("travel_name"));
				t.setTravelLocation(rset.getString("travel_location"));
				t.setThumbnailOriginalFilename(rset.getString("thumbnail_original_filename"));
				t.setThumbnailRenamedFilename(rset.getString("thumbnail_renamed_filename"));
				t.setTravelDate(rset.getDate("travel_date"));
				t.setTravelContent(rset.getString("travel_content"));
				t.setTravelOfficierName(rset.getString("travel_officier_name"));
				t.setTravelOfficierphone(rset.getString("travel_officier_phone"));
				t.setTravelType(rset.getString("travel_type"));
				list.add(t);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
}
