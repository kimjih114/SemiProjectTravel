package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board_QuestionComment implements Serializable{

	private int qboardComment_no ;
	private int qboardCommentLevel; 
	private String qboardCommentWriter; 
	private String qboardCommentContent; 
	private int qboardref; 
	private int qboardCommentRef; 
	private Date qboardCommentDate;
	public Board_QuestionComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board_QuestionComment(int qboardComment_no, int qboardCommentLevel, String qboardCommentWriter,
			String qboardCommentContent, int qboardref, int qboardCommentRef, Date qboardCommentDate) {
		super();
		this.qboardComment_no = qboardComment_no;
		this.qboardCommentLevel = qboardCommentLevel;
		this.qboardCommentWriter = qboardCommentWriter;
		this.qboardCommentContent = qboardCommentContent;
		this.qboardref = qboardref;
		this.qboardCommentRef = qboardCommentRef;
		this.qboardCommentDate = qboardCommentDate;
	}
	public int getQboardComment_no() {
		return qboardComment_no;
	}
	public void setQboardComment_no(int qboardComment_no) {
		this.qboardComment_no = qboardComment_no;
	}
	public int getQboardCommentLevel() {
		return qboardCommentLevel;
	}
	public void setQboardCommentLevel(int qboardCommentLevel) {
		this.qboardCommentLevel = qboardCommentLevel;
	}
	public String getQboardCommentWriter() {
		return qboardCommentWriter;
	}
	public void setQboardCommentWriter(String qboardCommentWriter) {
		this.qboardCommentWriter = qboardCommentWriter;
	}
	public String getQboardCommentContent() {
		return qboardCommentContent;
	}
	public void setQboardCommentContent(String qboardCommentContent) {
		this.qboardCommentContent = qboardCommentContent;
	}
	public int getQboardref() {
		return qboardref;
	}
	public void setQboardref(int qboardref) {
		this.qboardref = qboardref;
	}
	public int getQboardCommentRef() {
		return qboardCommentRef;
	}
	public void setQboardCommentRef(int qboardCommentRef) {
		this.qboardCommentRef = qboardCommentRef;
	}
	public Date getQboardCommentDate() {
		return qboardCommentDate;
	}
	public void setQboardCommentDate(Date qboardCommentDate) {
		this.qboardCommentDate = qboardCommentDate;
	}
	
	
	
	@Override
	public String toString() {
		return "Board_QuestionComment [qboardComment_no=" + qboardComment_no + ", qboardCommentLevel="
				+ qboardCommentLevel + ", qboardCommentWriter=" + qboardCommentWriter + ", qboardCommentContent="
				+ qboardCommentContent + ", qboardref=" + qboardref + ", qboardCommentRef=" + qboardCommentRef
				+ ", qboardCommentDate=" + qboardCommentDate + "]";
	} 
	
	
	
	
	
	
	
	
	
}
