package travel.model.service;

import java.sql.Connection;
import java.util.List;

import travel.model.dao.TravelDAO;
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

}
