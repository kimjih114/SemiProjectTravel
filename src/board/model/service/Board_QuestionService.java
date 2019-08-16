package board.model.service;

import java.sql.Connection;
import java.util.List;



import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import static common.JDBCTemplate.*;

import board.model.dao.Board_QuestionDAO;
import board.model.vo.Board_Question;
import board.model.vo.Board_QuestionComment;

public class Board_QuestionService {

	public List<Board_Question> selectBoardQuestionList( int numPerPage, int cPage, String userId) {
		Connection conn = getConnection(); 
		List<Board_Question> list = new Board_QuestionDAO().selectBoardQuestionList(conn,cPage,numPerPage,userId); 
		close(conn);
		return list;
	}

	public int selectBoardQuestionCount(String userId) {
		Connection conn = getConnection();
		int totalBoardCount = new Board_QuestionDAO().selectBoardQuestionCount(conn,userId);
		close(conn);
		return totalBoardCount;
	}

	public int insertQBoard(Board_Question bq) {
		Connection conn = getConnection(); 
		int result = new Board_QuestionDAO().insertQBoard(conn, bq); 
		if(result >0) {
			result = new Board_QuestionDAO().selectLastSeq(conn); 
			
			commit(conn); 
			
		}else 
			rollback(conn);
		
		close(conn); 
		
		return result;
	}

	public Board_Question selectOne(int qboardNo, boolean hasRead) {
		Connection conn = getConnection(); 
		int result = 0; 
		if(!hasRead) {
			result = new Board_QuestionDAO().increaseReadCount(conn,qboardNo); 
			
		}
		Board_Question qb =  new Board_QuestionDAO().selectOne(conn,qboardNo); 
		
		if(result >0)
			commit(conn); 
		else 
			rollback(conn); 
		
		return qb;
	}

	public List<Board_QuestionComment> selectCommentList(int qboardNo) {
		Connection conn = getConnection(); 
		List<Board_QuestionComment> list = new Board_QuestionDAO().selectCommentList(conn,qboardNo); 
		close(conn); 
		return list;
	}

	public int deleteQBoard(int qboardNo) {
		Connection conn = getConnection(); 
		int result = new Board_QuestionDAO().deleteQBoard(conn,qboardNo);
		
		if(result>0)
			commit(conn);
		else
			rollback(conn); 
		close(conn); 
		
		return result;
	
	}

	public Board_Question selectOne(int qboardNo) {
		Connection conn = getConnection(); 
		Board_Question qboard = new Board_QuestionDAO().selectOne(conn, qboardNo); 
		close(conn);
		return qboard;
	}

	public int updateqBoard(Board_Question bq) {
		Connection conn= getConnection(); 
		int result = new Board_QuestionDAO().updateqBoard(conn,bq); 
		if(result>0) {
			commit(conn); 
		}else 
			rollback(conn); 
		
		close(conn); 
		
		
		return result;
	}

	public int insertQBoardComment(Board_QuestionComment bc) {
		Connection conn = getConnection();
		int result = new Board_QuestionDAO().insertBoardComment(conn, bc);
		
		//트랜잭션 
		if(result > 0)
			commit(conn);
		else 
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteBoardComment(int qboardCommentNo) {
		Connection conn = getConnection();
		int result = new Board_QuestionDAO().deleteBoardComment(conn, qboardCommentNo);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public List<Board_Question> selectAdminBoardQuestionList(int cPage, int numPerPage) {
		Connection conn = getConnection(); 
		List<Board_Question> list = new Board_QuestionDAO().selectAdminBoardQuestionList(conn,cPage,numPerPage); 
		close(conn);
		return list;
	}

	public int selectAdminBoardQuestionCount() {
		Connection conn = getConnection();
		int totalBoardCount = new Board_QuestionDAO().selectAdminBoardQuestionCount(conn);
		close(conn);
		return totalBoardCount;
	}

}
