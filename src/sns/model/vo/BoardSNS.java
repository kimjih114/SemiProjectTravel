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
	private GradeSNS gradeSNS1;
	private GradeSNS gradeSNS2;
	private GradeSNS gradeSNS3;
	private ImageSNS imageSNS1;
	private ImageSNS imageSNS2;
	private ImageSNS imageSNS3;
	private ImageSNS imageSNS4;
	private ImageSNS imageSNS5;
	public BoardSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardSNS(int boardNo, String boardWriter, String boardContent, Date boardDate, String boardType,
			GradeSNS gradeSNS1, GradeSNS gradeSNS2, GradeSNS gradeSNS3, ImageSNS imageSNS1, ImageSNS imageSNS2,
			ImageSNS imageSNS3, ImageSNS imageSNS4, ImageSNS imageSNS5) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardType = boardType;
		this.gradeSNS1 = gradeSNS1;
		this.gradeSNS2 = gradeSNS2;
		this.gradeSNS3 = gradeSNS3;
		this.imageSNS1 = imageSNS1;
		this.imageSNS2 = imageSNS2;
		this.imageSNS3 = imageSNS3;
		this.imageSNS4 = imageSNS4;
		this.imageSNS5 = imageSNS5;
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
	public GradeSNS getGradeSNS1() {
		return gradeSNS1;
	}
	public void setGradeSNS1(GradeSNS gradeSNS1) {
		this.gradeSNS1 = gradeSNS1;
	}
	public GradeSNS getGradeSNS2() {
		return gradeSNS2;
	}
	public void setGradeSNS2(GradeSNS gradeSNS2) {
		this.gradeSNS2 = gradeSNS2;
	}
	public GradeSNS getGradeSNS3() {
		return gradeSNS3;
	}
	public void setGradeSNS3(GradeSNS gradeSNS3) {
		this.gradeSNS3 = gradeSNS3;
	}
	public ImageSNS getImageSNS1() {
		return imageSNS1;
	}
	public void setImageSNS1(ImageSNS imageSNS1) {
		this.imageSNS1 = imageSNS1;
	}
	public ImageSNS getImageSNS2() {
		return imageSNS2;
	}
	public void setImageSNS2(ImageSNS imageSNS2) {
		this.imageSNS2 = imageSNS2;
	}
	public ImageSNS getImageSNS3() {
		return imageSNS3;
	}
	public void setImageSNS3(ImageSNS imageSNS3) {
		this.imageSNS3 = imageSNS3;
	}
	public ImageSNS getImageSNS4() {
		return imageSNS4;
	}
	public void setImageSNS4(ImageSNS imageSNS4) {
		this.imageSNS4 = imageSNS4;
	}
	public ImageSNS getImageSNS5() {
		return imageSNS5;
	}
	public void setImageSNS5(ImageSNS imageSNS5) {
		this.imageSNS5 = imageSNS5;
	}
	@Override
	public String toString() {
		return "BoardSNS [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardType=" + boardType + ", gradeSNS1=" + gradeSNS1 + ", gradeSNS2="
				+ gradeSNS2 + ", gradeSNS3=" + gradeSNS3 + ", imageSNS1=" + imageSNS1 + ", imageSNS2=" + imageSNS2
				+ ", imageSNS3=" + imageSNS3 + ", imageSNS4=" + imageSNS4 + ", imageSNS5=" + imageSNS5 + "]";
	}

	
	
	
	
}
	