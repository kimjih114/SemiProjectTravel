package sns.model.vo;

import java.io.Serializable;

public class ImageSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int boardNo;
	private String originalFileName;
	private String renamedFileName;
	private int imageOrder;
	public ImageSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageSNS(int boardNo, String originalFileName, String renamedFileName, int imageOrder) {
		super();
		this.boardNo = boardNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.imageOrder = imageOrder;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	@Override
	public String toString() {
		return "ImageSNS [boardNo=" + boardNo + ", originalFileName=" + originalFileName + ", renamedFileName="
				+ renamedFileName + ", imageOrder=" + imageOrder + "]";
	}
	
	
}
