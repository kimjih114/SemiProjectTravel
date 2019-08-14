package sns.model.vo;

import java.io.Serializable;
import java.util.List;

public class TotalSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BoardSNS boardSNS;
	ProfileSNS profileSNS;
	List<ImageSNS> imageSNSList;
	List<GradeSNS> gradeSNSList;
	List<CommentSNS> commentSNSList;
	List<LikeSNS> likeSNSList;
	List<String> followerSNSList; //팔로워 공개
	List<String> blockingSNSList; //안보임
	List<String> blockedSNSList; //블록한상대입니다!
	public TotalSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TotalSNS(BoardSNS boardSNS, ProfileSNS profileSNS, List<ImageSNS> imageSNSList, List<GradeSNS> gradeSNSList,
			List<CommentSNS> commentSNSList, List<LikeSNS> likeSNSList, List<String> followerSNSList,
			List<String> blockingSNSList, List<String> blockedSNSList) {
		super();
		this.boardSNS = boardSNS;
		this.profileSNS = profileSNS;
		this.imageSNSList = imageSNSList;
		this.gradeSNSList = gradeSNSList;
		this.commentSNSList = commentSNSList;
		this.likeSNSList = likeSNSList;
		this.followerSNSList = followerSNSList;
		this.blockingSNSList = blockingSNSList;
		this.blockedSNSList = blockedSNSList;
	}
	public BoardSNS getBoardSNS() {
		return boardSNS;
	}
	public void setBoardSNS(BoardSNS boardSNS) {
		this.boardSNS = boardSNS;
	}
	public ProfileSNS getProfileSNS() {
		return profileSNS;
	}
	public void setProfileSNS(ProfileSNS profileSNS) {
		this.profileSNS = profileSNS;
	}
	public List<ImageSNS> getImageSNSList() {
		return imageSNSList;
	}
	public void setImageSNSList(List<ImageSNS> imageSNSList) {
		this.imageSNSList = imageSNSList;
	}
	public List<GradeSNS> getGradeSNSList() {
		return gradeSNSList;
	}
	public void setGradeSNSList(List<GradeSNS> gradeSNSList) {
		this.gradeSNSList = gradeSNSList;
	}
	public List<CommentSNS> getCommentSNSList() {
		return commentSNSList;
	}
	public void setCommentSNSList(List<CommentSNS> commentSNSList) {
		this.commentSNSList = commentSNSList;
	}
	public List<LikeSNS> getLikeSNSList() {
		return likeSNSList;
	}
	public void setLikeSNSList(List<LikeSNS> likeSNSList) {
		this.likeSNSList = likeSNSList;
	}
	public List<String> getFollowerSNSList() {
		return followerSNSList;
	}
	public void setFollowerSNSList(List<String> followerSNSList) {
		this.followerSNSList = followerSNSList;
	}
	public List<String> getBlockingSNSList() {
		return blockingSNSList;
	}
	public void setBlockingSNSList(List<String> blockingSNSList) {
		this.blockingSNSList = blockingSNSList;
	}
	public List<String> getBlockedSNSList() {
		return blockedSNSList;
	}
	public void setBlockedSNSList(List<String> blockedSNSList) {
		this.blockedSNSList = blockedSNSList;
	}
	@Override
	public String toString() {
		return "TotalSNS [boardSNS=" + boardSNS + ", profileSNS=" + profileSNS + ", imageSNSList=" + imageSNSList
				+ ", gradeSNSList=" + gradeSNSList + ", commentSNSList=" + commentSNSList + ", likeSNSList="
				+ likeSNSList + ", followerSNSList=" + followerSNSList + ", blockingSNSList=" + blockingSNSList
				+ ", blockedSNSList=" + blockedSNSList + "]";
	}

}
