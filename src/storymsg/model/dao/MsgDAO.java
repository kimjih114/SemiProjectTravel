package storymsg.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
