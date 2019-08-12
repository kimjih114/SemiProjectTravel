package sns.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GradeSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String contentId;
	private int grade;
	private Date gradeDate;
	public GradeSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GradeSNS(String contentId, int grade, Date gradeDate) {
		super();
		this.contentId = contentId;
		this.grade = grade;
		this.gradeDate = gradeDate;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getGradeDate() {
		return gradeDate;
	}
	public void setGradeDate(Date gradeDate) {
		this.gradeDate = gradeDate;
	}
	@Override
	public String toString() {
		return "GradeSNS [contentId=" + contentId + ", grade=" + grade + ", gradeDate=" + gradeDate + "]";
	}
	
	
	
}
