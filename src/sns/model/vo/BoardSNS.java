package sns.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int boardNo;
	private String boardWriter;
	private String boardContent;
	private Date boardDate;
	private String boardType;
	public BoardSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardSNS(int boardNo, String boardWriter, String boardContent, Date boardDate, String boardType) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardType = boardType;
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
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	@Override
	public String toString() {
		return "BoardSNS [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardType=" + boardType + "]";
	}
	
	
	
	
}
	