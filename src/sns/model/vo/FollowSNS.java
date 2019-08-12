package sns.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class FollowSNS {

	private String userFollowing; 
	private String userFollowed;
	private Timestamp userFollowDate;
	public FollowSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FollowSNS(String userFollowing, String userFollowed, Timestamp userFollowDate) {
		super();
		this.userFollowing = userFollowing;
		this.userFollowed = userFollowed;
		this.userFollowDate = userFollowDate;
	}
	public String getUserFollowing() {
		return userFollowing;
	}
	public void setUserFollowing(String userFollowing) {
		this.userFollowing = userFollowing;
	}
	public String getUserFollowed() {
		return userFollowed;
	}
	public void setUserFollowed(String userFollowed) {
		this.userFollowed = userFollowed;
	}
	public Timestamp getUserFollowDate() {
		return userFollowDate;
	}
	public void setUserFollowDate(Timestamp userFollowDate) {
		this.userFollowDate = userFollowDate;
	}
	@Override
	public String toString() {
		return "FollowSNS [userFollowing=" + userFollowing + ", userFollowed=" + userFollowed + ", userFollowDate="
				+ userFollowDate + "]";
	}
	
	
}
