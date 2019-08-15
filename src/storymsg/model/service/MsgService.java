package storymsg.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import static common.JDBCTemplate.*;

import storymsg.model.dao.MsgDAO;
import storymsg.model.vo.Msg;

public class MsgService {

	public List<Msg> selectMsgList() {
		Connection conn = getConnection();
		List<Msg> list = new MsgDAO().selectMsgList(conn);
		close(conn);
		return list;
	}

}
