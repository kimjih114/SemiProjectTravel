package sns.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class BlockSNS implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userBlocking;
	private String userBlocked;
	private Timestamp blockDate;
	public BlockSNS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BlockSNS(String userBlocking, String userBlocked, Timestamp blockDate) {
		super();
		this.userBlocking = userBlocking;
		this.userBlocked = userBlocked;
		this.blockDate = blockDate;
	}
	public String getUserBlocking() {
		return userBlocking;
	}
	public void setUserBlocking(String userBlocking) {
		this.userBlocking = userBlocking;
	}
	public String getUserBlocked() {
		return userBlocked;
	}
	public void setUserBlocked(String userBlocked) {
		this.userBlocked = userBlocked;
	}
	public Timestamp getBlockDate() {
		return blockDate;
	}
	public void setBlockDate(Timestamp blockDate) {
		this.blockDate = blockDate;
	}
	@Override
	public String toString() {
		return "BlockSNS [userBlocking=" + userBlocking + ", userBlocked=" + userBlocked + ", blockDate=" + blockDate
				+ "]";
	}
	
	
	
	
}
