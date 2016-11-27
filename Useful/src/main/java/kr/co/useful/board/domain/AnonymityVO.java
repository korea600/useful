package kr.co.useful.board.domain;

import java.util.Date;

public class AnonymityVO {

	private int serial;
	private String title;
	private String content;
	private Date regdate;
	public AnonymityVO(int serial, String title, String content, Date regdate) {
	
		this.serial = serial;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public AnonymityVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public String toString() {
		return "AnonymityVO [serial=" + serial + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ "]";
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
	
}
