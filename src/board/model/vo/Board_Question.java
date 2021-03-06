package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board_Question implements Serializable{

	private int qboardNo ; 
	private String qboardWriter; 
	private String qboardContent; 
	private String qboardTitle;
	private Date qboardDate; 
	private int qboardReadcnt; 
	private int qboardTravel_ref; 
	private String qboardFileName; 
	private String qboardNewFileName;
	private int qboardStatus;
	
	public Board_Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board_Question(int qboardNo, String qboardWriter, String qboardContent, String qboardTitle, Date qboardDate,
			int qboardReadcnt, int qboardTravel_ref, String qboardFileName, String qboardNewFileName,
			int qboardStatus) {
		super();
		this.qboardNo = qboardNo;
		this.qboardWriter = qboardWriter;
		this.qboardContent = qboardContent;
		this.qboardTitle = qboardTitle;
		this.qboardDate = qboardDate;
		this.qboardReadcnt = qboardReadcnt;
		this.qboardTravel_ref = qboardTravel_ref;
		this.qboardFileName = qboardFileName;
		this.qboardNewFileName = qboardNewFileName;
		this.qboardStatus = qboardStatus;
	}

	public int getQboardNo() {
		return qboardNo;
	}

	public void setQboardNo(int qboardNo) {
		this.qboardNo = qboardNo;
	}

	public String getQboardWriter() {
		return qboardWriter;
	}

	public void setQboardWriter(String qboardWriter) {
		this.qboardWriter = qboardWriter;
	}

	public String getQboardContent() {
		return qboardContent;
	}

	public void setQboardContent(String qboardContent) {
		this.qboardContent = qboardContent;
	}

	public String getQboardTitle() {
		return qboardTitle;
	}

	public void setQboardTitle(String qboardTitle) {
		this.qboardTitle = qboardTitle;
	}

	public Date getQboardDate() {
		return qboardDate;
	}

	public void setQboardDate(Date qboardDate) {
		this.qboardDate = qboardDate;
	}

	public int getQboardReadcnt() {
		return qboardReadcnt;
	}

	public void setQboardReadcnt(int qboardReadcnt) {
		this.qboardReadcnt = qboardReadcnt;
	}

	public int getQboardTravel_ref() {
		return qboardTravel_ref;
	}

	public void setQboardTravel_ref(int qboardTravle_ref) {
		this.qboardTravel_ref = qboardTravle_ref;
	}

	public String getQboardFileName() {
		return qboardFileName;
	}

	public void setQboardFileName(String qboardFileName) {
		this.qboardFileName = qboardFileName;
	}

	public String getQboardNewFileName() {
		return qboardNewFileName;
	}

	public void setQboardNewFileName(String qboardNewFileName) {
		this.qboardNewFileName = qboardNewFileName;
	}

	public int getQboardStatus() {
		return qboardStatus;
	}

	public void setQboardStatus(int qboardStatus) {
		this.qboardStatus = qboardStatus;
	}

	
	@Override
	public String toString() {
		return "Board_Question [qboardNo=" + qboardNo + ", qboardWriter=" + qboardWriter + ", qboardContent="
				+ qboardContent + ", qboardTitle=" + qboardTitle + ", qboardDate=" + qboardDate + ", qboardReadcnt="
				+ qboardReadcnt + ", qboardTravel_ref=" + qboardTravel_ref + ", qboardFileName=" + qboardFileName
				+ ", qboardNewFileName=" + qboardNewFileName + ", qboardStatus=" + qboardStatus + "]";
	}

	
	
	
}
