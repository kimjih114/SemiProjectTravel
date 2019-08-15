package storymsg.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import storymsg.model.vo.Msg;
import static common.JDBCTemplate.close;
public class MsgDAO {

	private Properties prop = new Properties();
	
	public MsgDAO() {
		
		try {
			
			String fileName = MsgDAO.class.getResource("/sql/message/message-query.properties").getPath(); 
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	public List<Msg> selectMsgList(Connection conn) {
		
		List<Msg> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		String sql= prop.getProperty("selectMsgList"); 
		 
		 
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Msg m = new Msg();
				m.setMsgNo(rset.getInt("msg_no"));
				m.setMsgSender(rset.getString("msg_sender"));
				m.setMsgReceiver(rset.getString("msg_receiver"));
				m.setMsgContent(rset.getString("msg_content"));
				m.setMsgDate(rset.getDate("msg_date"));
				m.setMsgCnt(rset.getInt("msg_cnt"));
				list.add(m); 
				System.out.println("메시지DAO의 list가 나오는가="+list);
			}
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset); 
			close(pstmt);
		}
		
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
