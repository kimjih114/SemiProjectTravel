package sns.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ImageSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int boardNo;
	private String boardWriter;
	private String originalFileName;
	private String renamedFileName;
	private int imageOrder;
	private Date imageDate;
	public ImageSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageSNS(int boardNo, String boardWriter, String originalFileName, String renamedFileName, int imageOrder,
			Date imageDate) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.imageOrder = imageOrder;
		this.imageDate = imageDate;
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
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getRenamedFileName() {
		return renamedFileName;
	}
	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}
	public int getImageOrder() {
		return imageOrder;
	}
	public void setImageOrder(int imageOrder) {
		this.imageOrder = imageOrder;
	}
	public Date getImageDate() {
		return imageDate;
	}
	public void setImageDate(Date imageDate) {
		this.imageDate = imageDate;
	}
	@Override
	public String toString() {
		return "ImageSNS [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", originalFileName="
				+ originalFileName + ", renamedFileName=" + renamedFileName + ", imageOrder=" + imageOrder
				+ ", imageDate=" + imageDate + "]";
	}
	
}
