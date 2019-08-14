package sns.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class LikeSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int boardNo;
	private String userId;
	private Timestamp likeDate;
	public LikeSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeSNS(int boardNo, String userId, Timestamp likeDate) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.likeDate = likeDate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(Timestamp likeDate) {
		this.likeDate = likeDate;
	}
	@Override
	public String toString() {
		return "LikeSNS [boardNo=" + boardNo + ", userId=" + userId + ", likeDate=" + likeDate + "]";
	}
	
}
