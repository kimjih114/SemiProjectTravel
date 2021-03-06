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

import sns.model.vo.GradeSNS;
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
				Travel t=new Travel();
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
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			System.out.println("contentId는?"+contentId);
			System.out.println("startDate는?"+startDate);
			System.out.println("endDate는?"+endDate);
			rset=pstmt.executeQuery();
			
			while (rset.next()) {		
				String userId=rset.getString("user_id");				
				String roomName=rset.getString("room_name");				
				String travelName=rset.getString("travel_name");				
				String reservationStartDate=rset.getString("reservation_start_date");				
				String reservationEndDate=rset.getString("reservation_end_date");				
				String friendId=rset.getString("friend_id");				
				Date paymentDate=rset.getDate("payment_date");
				int price=rset.getInt("price");
				RoomReservation r=new RoomReservation(userId, contentId, travelName, roomName, reservationStartDate, reservationEndDate, friendId, paymentDate, price);
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

	public List<RoomReservation> myReservationRoom(Connection conn, String userId) {
		List<RoomReservation> room=new ArrayList<RoomReservation>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("myReservationRoom");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				String contentId=rset.getString("content_id");
				String travelName=rset.getString("travel_name");
				String roomName=rset.getString("room_name");
				String reservationStartDate=rset.getString("reservation_start_date");				
				String reservationEndDate=rset.getString("reservation_end_date");	
				String friendId=rset.getString("friend_id");
				Date paymentDate=rset.getDate("payment_date");
				int price=rset.getInt("price");
				RoomReservation r=new RoomReservation(userId, contentId, travelName, roomName, reservationStartDate, reservationEndDate, friendId, paymentDate, price);
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

	public int reservationInsert(Connection conn, RoomReservation r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reservationInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getContentId());
			pstmt.setString(3, r.getTravelName());
			pstmt.setString(4, r.getRoomName());
			pstmt.setString(5, r.getReservationStartDate());
			pstmt.setString(6, r.getReservationEndDate());
			pstmt.setString(7, r.getFriendId());
			pstmt.setInt(8, r.getPrice());			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int reservationDelete(Connection conn, RoomReservation r) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("reservationDelete");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getContentId());
			pstmt.setString(3, r.getTravelName());
			pstmt.setString(4, r.getRoomName());
			pstmt.setString(5, r.getReservationStartDate());
			pstmt.setString(6, r.getReservationEndDate());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<RoomReservation> myReservationDelView(Connection conn, String userId) {
		List<RoomReservation> room=new ArrayList<RoomReservation>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("myReservationDelView");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				String contentId=rset.getString("content_id");
				String travelName=rset.getString("travel_name");
				String roomName=rset.getString("room_name");
				String reservationStartDate=rset.getString("reservation_start_date");				
				String reservationEndDate=rset.getString("reservation_end_date");	
				String friendId=rset.getString("friend_id");
				Date paymentDate=rset.getDate("payment_date");
				int price=rset.getInt("price");
				Date delDate=rset.getDate("del_date");
				RoomReservation r=new RoomReservation(userId, contentId, travelName, roomName, reservationStartDate, reservationEndDate, friendId, paymentDate, price, delDate);
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

	public int reservationBasketInsert(Connection conn, RoomReservation r) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("reservationBasketInsert");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getContentId());
			pstmt.setString(3, r.getContentTypeId());
			pstmt.setString(4, r.getTravelName());
			pstmt.setString(5, r.getRoomName());
			pstmt.setString(6, r.getReservationStartDate());
			pstmt.setString(7, r.getReservationEndDate());
			pstmt.setInt(8, r.getPrice());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<RoomReservation> myBasketView(Connection conn, String userId) {
		
		List<RoomReservation> basketRoom=new ArrayList<RoomReservation>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("myBasketView");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				String contentId=rset.getString("content_id");
				String contentTypeId=rset.getString("content_type_id");
				String travelName=rset.getString("travel_name");
				String roomName=rset.getString("room_name");
				String reservationStartDate=rset.getString("reservation_start_date");				
				String reservationEndDate=rset.getString("reservation_end_date");	
				int price=rset.getInt("price");
				RoomReservation r=new RoomReservation(userId, contentId, contentTypeId, travelName, roomName, reservationStartDate, reservationEndDate, price);
				basketRoom.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return basketRoom;
	}

	public List<Travel> selectTravelList(Connection conn, int cPage, int numPerPage) {
		List<Travel> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTravelList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (cPage-1)*numPerPage+1;
			int end = cPage * numPerPage;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
				t.setTravelOfficierphone(rset.getString("travel_officer_phone"));
				t.setTravelType(rset.getString("travel_type"));
				list.add(t);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("TravelList@dao="+list);
		return list;
	}

	public int selectTotalContents(Connection conn) {
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
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}

	public List<Travel> selectTravelByTravelName(Connection conn,String searchType, String searchKeyword, int cPage, int numPerPage) {
		List<Travel>list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("여기 오니?");
		String query = prop.getProperty("selectPagedTravelByTravelName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			pstmt.setString(2, searchType);
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			
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
				t.setTravelOfficierphone(rset.getString("travel_officer_phone"));
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

	public int selectTravelCountByTravelName(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		int totalTravel =0;
		ResultSet rset = null;
		String query = prop.getProperty("selectTravelCountByTravelName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+searchKeyword+"%");
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				totalTravel = rset.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return totalTravel;
	}
	public List<GradeSNS> contentGradeSelect(Connection conn, String contentId) {
		List<GradeSNS> gradeList=new ArrayList<GradeSNS>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("contentGradeSelect");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, contentId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				int boardNo=rset.getInt("board_no");
				String boardWriter=rset.getString("user_id");
				int grade=rset.getInt("grade");
				GradeSNS g=new GradeSNS(boardNo, boardWriter, contentId, null, null, null, null, grade, 0, null);
				gradeList.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return gradeList;
	}

	public Travel selectTravel(Connection conn, String contentId) {
		Travel t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTravel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Travel();
				
				t.setContentId(rset.getString("content_id"));
				t.setTravelName(rset.getString("travel_name"));
				t.setTravelLocation(rset.getString("travel_location"));
				t.setThumbnailOriginalFilename(rset.getString("thumbnail_original_filename"));
				t.setThumbnailRenamedFilename(rset.getString("thumbnail_renamed_filename"));
				t.setTravelDate(rset.getDate("travel_date"));
				t.setTravelContent(rset.getString("travel_content"));
				t.setTravelOfficierName(rset.getString("travel_officier_name"));
				t.setTravelOfficierphone(rset.getString("travel_officer_phone"));
				t.setTravelType(rset.getString("travel_type"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return t;
	}

	public int updateTravel(Connection conn, Travel t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateTravel");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, t.getTravelName());
			pstmt.setString(2, t.getTravelLocation());
			pstmt.setString(3, t.getThumbnailOriginalFilename());
			pstmt.setString(4, t.getThumbnailRenamedFilename());
			pstmt.setString(5, t.getTravelContent());
			pstmt.setString(6, t.getTravelOfficierName());
			pstmt.setString(7, t.getTravelOfficierphone());
			pstmt.setString(8, t.getTravelType());
			pstmt.setString(9, t.getContentId());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteTravel(Connection conn, String contentId_) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteTravel");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, contentId_);
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int selectDay(Connection conn, String startDate, String endDate) {
		int day=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectDay");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, endDate);
			pstmt.setString(2, startDate);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				day=rset.getInt("day");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return day;
	}

	public RoomReservation basketCheck(Connection conn, RoomReservation r) {
		RoomReservation basket=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("basketCheck");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getContentId());
			pstmt.setString(3, r.getContentTypeId());
			pstmt.setString(4, r.getTravelName());
			pstmt.setString(5, r.getRoomName());
			pstmt.setString(6, r.getReservationStartDate());
			pstmt.setString(7, r.getReservationEndDate());
			pstmt.setInt(8, r.getPrice());
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				String userId=rset.getString("user_id");
				String contentId=rset.getString("content_id");
				String contentTypeId=rset.getString("content_type_id");
				String travelName=rset.getString("travel_name");
				String roomName=rset.getString("room_name");
				String reservationStartDate=rset.getString("reservation_start_date");				
				String reservationEndDate=rset.getString("reservation_end_date");	
				int price=rset.getInt("price");
				basket=new RoomReservation(userId, contentId, contentTypeId, travelName, roomName, reservationStartDate, reservationEndDate, price);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return basket;
	}

	public List<String> weekendDay(Connection conn, String startDate, String endDate) {
		List<String> weekend=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("weekendDay");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				String sd=rset.getString("startDate");
				String ed=rset.getString("endDate");
				weekend.add(sd);
				weekend.add(ed);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return weekend;
	}
}
