package sns.model.dao;

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

public class SNSDAO {

	private Properties prop = new Properties();
	
	public SNSDAO() {
		String fileName = SNSDAO.class.getResource("/sql/sns/sns-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<String> friendIdSearch(Connection conn, String userId, String searchId) {
		List<String> friendId=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("friendIdSearch");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, "%"+searchId+"%");
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				String friend=rset.getString("user_followed");
				friendId.add(friend);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return friendId;
	}

}
