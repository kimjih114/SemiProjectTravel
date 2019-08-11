package sns.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GradeSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userId;
	private int boardNo;
	private String contentId;
	private Date gradeDate;
	public GradeSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GradeSNS(String userId, int boardNo, String contentId, Date gradeDate) {
		super();
		this.userId = userId;
		this.boardNo = boardNo;
		this.contentId = contentId;
		this.gradeDate = gradeDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public Date getGradeDate() {
		return gradeDate;
	}
	public void setGradeDate(Date gradeDate) {
		this.gradeDate = gradeDate;
	}
	@Override
	public String toString() {
		return "GradeSNS [userId=" + userId + ", boardNo=" + boardNo + ", contentId=" + contentId + ", gradeDate="
				+ gradeDate + "]";
	}
	
	
}
