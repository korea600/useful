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
	private String originalfileName;
	private String saveFileName;
	private long fileSize;
	
	
	MultipartFile file;
	public BoardVO() {}
	
	public BoardVO(int serial, String title, String writer, int empno, String content, Date regdate, int viewcnt,
			int replycnt, String originalfileName, String saveFileName, long fileSize, MultipartFile file) {
		
		this.serial = serial;
		this.title = title;
		this.writer = writer;
		this.empno = empno;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.replycnt = replycnt;
		this.originalfileName = originalfileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.file = file;
	}
	
	
	public String getOriginalfileName() {
		return originalfileName;
	}
	
	
	public void setOriginalfileName(String originalfileName) {
		this.originalfileName = originalfileName;
	}
	
	
	public String getSaveFileName() {
		return saveFileName;
	}
	
	
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
	
	public long getFileSize() {
		return fileSize;
	}
	
	
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
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
	
	
	public int getEmpno() {
		return empno;
	}
	
	
	public void setEmpno(int empno) {
		this.empno = empno;
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
	
	
	public int getReplycnt() {
		return replycnt;
	}
	
	
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	
	public MultipartFile getFile() {
		return file;
	}
	
	
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
