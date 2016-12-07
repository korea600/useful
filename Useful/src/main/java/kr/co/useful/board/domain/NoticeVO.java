package kr.co.useful.board.domain;

import java.util.Date;

//공지게시판
public class NoticeVO {
private int serial;
private int empno;
private String title;
private String writer;
private String content;
private int viewcnt;
private Date regdate;
private int replycnt;

public NoticeVO(int serial, int empno, String title, String writer, String content, int viewcnt, Date regdate,
		int replycnt) {
	this.serial = serial;
	this.empno = empno;
	this.title = title;
	this.writer = writer;
	this.content = content;
	this.viewcnt = viewcnt;
	this.regdate = regdate;
	this.replycnt = replycnt;
}


public NoticeVO() {
	// TODO Auto-generated constructor stub
}


public int getReplycnt() {
	return replycnt;
}


public void setReplycnt(int replycnt) {
	this.replycnt = replycnt;
}


public int getEmpno() {
	return empno;
}


public void setEmpno(int empno) {
	this.empno = empno;
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
public int getViewcnt() {
	return viewcnt;
}
public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}


}
