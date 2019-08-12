package sns.model.dao;

import static common.JDBCTemplate.*;

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

import sns.model.vo.BoardSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;
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

	public ProfileSNS selectOneProfile(Connection conn, String userId) {
		ProfileSNS profileSNS = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneProfile");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				profileSNS = new ProfileSNS();
				
				System.out.println("null@dao="+rset.getString("user_introduce"));
				
				profileSNS.setUserId(rset.getString("user_id"));
				profileSNS.setUserNickname(rset.getString("user_nickname"));
				profileSNS.setUserIntroduce(rset.getString("user_introduce"));
				profileSNS.setProfileOriginalFilename(rset.getString("profile_original_filename"));
				profileSNS.setProfileRenamedFilename(rset.getString("profile_renamed_filename"));
				profileSNS.setHeaderOriginalFilename(rset.getString("header_original_filename"));
				profileSNS.setHeaderRenamedFilename(rset.getString("header_renamed_filename"));
				profileSNS.setHeaderText(rset.getString("header_text"));
				profileSNS.setThemeColor(rset.getString("theme_color"));
		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return profileSNS;
	}

	public int updateHeaderText(Connection conn, String userId, String headerText) {
		ProfileSNS profileSNS = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateHeaderText");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, headerText);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNickName(Connection conn, String userId, String nickname) {
		ProfileSNS profileSNS = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateNickName");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateIntro(Connection conn, String userId, String intro) {
		ProfileSNS profileSNS = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateIntro");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, intro);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertBoardSNS(Connection conn, BoardSNS boardSNS) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoardSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, boardSNS.getBoardWriter());
			pstmt.setString(2, boardSNS.getBoardContent());
			pstmt.setString(3, boardSNS.getBoardType());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectBoardSNSLastSeq(Connection conn) {
		PreparedStatement pstmt = null;
		int boardNo = 0;
		ResultSet rset = null;
		String sql = "select seq_board_no.currval from dual";
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				boardNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return boardNo;
	}

	public int insertImage(Connection conn, List<ImageSNS> imageSNSList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertImage");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			for(ImageSNS is : imageSNSList) {
			
				pstmt.setInt(1, is.getBoardNo());
				pstmt.setString(2, is.getBoardWriter());
				pstmt.setString(3, is.getOriginalFileName());
				pstmt.setString(4, is.getRenamedFileName());
				pstmt.setInt(5, is.getImageOrder());
			
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertGrade(Connection conn, List<GradeSNS> gradeSNSList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertGrade");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			for(GradeSNS gs : gradeSNSList) {
			
				pstmt.setInt(1, gs.getBoardNo());
				pstmt.setString(2, gs.getBoardWriter());
				pstmt.setString(3, gs.getContentId());
				pstmt.setString(4, gs.getContentType());
				pstmt.setInt(5, gs.getGrade());
			
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
}
