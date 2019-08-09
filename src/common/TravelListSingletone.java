package common;

import java.util.List;

import travel.model.service.TravelService;
import travel.model.vo.Travel;

public class TravelListSingletone {

	private static TravelListSingletone instance;
	private List<Travel> travelList;
	
	private TravelListSingletone() {
		travelList 
		= new TravelService().selectTravelList();
		System.out.println("travelList="+travelList);
	}
	
	public static TravelListSingletone getInstance() {
		if(instance == null)
			instance = new TravelListSingletone();
		return instance;
	}
	
	public List<Travel> getTravelList(){
		return travelList;
	}
}
