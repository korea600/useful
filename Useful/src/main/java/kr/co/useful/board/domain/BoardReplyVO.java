package kr.co.useful.board.domain;

import java.util.*;

public class BoardReplyVO {
	private int rno;
	private int bno;
	private String replytext;
	private String replyer;
	private Date regdate;
	private Date update;
	
	public BoardReplyVO() {}
	
	@Override
	public String toString() {
		return "BoardReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", update=" + update + "]";
	}
	
	public BoardReplyVO(int rno, int bno, String replytext, String replyer, Date regdate, Date update) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.replytext = replytext;
		this.replyer = replyer;
		this.regdate = regdate;
		this.update = update;
	}
	
	public int getRno() {
		return rno;
	}
	
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getReplytext() {
		return replytext;
	}
	
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	
	public String getReplyer() {
		return replyer;
	}
	
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public Date getUpdate() {
		return update;
	}
	
	public void setUpdate(Date update) {
		this.update = update;
	}

}
