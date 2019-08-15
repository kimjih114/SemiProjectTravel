package mypage.model.dao;

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

public class MypageDAO {

	private Properties prop = new Properties();	
	
	public MypageDAO() {
		String fileName = MypageDAO.class.getResource("/sql/travel/travel-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<RoomReservation> friendReservationRoom(Connection conn, String userId) {
		List<RoomReservation> friendRoom=new ArrayList<RoomReservation>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("friendReservationRoom");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				String userId_=rset.getString("user_id");
				String contentId=rset.getString("content_id");
				String travelName=rset.getString("travel_name");
				String roomName=rset.getString("room_name");
				String reservationStartDate=rset.getString("reservation_start_date");				
				String reservationEndDate=rset.getString("reservation_end_date");	
				Date paymentDate=rset.getDate("payment_date");
				int price=rset.getInt("price");
				RoomReservation r=new RoomReservation(userId_, contentId, travelName, roomName, reservationStartDate, reservationEndDate, userId, paymentDate, price);
				friendRoom.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return friendRoom;
	}

	public int myBasketDel(Connection conn, RoomReservation r) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("myBasketDel");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getContentId());
			pstmt.setString(3, r.getRoomName());
			pstmt.setString(4, r.getReservationStartDate());
			pstmt.setString(5, r.getReservationEndDate());			
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
