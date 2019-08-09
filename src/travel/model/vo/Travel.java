package travel.model.vo;

import java.sql.Date;

public class Travel {

	private String contentId;
	private String travelName;
	private String travelLocation;
	private String thumbnailOriginalFilename;
	private String thumbnailRenamedFilename;
	private Date travelDate;
	private String travelContent;
	private String travelOfficierName;
	private String travelOfficierphone;
	private String travelType;
	
	public Travel() {
		super();
	
	}

	public Travel(String contentId, String travelName, String travelLocation, String thumbnailOriginalFilename,
			String thumbnailRenamedFilename, Date travelDate, String travelContent, String travelOfficierName,
			String travelOfficierphone, String travelType) {
		super();
		this.contentId = contentId;
		this.travelName = travelName;
		this.travelLocation = travelLocation;
		this.thumbnailOriginalFilename = thumbnailOriginalFilename;
		this.thumbnailRenamedFilename = thumbnailRenamedFilename;
		this.travelDate = travelDate;
		this.travelContent = travelContent;
		this.travelOfficierName = travelOfficierName;
		this.travelOfficierphone = travelOfficierphone;
		this.travelType = travelType;
	}

	
	
	public Travel(String contentId, String travelLocation, String thumbnailOriginalFilename,
			String thumbnailRenamedFilename, Date travelDate) {
		super();
		this.contentId = contentId;
		this.travelLocation = travelLocation;
		this.thumbnailOriginalFilename = thumbnailOriginalFilename;
		this.thumbnailRenamedFilename = thumbnailRenamedFilename;
		this.travelDate = travelDate;
	}

	
	
	public Travel(String contentId, String travelContent, String travelOfficierName, String travelOfficierphone) {
		super();
		this.contentId = contentId;
		this.travelContent = travelContent;
		this.travelOfficierName = travelOfficierName;
		this.travelOfficierphone = travelOfficierphone;
	}

	
	public Travel(String contentId, String travelType) {
		super();
		this.contentId = contentId;
		this.travelType = travelType;
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

	public String getTravelLocation() {
		return travelLocation;
	}

	public void setTravelLocation(String travelLocation) {
		this.travelLocation = travelLocation;
	}

	public String getThumbnailOriginalFilename() {
		return thumbnailOriginalFilename;
	}

	public void setThumbnailOriginalFilename(String thumbnailOriginalFilename) {
		this.thumbnailOriginalFilename = thumbnailOriginalFilename;
	}

	public String getThumbnailRenamedFilename() {
		return thumbnailRenamedFilename;
	}

	public void setThumbnailRenamedFilename(String thumbnailRenamedFilename) {
		this.thumbnailRenamedFilename = thumbnailRenamedFilename;
	}

	public Date getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(Date travelDate) {
		this.travelDate = travelDate;
	}

	public String getTravelContent() {
		return travelContent;
	}

	public void setTravelContent(String travelContent) {
		this.travelContent = travelContent;
	}

	public String getTravelOfficierName() {
		return travelOfficierName;
	}

	public void setTravelOfficierName(String travelOfficierName) {
		this.travelOfficierName = travelOfficierName;
	}

	public String getTravelOfficierphone() {
		return travelOfficierphone;
	}

	public void setTravelOfficierphone(String travelOfficierphone) {
		this.travelOfficierphone = travelOfficierphone;
	}

	public String getTravelType() {
		return travelType;
	}

	public void setTravelType(String travelType) {
		this.travelType = travelType;
	}

	@Override
	public String toString() {
		return "Travel [contentId=" + contentId + ", travelName="+travelName+", travelLocation=" + travelLocation + ", thumbnailOriginalFilename="
				+ thumbnailOriginalFilename + ", thumbnailRenamedFilename=" + thumbnailRenamedFilename + ", travelDate="
				+ travelDate + ", travelContent=" + travelContent + ", travelOfficierName=" + travelOfficierName
				+ ", travelOfficierphone=" + travelOfficierphone + ", travelType=" + travelType + "]";
	}
	
	
	
}
