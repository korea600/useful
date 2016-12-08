package kr.co.useful.board.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

//사내게시판
public class BoardVO {
private int serial;
private String title;
private String writer;
private int empno;
private String content;
private Date regdate;
private int viewcnt;
private int replycnt;
private String original_file_name;
private String stored_file_name;
private int file_size;

MultipartFile file;

/*public BoardVO() {
	// TODO Auto-generated constructor stub
}

public BoardVO(int serial, String title, String writer, String content, Date regdate, int viewcnt) {

	this.serial = serial;
	this.title = title;
	this.writer = writer;
	this.content = content;
	this.regdate = regdate;
	this.viewcnt = viewcnt;
}*/

public int getSerial() {
	return serial;
}

public String getOriginal_file_name() {
	return original_file_name;
}

public void setOriginal_file_name(String original_file_name) {
	this.original_file_name = original_file_name;
}

public String getStored_file_name() {
	return stored_file_name;
}

public void setStored_file_name(String stored_file_name) {
	this.stored_file_name = stored_file_name;
}

public int getFile_size() {
	return file_size;
}

public void setFile_size(int file_size) {
	this.file_size = file_size;
}

public MultipartFile getFile() {
	return file;
}

public void setFile(MultipartFile file) {
	this.file = file;
}

public int getReplycnt() {
	return replycnt;
}
public int getEmpno() {
	return empno;
}

public void setEmpno(int empno) {
	this.empno = empno;
}

public void setReplycnt(int replycnt) {
	this.replycnt = replycnt;
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

public int getViewcnt() {
	return viewcnt;
}

public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}

@Override
public String toString() {
	return "BoardVO [serial=" + serial + ", title=" + title + ", writer=" + writer + ", content=" + content
			+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + "]";
}



}
