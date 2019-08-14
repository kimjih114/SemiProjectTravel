package board.model.dao;


import static common.JDBCTemplate.close;

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

import board.model.vo.Board_Question;
import board.model.vo.Board_QuestionComment;

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

	public List<Board_Question> selectBoardQuestionList(Connection conn, int cPage, int numPerPage) {
		
		List<Board_Question> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectQBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board_Question qb = new Board_Question(); 
				
				qb.setQboardNo(rset.getInt("qboard_no"));
				qb.setQboardWriter(rset.getString("qboard_writer"));
				qb.setQboardTitle(rset.getString("qboard_title"));
				qb.setQboardContent(rset.getString("qboard_content"));
				qb.setQboardDate(rset.getDate("qboard_date"));
				qb.setQboardReadcnt(rset.getInt("qboard_readcnt"));
				qb.setQboardTravel_ref(rset.getInt("qboard_travel_ref"));
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

	public int insertQBoard(Connection conn, Board_Question bq) {
		
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("insertQBoard"); 
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setString(1, bq.getQboardWriter());		
			pstmt.setString(2, bq.getQboardTitle());
			pstmt.setString(3, bq.getQboardContent());
			pstmt.setInt(4,bq.getQboardTravel_ref());
			pstmt.setString(5, bq.getQboardFileName());		
			pstmt.setString(6, bq.getQboardNewFileName());		
			
		
			
			result = pstmt.executeUpdate(); 
			
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
	
		
		return result;
	}

	public int selectLastSeq(Connection conn) {
		PreparedStatement pstmt= null; 
		ResultSet rset = null; 
		int qboardNo = 0; 
		
		String sql = prop.getProperty("selectLastSeq"); 
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery(); 
			if(rset.next()) {
				qboardNo = rset.getInt("currval"); 
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		
		return qboardNo;
	}

	public Board_Question selectOne(Connection conn, int qboardNo) {
	
		Board_Question qb = null; 
		PreparedStatement pstmt = null; 
		ResultSet rset =  null; 
		
		String sql = prop.getProperty("selectOne"); 
		
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qboardNo);

				rset= pstmt.executeQuery(); 
				
				if(rset.next()) {
					qb = new Board_Question(); 
					qb.setQboardNo(rset.getInt("qboard_no"));
					qb.setQboardWriter(rset.getString("qboard_writer"));
					qb.setQboardTitle(rset.getString("qboard_title"));
					qb.setQboardContent(rset.getString("qboard_content"));
					qb.setQboardDate(rset.getDate("qboard_date"));
					qb.setQboardReadcnt(rset.getInt("qboard_readcnt"));
					qb.setQboardTravel_ref(rset.getInt("qboard_travel_ref"));
					qb.setQboardFileName(rset.getString("qboard_filename"));
					qb.setQboardNewFileName(rset.getString("qboard_state"));
					
			
					
				}
			
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset); 
				close(pstmt); 
			}
			return qb; 
			
	
	
	}

	public int increaseReadCount(Connection conn, int qboardNo) {
		
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("increaseReadCount"); 
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, qboardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt); 
		}
		System.out.println("board_questionSerivce   increaseReadCount---------------->>>"+result);
		return result; 
		
	}

	public List<Board_QuestionComment> selectCommentList(Connection conn, int qboardNo) {
		List<Board_QuestionComment> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		 ResultSet rset = null; 
		 
		 String sql = prop.getProperty("selectCommentList"); 
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qboardNo);
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) {
				
				Board_QuestionComment bqc = new Board_QuestionComment(); 
				
				bqc.setQboardComment_no(rset.getInt("qboard_comment_no"));
				bqc.setQboardCommentLevel(rset.getInt("qboard_comment_level"));
				bqc.setQboardCommentWriter(rset.getString("qboard_comment_writer"));
				bqc.setQboardCommentContent(rset.getString("qboard_comment_content"));
				bqc.setQboardref(rset.getInt("qboard_ref"));
				bqc.setQboardCommentRef(rset.getInt("qboard_comment_ref"));//null인 참조댓글필드는 0값이 대입됨.
				bqc.setQboardCommentDate(rset.getDate("qboard_comment_date"));
				list.add(bqc);
				
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

	public int deleteQBoard(Connection conn, int qboardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteQBoard"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, qboardNo);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateqBoard(Connection conn, Board_Question bq) {
		
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql =prop.getProperty("updateQBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bq.getQboardTitle());
			pstmt.setString(2, bq.getQboardContent());
			pstmt.setString(3, bq.getQboardFileName());
			pstmt.setString(4, bq.getQboardNewFileName());
			pstmt.setInt(5, bq.getQboardNo());
			
			System.out.println("결과결과결과@dao="+result);
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		
		return result;
	}

	public int insertBoardComment(Connection conn, Board_QuestionComment bc) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoardComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bc.getQboardCommentLevel());
			pstmt.setString(2, bc.getQboardCommentWriter());
			pstmt.setString(3, bc.getQboardCommentContent());
			pstmt.setInt(4, bc.getQboardref());
			//java - int: null을 허용하지 않음. 0
			//oracle - number: null 
			
			pstmt.setString(5, bc.getQboardCommentRef()==0?null:bc.getQboardCommentRef()+"");
			System.out.println("result="+result);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoardComment(Connection conn, int qboardCommentNo) {
		
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("deleteBoardComment"); 
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, qboardCommentNo);
			
			result =  pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		
		
		return result;
	}
	
	
	
	
	
	
	

}
