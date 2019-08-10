package sns.model.dao;

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

import sns.model.vo.ProfileSNS;
import user.model.vo.User;

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

	public ProfileSNS selectOneProfile(Connection conn, User userLoggedIn) {
		ProfileSNS profileSNS = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneProfile");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userLoggedIn.getUserId());
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				profileSNS = new ProfileSNS();
				
				System.out.println("null@dao="+rset.getString("user_introduce"));
				
				profileSNS.setUserId(rset.getString("user_id"));
				profileSNS.setUserNickname(rset.getString("user_nickname"));
				if(rset.getString("user_introduce")!=null) {
					profileSNS.setUserIntroduce(rset.getString("user_introduce"));
				} else {
					profileSNS.setUserIntroduce("안녕하세요. 저는 " + rset.getString("user_nickname") +"입니다.");
					
				}
				if(rset.getString("profile_original_filename")!=null) {
					profileSNS.setProfileOriginalFilename(rset.getString("profile_original_filename"));
				} else {
					
				}
		
				if(rset.getString("profile_renamed_filename")!=null) {
					profileSNS.setProfileRenamedFilename(rset.getString("profile_renamed_filename"));
				}
				if(rset.getString("header_original_filename")!=null) {
					profileSNS.setHeaderOriginalFilename(rset.getString("header_original_filename"));
				}
				if(rset.getString("header_renamed_filename")!=null) {
					profileSNS.setHeaderRenamedFilename(rset.getString("header_renamed_filename"));
				}
				
				if(rset.getString("header_text")!=null) {
					profileSNS.setHeaderText(rset.getString("header_text"));
				} else {
					profileSNS.setHeaderText(rset.getString("user_nickname")+"의 홈");
				}
				
				if(rset.getString("theme_color")!=null) {
					profileSNS.setThemeColor(rset.getString("theme_color"));
				} else {
					profileSNS.setThemeColor("#fed136");
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return profileSNS;
	}

}
