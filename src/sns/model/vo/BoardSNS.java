package sns.model.vo;

import java.sql.Date;

public class BoardSNS {
	private int board_no;
	private String board_writer;
	private String board_content;
	private Date board_date;
	private int board_readcnt;
	private int board_travel_ref;
	public BoardSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardSNS(int board_no, String board_writer, String board_content, Date board_date, int board_readcnt,
			int board_travel_ref) {
		super();
		this.board_no = board_no;
		this.board_writer = board_writer;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_readcnt = board_readcnt;
		this.board_travel_ref = board_travel_ref;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_readcnt() {
		return board_readcnt;
	}
	public void setBoard_readcnt(int board_readcnt) {
		this.board_readcnt = board_readcnt;
	}
	public int getBoard_travel_ref() {
		return board_travel_ref;
	}
	public void setBoard_travel_ref(int board_travel_ref) {
		this.board_travel_ref = board_travel_ref;
	}
	@Override
	public String toString() {
		return "BoardSNS [board_no=" + board_no + ", board_writer=" + board_writer + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", board_readcnt=" + board_readcnt + ", board_travel_ref="
				+ board_travel_ref + "]";
	}
	
	
}
