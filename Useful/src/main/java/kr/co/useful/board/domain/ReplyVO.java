package kr.co.useful.board.domain;

import java.util.Date;

public class ReplyVO {
	private int serial;
	private int rno;
	private String replyname;
	private String replyid;
	private String replytext;
	private Date regdate;

	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int serial, int rno, String replyid, String replytext, Date regdate) {
	
		this.serial = serial;
		this.rno = rno;
		this.replyid = replyid;
		this.replytext = replytext;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [serial=" + serial + ", rno=" + rno + ", replyid=" + replyid + ", replytext=" + replytext
				+ ", regdate=" + regdate + "]";
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReplyname() {
		return replyname;
	}

	public void setReplyname(String replyname) {
		this.replyname = replyname;
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
	
	
}
