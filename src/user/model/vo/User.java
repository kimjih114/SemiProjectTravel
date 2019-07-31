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
	private String userPassword;
	private String userName;
	private String userGender;
	private Date userBirth;
	private String userEmail;
	private String userPhone;
	private String userOldFileName;
	private String useeNewFileName;
	
	private String userType;
	
	private String userDefaultPlace;
	private String userDefaultActivity;
	private String userSellerPlace;
	private String userSellerProductType;
	
	private Date ueserEnrollDate;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String userPassword, String userName, String userGender, Date userBirth,
			String userEmail, String userPhone, String userOldFileName, String useeNewFileName, String userType,
			String userDefaultPlace, String userDefaultActivity, String userSellerPlace, String userSellerProductType,
			Date ueserEnrollDate) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userOldFileName = userOldFileName;
		this.useeNewFileName = useeNewFileName;
		this.userType = userType;
		this.userDefaultPlace = userDefaultPlace;
		this.userDefaultActivity = userDefaultActivity;
		this.userSellerPlace = userSellerPlace;
		this.userSellerProductType = userSellerProductType;
		this.ueserEnrollDate = ueserEnrollDate;
	}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getUserOldFileName() {
		return userOldFileName;
	}

	public void setUserOldFileName(String userOldFileName) {
		this.userOldFileName = userOldFileName;
	}

	public String getUseeNewFileName() {
		return useeNewFileName;
	}

	public void setUseeNewFileName(String useeNewFileName) {
		this.useeNewFileName = useeNewFileName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserDefaultPlace() {
		return userDefaultPlace;
	}

	public void setUserDefaultPlace(String userDefaultPlace) {
		this.userDefaultPlace = userDefaultPlace;
	}

	public String getUserDefaultActivity() {
		return userDefaultActivity;
	}

	public void setUserDefaultActivity(String userDefaultActivity) {
		this.userDefaultActivity = userDefaultActivity;
	}

	public String getUserSellerPlace() {
		return userSellerPlace;
	}

	public void setUserSellerPlace(String userSellerPlace) {
		this.userSellerPlace = userSellerPlace;
	}

	public String getUserSellerProductType() {
		return userSellerProductType;
	}

	public void setUserSellerProductType(String userSellerProductType) {
		this.userSellerProductType = userSellerProductType;
	}

	public Date getUeserEnrollDate() {
		return ueserEnrollDate;
	}

	public void setUeserEnrollDate(Date ueserEnrollDate) {
		this.ueserEnrollDate = ueserEnrollDate;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", userGender=" + userGender + ", userBirth=" + userBirth + ", userEmail=" + userEmail
				+ ", userPhone=" + userPhone + ", userOldFileName=" + userOldFileName + ", useeNewFileName="
				+ useeNewFileName + ", userType=" + userType + ", userDefaultPlace=" + userDefaultPlace
				+ ", userDefaultActivity=" + userDefaultActivity + ", userSellerPlace=" + userSellerPlace
				+ ", userSellerProductType=" + userSellerProductType + ", ueserEnrollDate=" + ueserEnrollDate + "]";
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println(userName+"["+userName+"]님이 로그인했습니다!");
		
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println(userName+"["+userName+"]님이 로그아웃했습니다!");
		
	}
	
	
}
