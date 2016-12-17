package kr.co.useful.sharetask.domain;

import java.util.Date;

public class ShareReplyVO {
	private int rno;
	private int bno;
	private int empno;
	private String replytext;
	private String replyer;
	private Date regdate;
	
	public ShareReplyVO() {}
	
	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String toString() {
		return "ReplyVO [댓글번호=" + rno + ", 게시물번호=" + bno + ", 내용=" + replytext + ", 작성자=" + replyer
				+ ", 작성일자=" + regdate+  "]";
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

}
