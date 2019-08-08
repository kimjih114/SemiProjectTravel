package travel.model.dao;

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

import static common.JDBCTemplate.*;

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

}
