package sns.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class GradeSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int boardNo;
	private String boardWriter;
	private String contentId;
	private String contentType;
	private String contentThumbnail;
	private String contentTitle;
	private String contentAddress;
	private int grade;
	private int gradeOrder;
	private Timestamp gradeDate;
	public GradeSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GradeSNS(int boardNo, String boardWriter, String contentId, String contentType, String contentThumbnail,
			String contentTitle, String contentAddress, int grade, int gradeOrder, Timestamp gradeDate) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.contentId = contentId;
		this.contentType = contentType;
		this.contentThumbnail = contentThumbnail;
		this.contentTitle = contentTitle;
		this.contentAddress = contentAddress;
		this.grade = grade;
		this.gradeOrder = gradeOrder;
		this.gradeDate = gradeDate;
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
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getContentThumbnail() {
		return contentThumbnail;
	}
	public void setContentThumbnail(String contentThumbnail) {
		this.contentThumbnail = contentThumbnail;
	}
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	public String getContentAddress() {
		return contentAddress;
	}
	public void setContentAddress(String contentAddress) {
		this.contentAddress = contentAddress;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getGradeOrder() {
		return gradeOrder;
	}
	public void setGradeOrder(int gradeOrder) {
		this.gradeOrder = gradeOrder;
	}
	public Timestamp getGradeDate() {
		return gradeDate;
	}
	public void setGradeDate(Timestamp gradeDate) {
		this.gradeDate = gradeDate;
	}
	@Override
	public String toString() {
		return "GradeSNS [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", contentId=" + contentId
				+ ", contentType=" + contentType + ", contentThumbnail=" + contentThumbnail + ", contentTitle="
				+ contentTitle + ", contentAddress=" + contentAddress + ", grade=" + grade + ", gradeOrder="
				+ gradeOrder + ", gradeDate=" + gradeDate + "]";
	}
	
	
	
}
