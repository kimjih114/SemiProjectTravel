package admin.model.vo;

public class AdminRoom {
	    
	 private String contentId;
	 private String roomName;
	 private int roomWeekDayHighPrice;
	 private int roomWeekDayLowPrice;
	 private int roomWeekEndHighPrice;
	 private int roomWeekEndLowPrice;
	 private String roomSize;
	 private String roomPerson;
	 private String content;
	 public AdminRoom() {
		
	}
	public AdminRoom(String contentId, String roomName, int roomWeekDayHighPrice, int roomWeekDayLowPrice,
			int roomWeekEndHighPrice, int roomWeekEndLowPrice, String roomSize, String roomPerson, String content) {
		super();
		this.contentId = contentId;
		this.roomName = roomName;
		this.roomWeekDayHighPrice = roomWeekDayHighPrice;
		this.roomWeekDayLowPrice = roomWeekDayLowPrice;
		this.roomWeekEndHighPrice = roomWeekEndHighPrice;
		this.roomWeekEndLowPrice = roomWeekEndLowPrice;
		this.roomSize = roomSize;
		this.roomPerson = roomPerson;
		this.content = content;
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
	public int getRoomWeekDayHighPrice() {
		return roomWeekDayHighPrice;
	}
	public void setRoomWeekDayHighPrice(int roomWeekDayHighPrice) {
		this.roomWeekDayHighPrice = roomWeekDayHighPrice;
	}
	public int getRoomWeekDayLowPrice() {
		return roomWeekDayLowPrice;
	}
	public void setRoomWeekDayLowPrice(int roomWeekDayLowPrice) {
		this.roomWeekDayLowPrice = roomWeekDayLowPrice;
	}
	public int getRoomWeekEndHighPrice() {
		return roomWeekEndHighPrice;
	}
	public void setRoomWeekEndHighPrice(int roomWeekEndHighPrice) {
		this.roomWeekEndHighPrice = roomWeekEndHighPrice;
	}
	public int getRoomWeekEndLowPrice() {
		return roomWeekEndLowPrice;
	}
	public void setRoomWeekEndLowPrice(int roomWeekEndLowPrice) {
		this.roomWeekEndLowPrice = roomWeekEndLowPrice;
	}
	public String getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}
	public String getRoomPerson() {
		return roomPerson;
	}
	public void setRoomPerson(String roomPerson) {
		this.roomPerson = roomPerson;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "AdminRoom [contentId=" + contentId + ", roomName=" + roomName + ", roomWeekDayHighPrice="
				+ roomWeekDayHighPrice + ", roomWeekDayLowPrice=" + roomWeekDayLowPrice + ", roomWeekEndHighPrice="
				+ roomWeekEndHighPrice + ", roomWeekEndLowPrice=" + roomWeekEndLowPrice + ", roomSize=" + roomSize
				+ ", roomPerson=" + roomPerson + ", content=" + content + "]";
	}
	 
}
