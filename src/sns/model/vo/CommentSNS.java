package sns.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class CommentSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int commentNo;
	private int commentLevel;
	private String commentWriter;
	private String commentNickname;
	private String commentProfile;
	private String commentContent;
	private int boardNo;
	private int commentRef;
	private Timestamp commentDate;
	private Timestamp commentUpdateDate;
	public CommentSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentSNS(int commentNo, int commentLevel, String commentWriter, String commentNickname,
			String commentProfile, String commentContent, int boardNo, int commentRef, Timestamp commentDate,
			Timestamp commentUpdateDate) {
		super();
		this.commentNo = commentNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentNickname = commentNickname;
		this.commentProfile = commentProfile;
		this.commentContent = commentContent;
		this.boardNo = boardNo;
		this.commentRef = commentRef;
		this.commentDate = commentDate;
		this.commentUpdateDate = commentUpdateDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getCommentLevel() {
		return commentLevel;
	}
	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public String getCommentNickname() {
		return commentNickname;
	}
	public void setCommentNickname(String commentNickname) {
		this.commentNickname = commentNickname;
	}
	public String getCommentProfile() {
		return commentProfile;
	}
	public void setCommentProfile(String commentProfile) {
		this.commentProfile = commentProfile;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCommentRef() {
		return commentRef;
	}
	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	public Timestamp getCommentUpdateDate() {
		return commentUpdateDate;
	}
	public void setCommentUpdateDate(Timestamp commentUpdateDate) {
		this.commentUpdateDate = commentUpdateDate;
	}
	@Override
	public String toString() {
		return "CommentSNS [commentNo=" + commentNo + ", commentLevel=" + commentLevel + ", commentWriter="
				+ commentWriter + ", commentNickname=" + commentNickname + ", commentProfile=" + commentProfile
				+ ", commentContent=" + commentContent + ", boardNo=" + boardNo + ", commentRef=" + commentRef
				+ ", commentDate=" + commentDate + ", commentUpdateDate=" + commentUpdateDate + "]";
	}
	
	
	
}