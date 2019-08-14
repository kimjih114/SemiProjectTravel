package sns.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class likeSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int board_no;
	private String like_id;
	private Timestamp like_date;
	public likeSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public likeSNS(int board_no, String like_id, Timestamp like_date) {
		super();
		this.board_no = board_no;
		this.like_id = like_id;
		this.like_date = like_date;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getLike_id() {
		return like_id;
	}
	public void setLike_id(String like_id) {
		this.like_id = like_id;
	}
	public Timestamp getLike_date() {
		return like_date;
	}
	public void setLike_date(Timestamp like_date) {
		this.like_date = like_date;
	}
	@Override
	public String toString() {
		return "likeSNS [board_no=" + board_no + ", like_id=" + like_id + ", like_date=" + like_date + "]";
	} 
	
}
