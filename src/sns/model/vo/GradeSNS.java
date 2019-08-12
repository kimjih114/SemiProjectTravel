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
	private int grade;
	private Timestamp gradeDate;
	public GradeSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GradeSNS(int boardNo, String boardWriter, String contentId, String contenttype, int grade, Timestamp gradeDate) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.contentId = contentId;
		this.contentType = contenttype;
		this.grade = grade;
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
	public void setContentType(String contenttype) {
		this.contentType = contenttype;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
				+ ", contenttype=" + contentType + ", grade=" + grade + ", gradeDate=" + gradeDate + "]";
	}
	
}
