package sns.model.vo;

import java.io.Serializable;

public class ProfileSNS implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String profileUserId;
    private String profileUserNickname;
    private String profileUserIntroduce;
    private String profileUserType;
    private String profileOriginalFilename;
    private String profileRenamedFilename;
    private String headerOriginalFilename;
    private String headerRenamedFilename;
    private String headerText;
    private String themeColor;
	public ProfileSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProfileSNS(String profileUserId, String profileUserNickname, String profileUserIntroduce,
			String profileUserType, String profileOriginalFilename, String profileRenamedFilename,
			String headerOriginalFilename, String headerRenamedFilename, String headerText, String themeColor) {
		super();
		this.profileUserId = profileUserId;
		this.profileUserNickname = profileUserNickname;
		this.profileUserIntroduce = profileUserIntroduce;
		this.profileUserType = profileUserType;
		this.profileOriginalFilename = profileOriginalFilename;
		this.profileRenamedFilename = profileRenamedFilename;
		this.headerOriginalFilename = headerOriginalFilename;
		this.headerRenamedFilename = headerRenamedFilename;
		this.headerText = headerText;
		this.themeColor = themeColor;
	}
	public String getProfileUserId() {
		return profileUserId;
	}
	public void setProfileUserId(String profileUserId) {
		this.profileUserId = profileUserId;
	}
	public String getProfileUserNickname() {
		return profileUserNickname;
	}
	public void setProfileUserNickname(String profileUserNickname) {
		this.profileUserNickname = profileUserNickname;
	}
	public String getProfileUserIntroduce() {
		return profileUserIntroduce;
	}
	public void setProfileUserIntroduce(String profileUserIntroduce) {
		this.profileUserIntroduce = profileUserIntroduce;
	}
	public String getProfileUserType() {
		return profileUserType;
	}
	public void setProfileUserType(String profileUserType) {
		this.profileUserType = profileUserType;
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
		return "ProfileSNS [profileUserId=" + profileUserId + ", profileUserNickname=" + profileUserNickname
				+ ", profileUserIntroduce=" + profileUserIntroduce + ", profileUserType=" + profileUserType
				+ ", profileOriginalFilename=" + profileOriginalFilename + ", profileRenamedFilename="
				+ profileRenamedFilename + ", headerOriginalFilename=" + headerOriginalFilename
				+ ", headerRenamedFilename=" + headerRenamedFilename + ", headerText=" + headerText + ", themeColor="
				+ themeColor + "]";
	}
	
    
}
