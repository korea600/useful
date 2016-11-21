package kr.co.useful.board.domain;

import java.util.Date;

//공지게시판
public class NoticeVO {
private int serial;
private String title;
private String writer;
private String content;
private Date regdate;

public NoticeVO() {
	// TODO Auto-generated constructor stub
}

public NoticeVO(int serial, String title, String writer, String content, Date regdate) {
	
	this.serial = serial;
	this.title = title;
	this.writer = writer;
	this.content = content;
	this.regdate = regdate;
}

@Override
public String toString() {
	return "NoticeVO [게시물번호=" + serial + ", 제목=" + title + ", 작성자=" + writer + ", 내용=" + content
			+ ", 날짜=" + regdate + "]";
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

public String getWriter() {
	return writer;
}

public void setWriter(String writer) {
	this.writer = writer;
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
