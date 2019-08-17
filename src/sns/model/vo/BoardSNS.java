package sns.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

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
	private Timestamp boardUpdateDate;
	public BoardSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardSNS(int boardNo, String boardWriter, String boardContent, String boardType, Timestamp boardDate,
			Timestamp boardUpdateDate) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardType = boardType;
		this.boardDate = boardDate;
		this.boardUpdateDate = boardUpdateDate;
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
	public Timestamp getBoardUpdateDate() {
		return boardUpdateDate;
	}
	public void setBoardUpdateDate(Timestamp boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}
	@Override
	public String toString() {
		return "BoardSNS [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardContent=" + boardContent
				+ ", boardType=" + boardType + ", boardDate=" + boardDate + ", boardUpdateDate=" + boardUpdateDate
				+ "]";
	}
	
	
}
	