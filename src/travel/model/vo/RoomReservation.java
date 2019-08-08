package travel.model.vo;

public class RoomReservation {

	private String userId;
	private String contentId;
	private String roomName;
	private String reservationDate;
	private String friendId;
	public RoomReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoomReservation(String userId, String contentId, String roomName, String reservationDate, String friendId) {
		super();
		this.userId = userId;
		this.contentId = contentId;
		this.roomName = roomName;
		this.reservationDate = reservationDate;
		this.friendId = friendId;
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getFriendId() {
		return friendId;
	}
	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}
	@Override
	public String toString() {
		return "RoomReservation [userId=" + userId + ", contentId=" + contentId + ", roomName=" + roomName
				+ ", reservationDate=" + reservationDate + ", friendId=" + friendId + "]";
	}
	
}
