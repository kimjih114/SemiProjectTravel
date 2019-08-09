package sns.model.vo;

import java.sql.Date;

public class FollowSNS {

	private String userFollowing; 
	private String userFollowed;
	private Date userFollowDate;
	public FollowSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FollowSNS(String userFollowing, String userFollowed, Date userFollowDate) {
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
	public Date getUserFollowDate() {
		return userFollowDate;
	}
	public void setUserFollowDate(Date userFollowDate) {
		this.userFollowDate = userFollowDate;
	}
	@Override
	public String toString() {
		return "FollowSNS [userFollowing=" + userFollowing + ", userFollowed=" + userFollowed + ", userFollowDate="
				+ userFollowDate + "]";
	}
	
	
}
