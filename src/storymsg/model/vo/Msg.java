package storymsg.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Msg implements Serializable{

	private int msgNo; 
	private String msgSender; 
	private String msgReceiver; 
	private String msgContent; 
	private Date msgDate;
	
	private int msgCnt;

	public Msg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Msg(int msgNo, String msgSender, String msgReceiver, String msgContent, Date msgDate, int msgCnt) {
		super();
		this.msgNo = msgNo;
		this.msgSender = msgSender;
		this.msgReceiver = msgReceiver;
		this.msgContent = msgContent;
		this.msgDate = msgDate;
		this.msgCnt = msgCnt;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgSender() {
		return msgSender;
	}

	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}

	public String getMsgReceiver() {
		return msgReceiver;
	}

	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

	public int getMsgCnt() {
		return msgCnt;
	}

	public void setMsgCnt(int msgCnt) {
		this.msgCnt = msgCnt;
	}

	
	@Override
	public String toString() {
		return "Msg [msgNo=" + msgNo + ", msgSender=" + msgSender + ", msgReceiver=" + msgReceiver + ", msgContent="
				+ msgContent + ", msgDate=" + msgDate + ", msgCnt=" + msgCnt + "]";
	} 
	
	
	
	
	
}
