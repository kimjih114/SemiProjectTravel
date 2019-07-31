package travel.model.vo;

import java.sql.Date;

public class TravelFood {
	private int foodNo;
	private String userId;
	private String foodName;
	private String oldProfileName;
	private String newProfileName;
	private String foodContent;
	private Date foodEnrolldate;
	private int viewCount;
	private int like;
	private int grade;
	private String foodAddress;
	
	public TravelFood() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TravelFood(int foodNo, String userId, String foodName, String oldProfileName, String newProfileName,
			String foodContent, Date foodEnrolldate, int viewCount, int like, int grade, String foodAddress) {
		super();
		this.foodNo = foodNo;
		this.userId = userId;
		this.foodName = foodName;
		this.oldProfileName = oldProfileName;
		this.newProfileName = newProfileName;
		this.foodContent = foodContent;
		this.foodEnrolldate = foodEnrolldate;
		this.viewCount = viewCount;
		this.like = like;
		this.grade = grade;
		this.foodAddress = foodAddress;
	}
	public int getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
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
	public String getFoodContent() {
		return foodContent;
	}
	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}
	public Date getFoodEnrolldate() {
		return foodEnrolldate;
	}
	public void setFoodEnrolldate(Date foodEnrolldate) {
		this.foodEnrolldate = foodEnrolldate;
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
	public String getFoodAddress() {
		return foodAddress;
	}
	public void setFoodAddress(String foodAddress) {
		this.foodAddress = foodAddress;
	}
	@Override
	public String toString() {
		return "TravelFood [foodNo=" + foodNo + ", userId=" + userId + ", foodName=" + foodName + ", oldProfileName="
				+ oldProfileName + ", newProfileName=" + newProfileName + ", foodContent=" + foodContent
				+ ", foodEnrolldate=" + foodEnrolldate + ", viewCount=" + viewCount + ", like=" + like + ", grade="
				+ grade + ", foodAddress=" + foodAddress + "]";
	}
	
}
