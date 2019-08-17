package travel.model.service;

import java.sql.Connection;
import java.util.List;

import sns.model.vo.GradeSNS;
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

	public int reservationInsert(RoomReservation r) {
		Connection conn=getConnection();
		int result=new TravelDAO().reservationInsert(conn,r);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int reservationDelete(RoomReservation r) {
		Connection conn=getConnection();
		int result=new TravelDAO().reservationDelete(conn,r);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public List<RoomReservation> myReservationDelView(String userId) {
		Connection conn=getConnection();
		List<RoomReservation> room=new TravelDAO().myReservationDelView(conn,userId);
		close(conn);
		return room;
	}

	public int reservationBasketInsert(RoomReservation r) {
		Connection conn=getConnection();
		int result=new TravelDAO().reservationBasketInsert(conn,r);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public List<RoomReservation> myBasketView(String userId) {
		Connection conn=getConnection();
		List<RoomReservation> basketRoom=new TravelDAO().myBasketView(conn,userId);
		close(conn);
		return basketRoom;
	}

	public List<Travel> selectTravelList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Travel> list
			= new TravelDAO().selectTravelList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectTotalContents() {
		Connection conn = getConnection();
		int totalContents = new TravelDAO().selectTotalContents(conn);
		close(conn);
		return totalContents;
	}

	public List<Travel> selectTravelByTravelName(String searchType,String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Travel> list = new TravelDAO().selectTravelByTravelName(conn,searchType,searchKeyword,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectTravelCountByTravelName(String searchKeyword) {
		Connection conn = getConnection();
		int totalTravel = new TravelDAO().selectTravelCountByTravelName(conn,searchKeyword);
		close(conn);
		return totalTravel;
	}
	public List<GradeSNS> contentGradeSelect(String contentId) {
		Connection conn=getConnection();
		List<GradeSNS> gradeList=new TravelDAO().contentGradeSelect(conn,contentId);
		close(conn);
		return gradeList;
	}
	
	public Travel selectTravel(String contentId) {
		Connection conn = getConnection();
		Travel t = new TravelDAO().selectTravel(conn,contentId);
		close(conn);
		return t;
	}

	public int updateTravel(Travel t, String contentId) {
		Connection conn = getConnection();
		int result = new TravelDAO().updateTravel(conn,t);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int deleteTravel(String contentId_) {
		Connection conn = getConnection();
		int result = new TravelDAO().deleteTravel(conn,contentId_);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		
		return result;
	}

	public int selectDay(String startDate, String endDate) {
		Connection conn=getConnection();
		int day=new TravelDAO().selectDay(conn,startDate,endDate);
		close(conn);
		return day;
	}
	
}
