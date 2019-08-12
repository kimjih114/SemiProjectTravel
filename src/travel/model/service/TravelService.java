package travel.model.service;

import java.sql.Connection;
import java.util.List;

import travel.model.dao.TravelDAO;
import travel.model.vo.RoomReservation;
import travel.model.vo.Travel;
import travel.model.vo.TravelFood;

import static common.JDBCTemplate.*;
public class TravelService {

	public List<Travel> travelView(String searchName, int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Travel> list=new TravelDAO().travelView(conn,searchName,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int travelTotalCount(String searchName) {
		Connection conn=getConnection();
		int totalTravel=new TravelDAO().travelTotalCount(conn,searchName);
		close(conn);
		return totalTravel;
	}

	public List<TravelFood> travelFoodView(String searchAddress, int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<TravelFood> list=new TravelDAO().travelFoodView(conn,searchAddress,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int travelFoodTotalCount(String searchAddress) {
		Connection conn=getConnection();
		int totalTravelFood=new TravelDAO().travelFoodTotalCount(conn,searchAddress);
		close(conn);
		return totalTravelFood;
	}

	public List<RoomReservation> roomSearch(String startDate, String endDate, String contentId) {
		Connection conn=getConnection();
		List<RoomReservation> room=new TravelDAO().roomSearch(conn,startDate,endDate,contentId);
		close(conn);
		return room;
	}

	public int insertTravel(Travel travel) {
		Connection conn = getConnection();
		int result = new TravelDAO().insertTravel(conn, travel);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public List<Travel> selectTravelList() {
		Connection conn = getConnection();
		List<Travel> list 
				= new TravelDAO().selectTravelList(conn);
		close(conn);
		return list;
		
	}

	public List<RoomReservation> myReservationRoom(String userId) {
		Connection conn=getConnection();
		List<RoomReservation> room=new TravelDAO().myReservationRoom(conn,userId);
		close(conn);
		return room;
	}
}
