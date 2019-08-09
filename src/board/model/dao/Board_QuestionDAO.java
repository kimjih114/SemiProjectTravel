package board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.*;
import board.model.vo.Board_Question;

public class Board_QuestionDAO {
	
	private Properties prop = new Properties(); 
	
	public Board_QuestionDAO(){
		
			try {
		
				String fileName = Board_QuestionDAO.class.getResource("/sql/question_board/question_board-query.properties").getPath(); 
				prop.load(new FileReader(fileName));
			
			
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	public List<Board_Question> selectBoardQuestionList(Connection conn) {
		
		List<Board_Question> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectQBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board_Question qb = new Board_Question(); 
				
				qb.setQboardNo(rset.getInt("qboard_no"));
				qb.setQboardWriter(rset.getString("qboard_writer"));
				qb.setQboardTitle(rset.getString("qboard_title"));
				qb.setQboardContent(rset.getString("qboard_content"));
				qb.setQboardDate(rset.getDate("qboard_date"));
				qb.setQboardReadcnt(rset.getInt("qboard_readcnt"));
				qb.setQboardTravle_ref(rset.getInt("qboard_travel_ref"));
				qb.setQboardFileName(rset.getString("qboard_filename"));
				qb.setQboardNewFileName(rset.getString("qboard_state"));
				
				list.add(qb); 
		
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

	public int selectBoardQuestionCount(Connection conn) {
		
		PreparedStatement pstmt = null; 
		int totalUser = 0; 
		ResultSet rset  = null; 
		
		String sql  =prop.getProperty("selectQBoardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset =pstmt.executeQuery(); 
			
			while(rset.next()) {
				totalUser = rset.getInt("cnt"); 
				
			}
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalUser;
	}
	
	
	
	
	
	

}
