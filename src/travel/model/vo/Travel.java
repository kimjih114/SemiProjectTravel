package travel.model.vo;

import java.sql.Date;

public class Travel {
	private int travelNo;
	private String userId;
	private String travelName;
	private String oldProfileName;
	private String newProfileName;
	private String travelContent;
	private Date travelEnrolldate;
	private int viewCount;
	private int like;
	private int grade;
	private String travelAddress;
	public Travel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Travel(int travelNo, String userId, String travelName, String oldProfileName, String newProfileName,
			String travelContent, Date travelEnrolldate, int viewCount, int like, int grade, String travelAddress) {
		super();
		this.travelNo = travelNo;
		this.userId = userId;
		this.travelName = travelName;
		this.oldProfileName = oldProfileName;
		this.newProfileName = newProfileName;
		this.travelContent = travelContent;
		this.travelEnrolldate = travelEnrolldate;
		this.viewCount = viewCount;
		this.like = like;
		this.grade = grade;
		this.travelAddress = travelAddress;
	}
	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(int travelNo) {
		this.travelNo = travelNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTravelName() {
		return travelName;
	}
	public void setTravelName(String travelName) {
		this.travelName = travelName;
	}
	public String getOldProfileName() {
		return oldProfileName;
	}
	public void setOldProfileName(String oldProfileName) {
		this.oldProfileName = oldProfileName;
	}
	public String getNewProfileName() {
		return newProfileName;
	}
	public void setNewProfileName(String newProfileName) {
		this.newProfileName = newProfileName;
	}
	public String getTravelContent() {
		return travelContent;
	}
	public void setTravelContent(String travelContent) {
		this.travelContent = travelContent;
	}
	public Date getTravelEnrolldate() {
		return travelEnrolldate;
	}
	public void setTravelEnrolldate(Date travelEnrolldate) {
		this.travelEnrolldate = travelEnrolldate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getTravelAddress() {
		return travelAddress;
	}
	public void setTravelAddress(String travelAddress) {
		this.travelAddress = travelAddress;
	}
	@Override
	public String toString() {
		return "Travel [travelNo=" + travelNo + ", userId=" + userId + ", travelName=" + travelName
				+ ", oldProfileName=" + oldProfileName + ", newProfileName=" + newProfileName + ", travelContent="
				+ travelContent + ", travelEnrolldate=" + travelEnrolldate + ", viewCount=" + viewCount + ", like="
				+ like + ", grade=" + grade + ", travelAddress=" + travelAddress + "]";
	}
}
