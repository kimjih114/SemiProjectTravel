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

import sns.model.vo.BoardSNS;
import sns.model.vo.CommentSNS;
import sns.model.vo.FollowSNS;
import sns.model.vo.GradeSNS;
import sns.model.vo.ImageSNS;
import sns.model.vo.LikeSNS;
import sns.model.vo.ProfileSNS;

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
				
				profileSNS.setProfileUserId(rset.getString("profile_user_id"));
				profileSNS.setProfileUserNickname(rset.getString("profile_user_nickname"));
				profileSNS.setProfileUserIntroduce(rset.getString("profile_user_introduce"));
				profileSNS.setProfileUserType(rset.getString("profile_user_type"));
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
				pstmt.setString(5, gs.getContentThumbnail());
				pstmt.setString(6, gs.getContentTitle());
				pstmt.setString(7, gs.getContentAddress());
				pstmt.setInt(8, gs.getGrade());
				pstmt.setInt(9, gs.getGradeOrder());
			
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int follow(Connection conn, String userFollowing, String userFollowed) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("follow");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userFollowing);
			pstmt.setString(2, userFollowed);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int unFollow(Connection conn, String userFollowing, String userFollowed) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("unFollow");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userFollowing);
			pstmt.setString(2, userFollowed);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public List<String> selectOneIdFollow(Connection conn, String userFollowing) {
		List<String> followOneList=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectOneIdFollow");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userFollowing);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				followOneList.add(rset.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return followOneList;
	}

	public List<ProfileSNS> selectOneProfileFollow(Connection conn, List<String> followOneList) {
		List<ProfileSNS> followProfileList=new ArrayList<ProfileSNS>();
		ProfileSNS profileSNS = null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectOneProfile");
		
		try {
				pstmt=conn.prepareStatement(sql);
				
				for(String userId : followOneList) {
					pstmt.setString(1, userId);
					
					rset=pstmt.executeQuery();
					
					while(rset.next()) {
						profileSNS = new ProfileSNS();
						
						profileSNS.setProfileUserId(rset.getString("profile_user_id"));
						profileSNS.setProfileUserNickname(rset.getString("profile_user_nickname"));
						profileSNS.setProfileUserIntroduce(rset.getString("profile_user_introduce"));
						profileSNS.setProfileUserType(rset.getString("profile_user_type"));
						profileSNS.setProfileOriginalFilename(rset.getString("profile_original_filename"));
						profileSNS.setProfileRenamedFilename(rset.getString("profile_renamed_filename"));
						profileSNS.setHeaderOriginalFilename(rset.getString("header_original_filename"));
						profileSNS.setHeaderRenamedFilename(rset.getString("header_renamed_filename"));
						profileSNS.setHeaderText(rset.getString("header_text"));
						profileSNS.setThemeColor(rset.getString("theme_color"));
						
						followProfileList.add(profileSNS);
					}
					
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
			
		return followProfileList;
	}

	public List<String> selectOneIdFollower(Connection conn, String userfollowed, List<String> followOneList) {
		List<String> followerOneList=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectOneIdFollower");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			for(String userFollowing : followOneList) {
				pstmt.setString(1, userFollowing);
				pstmt.setString(2, userfollowed);
				
				rset=pstmt.executeQuery();
				
				while(rset.next()) {
					followerOneList.add(rset.getString(1));
				}
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return followerOneList;
	}

	public List<String> selectOneIdFollowed(Connection conn, String userLoggedIn) {
		List<String> followedOneList=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectOneIdFollowed");
	
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userLoggedIn);

			rset=pstmt.executeQuery();
				
			while(rset.next()) {
				followedOneList.add(rset.getString(1));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return followedOneList;
	}

	public int selectBoardSNSCnt(Connection conn, String userId) {
		int totalContents = 0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectBoardSNSCnt");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContents = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
	}

	public List<BoardSNS> selectBoardSNSMore(Connection conn, String mypage, int boardNo, int numPerPage) {
		List<BoardSNS> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardSNSMore");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mypage);
			pstmt.setInt(2, boardNo);
			pstmt.setInt(3, 1);
			pstmt.setInt(4, numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardSNS bs = new BoardSNS();

				bs.setBoardNo(rset.getInt("board_no"));
				bs.setBoardWriter(rset.getString("board_writer"));
				bs.setBoardContent(rset.getString("board_content"));
				bs.setBoardType(rset.getString("board_type"));
				bs.setBoardUpdateDate(rset.getTimestamp("board_update_date"));
				bs.setBoardDate(rset.getTimestamp("board_date"));
				
				list.add(bs);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public List<ImageSNS> selectImageSNS(Connection conn, int boardNo) {
		List<ImageSNS> list = new ArrayList<>();
		ImageSNS is = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectImageSNS");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		
			pstmt.setInt(1,boardNo);
			rset = pstmt.executeQuery();
				
			while(rset.next()) {
				is = new ImageSNS();
					
				is.setBoardNo(rset.getInt("board_no"));
				is.setBoardWriter(rset.getString("board_writer"));
				is.setOriginalFileName(rset.getString("original_file_name"));
				is.setRenamedFileName(rset.getString("renamed_file_name"));
				is.setImageOrder(rset.getInt("image_order"));
				is.setImageDate(rset.getTimestamp("image_date"));
					
				list.add(is);
				
			}
			
		
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public List<GradeSNS> selectGradeSNS(Connection conn, int boardNo) {
		List<GradeSNS> list = new ArrayList<>();
		GradeSNS gs = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectGradeSNS");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		
			pstmt.setInt(1,boardNo);
			rset = pstmt.executeQuery();
				
			while(rset.next()) {
				gs = new GradeSNS();
				
				gs.setBoardNo(rset.getInt("board_no"));
				gs.setBoardWriter(rset.getString("user_id"));
				gs.setContentId(rset.getString("content_id"));
				gs.setContentType(rset.getString("content_type"));
				gs.setContentThumbnail(rset.getString("content_thumbnail"));
				gs.setContentTitle(rset.getString("content_title"));
				gs.setContentAddress(rset.getString("content_address"));
				gs.setGrade(rset.getInt("grade"));
				gs.setGradeDate(rset.getTimestamp("grade_date"));
					
				list.add(gs);
				
			}
			
		
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int block(Connection conn, String userBlocking, String userBlocked) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("block");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userBlocking);
			pstmt.setString(2, userBlocked);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<String> selectOneIdBlock(Connection conn, String userBlocking) {
		List<String> blockOneList=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectOneIdBlock");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userBlocking);

			rset=pstmt.executeQuery();
				
			while(rset.next()) {
				blockOneList.add(rset.getString(2));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return blockOneList;
	}

	public int unblock(Connection conn, String userBlocking, String userBlocked) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("unblock");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userBlocking);
			pstmt.setString(2, userBlocked);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<LikeSNS> selectLikeSNS(Connection conn, int boardNo) {
		List<LikeSNS> likeSNSList=new ArrayList<>();
		LikeSNS likeSNS = null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectLikeSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);

			rset=pstmt.executeQuery();
				
			while(rset.next()) {
				likeSNS = new LikeSNS();
				
				likeSNS.setBoardNo(boardNo);
				likeSNS.setUserId(rset.getString("user_id"));
				likeSNS.setLikeDate(rset.getTimestamp("like_date"));
				
				likeSNSList.add(likeSNS);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return likeSNSList;
	}

	public List<CommentSNS> selectCommentSNS(Connection conn, int boardNo) {
		List<CommentSNS> commentSNSList=new ArrayList<>();
		CommentSNS commentSNS = null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectCommentSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);

			rset=pstmt.executeQuery();
				
			while(rset.next()) {
				commentSNS = new CommentSNS();
				
				commentSNS.setBoardNo(rset.getInt("board_no"));
				commentSNS.setCommentLevel(rset.getInt("comment_level"));
				commentSNS.setCommentWriter(rset.getString("comment_writer"));
				commentSNS.setCommentContent(rset.getString("comment_content"));
				commentSNS.setBoardNo(boardNo);
				commentSNS.setCommentRef(rset.getInt("comment_ref"));
				commentSNS.setCommentDate(rset.getTimestamp("comment_date"));
				
				commentSNSList.add(commentSNS);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return commentSNSList;
	}

	public List<String> selectOneIdBlocked(Connection conn, String userBlocked) {
		List<String> blockedOneList=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectOneIdBlocked");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userBlocked);

			rset=pstmt.executeQuery();
				
			while(rset.next()) {
				blockedOneList.add(rset.getString(1));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return blockedOneList;
	}

	public int selectLastBoardNo(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectLastBoardNo");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);

			rset=pstmt.executeQuery();
				
			if(rset.next()) {
				result = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoardSNS(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteBoardSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<String> selectRenamedFileNames(Connection conn, int boardNo) {
		List<String> list=new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectRenamedFileNames");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);

			rset=pstmt.executeQuery();
				
			while(rset.next()) {
				list.add(rset.getString(1));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public BoardSNS selectBoardSNS(Connection conn, int boardNo) {
		BoardSNS boardSNS = null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectBoardSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);

			rset=pstmt.executeQuery();
				
			if(rset.next()) {
				boardSNS = new BoardSNS();
				
				boardSNS.setBoardNo(boardNo);
				boardSNS.setBoardWriter(rset.getString("board_writer"));
				boardSNS.setBoardContent(rset.getString("board_content"));
				boardSNS.setBoardType(rset.getString("board_type"));
				boardSNS.setBoardUpdateDate(rset.getTimestamp("board_date"));	
				boardSNS.setBoardDate(rset.getTimestamp("board_date"));	
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return boardSNS;
	}

	public int updateBoardSNS(Connection conn, int boardNo, BoardSNS boardSNS) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateBoardSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, boardSNS.getBoardContent());
			pstmt.setString(2, boardSNS.getBoardType());
			pstmt.setInt(3, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteImageSNS(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteImageSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteGradeSNS(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteGradeSNS");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
}

