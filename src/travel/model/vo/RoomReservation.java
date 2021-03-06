package travel.model.vo;

import java.sql.Date;

public class RoomReservation {

	private String userId;
	private String contentId;
	private String contentTypeId;
	private String travelName;
	private String roomName;
	private String reservationStartDate;
	private String reservationEndDate;
	private String friendId;
	private Date paymentDate;
	private int price;
	private Date delDate;
	public RoomReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RoomReservation(String userId, String contentId, String travelName, String roomName,
			String reservationStartDate, String reservationEndDate, String friendId, Date paymentDate, int price) {
		super();
		this.userId = userId;
		this.contentId = contentId;
		this.travelName = travelName;
		this.roomName = roomName;
		this.reservationStartDate = reservationStartDate;
		this.reservationEndDate = reservationEndDate;
		this.friendId = friendId;
		this.paymentDate = paymentDate;
		this.price = price;
	}
	
	public RoomReservation(String userId, String contentId, String travelName, String roomName,
			String reservationStartDate, String reservationEndDate, String friendId, Date paymentDate, int price, Date delDate) {
		super();
		this.userId = userId;
		this.contentId = contentId;
		this.travelName = travelName;
		this.roomName = roomName;
		this.reservationStartDate = reservationStartDate;
		this.reservationEndDate = reservationEndDate;
		this.friendId = friendId;
		this.paymentDate = paymentDate;
		this.price = price;
		this.delDate=delDate;
	}
	
	public RoomReservation(String userId, String contentId, String contentTypeId ,String travelName, String roomName,
			String reservationStartDate, String reservationEndDate, int price) {
		super();
		this.userId = userId;
		this.contentId = contentId;
		this.contentTypeId=contentTypeId;
		this.travelName = travelName;
		this.roomName = roomName;
		this.reservationStartDate = reservationStartDate;
		this.reservationEndDate = reservationEndDate;
		this.price = price;
		
	}
	
	public String getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getTravelName() {
		return travelName;
	}
	public void setTravelName(String travelName) {
		this.travelName = travelName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getReservationStartDate() {
		return reservationStartDate;
	}
	public void setReservationStartDate(String reservationStartDate) {
		this.reservationStartDate = reservationStartDate;
	}
	public String getReservationEndDate() {
		return reservationEndDate;
	}
	public void setReservationEndDate(String reservationEndDate) {
		this.reservationEndDate = reservationEndDate;
	}
	public String getFriendId() {
		return friendId;
	}
	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getDelDate() {
		return delDate;
	}
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	@Override
	public String toString() {
		return "RoomReservation [userId=" + userId + ", contentId=" + contentId + ", contentTypeId=" + contentTypeId
				+ ", travelName=" + travelName + ", roomName=" + roomName + ", reservationStartDate="
				+ reservationStartDate + ", reservationEndDate=" + reservationEndDate + ", friendId=" + friendId
				+ ", paymentDate=" + paymentDate + ", price=" + price + ", delDate=" + delDate + "]";
	}
	
	
	
	
	
}
