package board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class Board_QuestionDAO {
	
	private Properties prop = new Properties(); 
	
	public Board_QuestionDAO(){
		
			try {
		
				String fileName = Board_QuestionDAO.class.getResource("/sql/board/board_question-query.properties").getPath(); 
				prop.load(new FileReader(fileName));
			
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	

}
