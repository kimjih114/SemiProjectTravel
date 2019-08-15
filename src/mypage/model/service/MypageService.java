package mypage.model.service;

import java.sql.Connection;
import java.util.List;

import mypage.model.dao.MypageDAO;
import travel.model.vo.RoomReservation;
import static common.JDBCTemplate.*;

public class MypageService {

	public List<RoomReservation> friendReservationRoom(String userId) {
		Connection conn=getConnection();
		List<RoomReservation> friendRoom=new MypageDAO().friendReservationRoom(conn,userId);
		close(conn);
		return friendRoom;
	}

	public int myBasketDel(RoomReservation r) {
		Connection conn=getConnection();
		int result=new MypageDAO().myBasketDel(conn,r);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
