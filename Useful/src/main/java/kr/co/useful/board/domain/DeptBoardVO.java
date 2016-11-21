package kr.co.useful.board.domain;

import java.util.Date;

//부서별 게시판
public class DeptBoardVO {
private int serial;
private int deptno;
private String title;
private String writer;
private String content;
private Date regdate;
private int viewcnt;
public DeptBoardVO() {
	// TODO Auto-generated constructor stub
}
public DeptBoardVO(int serial, int deptno, String title, String writer, String content, Date regdate, int viewcnt) {

	this.serial = serial;
	this.deptno = deptno;
	this.title = title;
	this.writer = writer;
	this.content = content;
	this.regdate = regdate;
	this.viewcnt = viewcnt;
}
@Override
public String toString() {
	return "DeptBoardVO [글번호=" + serial + ", 부서번호=" + deptno + ", 제목=" + title + ", 작성자=" + writer
			+ ", 내용=" + content + ", 날짜=" + regdate + ", 조회수=" + viewcnt + "]";
}
public int getSerial() {
	return serial;
}
public void setSerial(int serial) {
	this.serial = serial;
}
public int getDeptno() {
	return deptno;
}
public void setDeptno(int deptno) {
	this.deptno = deptno;
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
public int getViewcnt() {
	return viewcnt;
}
public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}

}
