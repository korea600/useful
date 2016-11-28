package kr.co.useful.board.domain;

import java.util.Date;

public class ReplyVO {
	private int rno;
	private int serial ;
	private String replyid;
	private String replytext;
	private Date regdate;
	private Date updatedate;
	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}
	public ReplyVO(int serial, String replyid, String replytext, Date regdate, Date updatedate) {

		this.serial = serial;
		this.replyid = replyid;
		this.replytext = replytext;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [serial=" + serial + ", replyid=" + replyid + ", replytext=" + replytext + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getReplyid() {
		return replyid;
	}
	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
}
