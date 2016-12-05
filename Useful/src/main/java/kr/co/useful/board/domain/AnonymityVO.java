package kr.co.useful.board.domain;

import java.util.Date;

public class AnonymityVO {

	private int serial;
	private String title;
	private String pass;
	private String content;
	private Date regdate;
	private int viewcnt;
	
	public AnonymityVO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "AnonymityVO [serial=" + serial + ", title=" + title + ", pass=" + pass + ", content=" + content
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}

	public AnonymityVO(int serial, String title, String pass, String content, Date regdate, int viewcnt) {
		super();
		this.serial = serial;
		this.title = title;
		this.pass = pass;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	

	
}
