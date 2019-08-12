package sns.model.vo;

import java.io.Serializable;

public class ProfileSNS implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userId;
    private String userNickname;
    private String userIntroduce;
    private String profileOriginalFilename;
    private String profileRenamedFilename;
    private String headerOriginalFilename;
    private String headerRenamedFilename;
    private String headerText;
    private String themeColor;
    
	public ProfileSNS() {
		super();
	}
	public ProfileSNS(String userId, String userNickname, String userIntroduce, String headerOriginalFilename,
			String headerRenamedFilename, String headerText, String themeColor) {
		super();
		this.userId = userId;
		this.userNickname = userNickname;
		this.userIntroduce = userIntroduce;
		this.headerOriginalFilename = headerOriginalFilename;
		this.headerRenamedFilename = headerRenamedFilename;
		this.headerText = headerText;
		this.themeColor = themeColor;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserIntroduce() {
		return userIntroduce;
	}
	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}
	public String getHeaderOriginalFilename() {
		return headerOriginalFilename;
	}
	public void setHeaderOriginalFilename(String headerOriginalFilename) {
		this.headerOriginalFilename = headerOriginalFilename;
	}
	public String getHeaderRenamedFilename() {
		return headerRenamedFilename;
	}
	public void setHeaderRenamedFilename(String headerRenamedFilename) {
		this.headerRenamedFilename = headerRenamedFilename;
	}
	public String getHeaderText() {
		return headerText;
	}
	public void setHeaderText(String headerText) {
		this.headerText = headerText;
	}
	public String getThemeColor() {
		return themeColor;
	}
	public void setThemeColor(String themeColor) {
		this.themeColor = themeColor;
	}
	@Override
	public String toString() {
		return "ProfileSNS [userId=" + userId + ", userNickname=" + userNickname + ", userIntroduce=" + userIntroduce
				+ ", headerOriginalFilename=" + headerOriginalFilename + ", headerRenamedFilename="
				+ headerRenamedFilename + ", headerText=" + headerText + ", themeColor=" + themeColor + "]";
	}
	public String getProfileOriginalFilename() {
		return profileOriginalFilename;
	}
	public void setProfileOriginalFilename(String profileOriginalFilename) {
		this.profileOriginalFilename = profileOriginalFilename;
	}
	public String getProfileRenamedFilename() {
		return profileRenamedFilename;
	}
	public void setProfileRenamedFilename(String profileRenamedFilename) {
		this.profileRenamedFilename = profileRenamedFilename;
	}
    
    
    
}