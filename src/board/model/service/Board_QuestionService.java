package board.model.service;

import java.sql.Connection;
import java.util.List;



import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import board.model.dao.Board_QuestionDAO;
import board.model.vo.Board_Question;

public class Board_QuestionService {

	public List<Board_Question> selectBoardQuestionList() {
		Connection conn = getConnection(); 
		List<Board_Question> list = new Board_QuestionDAO().selectBoardQuestionList(conn); 
		close(conn);
		return list;
	}

	public int selectBoardQuestionCount() {
		Connection conn = getConnection();
		int totalBoardCount = new Board_QuestionDAO().selectBoardQuestionCount(conn);
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

}
