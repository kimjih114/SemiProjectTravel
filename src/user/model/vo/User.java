package user.model.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class User implements Serializable ,HttpSessionBindingListener{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private String userId;
	private String usernickName;
	private String userPassword;
	private String userName;
	private String userGender;
	private Date userBirth;
	private String userEmail;
	private String userPhone;
	private String fileName; 
	private String originalFileName;
	
	private String userType;
	
	private Date userEnrollDate;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String usernickName, String userPassword, String userName, String userGender,
			Date userBirth, String userEmail, String userPhone, String fileName, String originalFileName, String userType,
			 Date userEnrollDate) {
		super();
		this.userId = userId;
		this.usernickName = usernickName;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.fileName = fileName;
		this.originalFileName = originalFileName;
		this.userType = userType;
		this.userEnrollDate = userEnrollDate;
	}

	
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsernickName() {
		return usernickName;
	}

	public void setUsernickName(String usernickName) {
		this.usernickName = usernickName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public Date getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}


	public Date getUserEnrollDate() {
		return userEnrollDate;
	}

	public void setUserEnrollDate(Date userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", usernickName=" + usernickName + ", userPassword=" + userPassword
				+ ", userName=" + userName + ", userGender=" + userGender + ", userBirth=" + userBirth + ", userEmail="
				+ userEmail + ", userPhone=" + userPhone + ", fileName=" + fileName +", originalFileName= "+originalFileName+ ", userType=" + userType
				+ ", userEnrollDate=" + userEnrollDate + "]";
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

}
	

