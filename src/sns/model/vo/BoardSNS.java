package sns.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class BoardSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int boardNo;
	private String boardWriter;
	private String boardContent;
	private String boardType;
	private Timestamp boardDate;
	private ProfileSNS profileSNS;
	private List<ImageSNS> imageSNSList; 
	private List<GradeSNS> gradeSNSList;
	public BoardSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardSNS(int boardNo, String boardWriter, String boardContent, String boardType, Timestamp boardDate,
			ProfileSNS profileSNS, List<ImageSNS> imageSNSList, List<GradeSNS> gradeSNSList) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardType = boardType;
		this.boardDate = boardDate;
		this.profileSNS = profileSNS;
		this.imageSNSList = imageSNSList;
		this.gradeSNSList = gradeSNSList;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public ProfileSNS getProfileSNS() {
		return profileSNS;
	}
	public void setProfileSNS(ProfileSNS profileSNS) {
		this.profileSNS = profileSNS;
	}
	public List<ImageSNS> getImageSNSList() {
		return imageSNSList;
	}
	public void setImageSNSList(List<ImageSNS> imageSNSList) {
		this.imageSNSList = imageSNSList;
	}
	public List<GradeSNS> getGrandeSNSList() {
		return gradeSNSList;
	}
	public void setGrandeSNSList(List<GradeSNS> gradeSNSList) {
		this.gradeSNSList = gradeSNSList;
	}
	@Override
	public String toString() {
		return "BoardSNS [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardContent=" + boardContent
				+ ", boardType=" + boardType + ", boardDate=" + boardDate + ", profileSNS=" + profileSNS
				+ ", imageSNSList=" + imageSNSList + ", grandeSNSList=" + gradeSNSList + "]";
	}
	
	
	

}
	