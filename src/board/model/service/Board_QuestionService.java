package board.model.service;

import java.sql.Connection;
import java.util.List;



import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import board.model.dao.Board_QuestionDAO;
import board.model.vo.Board_Question;

public class Board_QuestionService {

	public List<Board_Question> selectBoardQuestionList(int cPage, int numPerPage) {
		Connection conn = getConnection(); 
		List<Board_Question> list = new Board_QuestionDAO().selectBoardQuestionList(conn,cPage, numPerPage); 
		close(conn);
		return list;
	}

	public int selectBoardQuestionCount() {
		Connection conn = getConnection();
		int totalBoardCount = new Board_QuestionDAO().selectBoardQuestionCount(conn);
		close(conn);
		return totalBoardCount;
	}

}
