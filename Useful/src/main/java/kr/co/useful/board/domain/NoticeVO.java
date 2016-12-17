package kr.co.useful.board.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

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
	private String originalfileName;
	private String saveFileName;
	private long fileSize;
	
	MultipartFile multipartFile;
	
	public NoticeVO(int serial, int empno, String title, String writer, String content, int viewcnt, Date regdate,
			int replycnt, String originalfileName, String saveFileName, long fileSize, MultipartFile multipartFile) {
		this.serial = serial;
		this.empno = empno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewcnt = viewcnt;
		this.regdate = regdate;
		this.replycnt = replycnt;
		this.originalfileName = originalfileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.multipartFile = multipartFile;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [serial=" + serial + ", empno=" + empno + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", viewcnt=" + viewcnt + ", regdate=" + regdate + ", replycnt=" + replycnt
				+ ", originalfileName=" + originalfileName + ", saveFileName=" + saveFileName + ", fileSize=" + fileSize
				+ ", multipartFile=" + multipartFile + "]";
	}
	public NoticeVO() {}
	
	public int getSerial() {
		return serial;
	}
	
	public void setSerial(int serial) {
		this.serial = serial;
	}
	
	public int getEmpno() {
		return empno;
	}
	
	public void setEmpno(int empno) {
		this.empno = empno;
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
	
	public int getReplycnt() {
		return replycnt;
	}
	
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
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
	
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
}
