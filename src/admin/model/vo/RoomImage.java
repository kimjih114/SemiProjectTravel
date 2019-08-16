package admin.model.vo;

public class RoomImage {
	
	private String contentId;
	private String roomName;
	private String originalFileName1;
	private String renameFileName1;
	private String originalFileName2;
	private String renameFileName2;
	private String originalFileName3;
	private String renameFileName3;
	public RoomImage() {
		// TODO Auto-generated constructor stub
	}
	public RoomImage(String contentId, String roomName, String originalFileName1, String renameFileName1,
			String originalFileName2, String renameFileName2, String originalFileName3, String renameFileName3) {
		super();
		this.contentId = contentId;
		this.roomName = roomName;
		this.originalFileName1 = originalFileName1;
		this.renameFileName1 = renameFileName1;
		this.originalFileName2 = originalFileName2;
		this.renameFileName2 = renameFileName2;
		this.originalFileName3 = originalFileName3;
		this.renameFileName3 = renameFileName3;
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
	public String getOriginalFileName1() {
		return originalFileName1;
	}
	public void setOriginalFileName1(String originalFileName1) {
		this.originalFileName1 = originalFileName1;
	}
	public String getRenameFileName1() {
		return renameFileName1;
	}
	public void setRenameFileName1(String renameFileName1) {
		this.renameFileName1 = renameFileName1;
	}
	public String getOriginalFileName2() {
		return originalFileName2;
	}
	public void setOriginalFileName2(String originalFileName2) {
		this.originalFileName2 = originalFileName2;
	}
	public String getRenameFileName2() {
		return renameFileName2;
	}
	public void setRenameFileName2(String renameFileName2) {
		this.renameFileName2 = renameFileName2;
	}
	public String getOriginalFileName3() {
		return originalFileName3;
	}
	public void setOriginalFileName3(String originalFileName3) {
		this.originalFileName3 = originalFileName3;
	}
	public String getRenameFileName3() {
		return renameFileName3;
	}
	public void setRenameFileName3(String renameFileName3) {
		this.renameFileName3 = renameFileName3;
	}
	@Override
	public String toString() {
		return "RoomImage [contentId=" + contentId + ", roomName=" + roomName + ", originalFileName1="
				+ originalFileName1 + ", renameFileName1=" + renameFileName1 + ", originalFileName2="
				+ originalFileName2 + ", renameFileName2=" + renameFileName2 + ", originalFileName3="
				+ originalFileName3 + ", renameFileName3=" + renameFileName3 + "]";
	}
	
}
