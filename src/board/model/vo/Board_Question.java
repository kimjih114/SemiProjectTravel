package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board_Question implements Serializable{

	private int qboardNo ; 
	private String qboardWriter; 
	private String qboardContent; 
	private Date qboardDate; 
	private int qboardReadcnt; 
	private int qboardTravle_ref; 
	private String qboardFileName; 
	private String qboardNewFileName;
	private int qboardStatus;
	
	public Board_Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board_Question(int qboardNo, String qboardWriter, String qboardContent, Date qboardDate, int qboardReadcnt,
			int qboardTravle_ref, String qboardFileName, String qboardNewFileName, int qboardStatus) {
		super();
		this.qboardNo = qboardNo;
		this.qboardWriter = qboardWriter;
		this.qboardContent = qboardContent;
		this.qboardDate = qboardDate;
		this.qboardReadcnt = qboardReadcnt;
		this.qboardTravle_ref = qboardTravle_ref;
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

	public int getQboardTravle_ref() {
		return qboardTravle_ref;
	}

	public void setQboardTravle_ref(int qboardTravle_ref) {
		this.qboardTravle_ref = qboardTravle_ref;
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
				+ qboardContent + ", qboardDate=" + qboardDate + ", qboardReadcnt=" + qboardReadcnt
				+ ", qboardTravle_ref=" + qboardTravle_ref + ", qboardFileName=" + qboardFileName
				+ ", qboardNewFileName=" + qboardNewFileName + ", qboardStatus=" + qboardStatus + "]";
	}
	
	
	
	
	
	
}
