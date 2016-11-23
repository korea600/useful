package kr.co.useful.approval.domain;

import java.io.File;
import java.util.Date;

public class ApprovalVO {
	private int no;					// 문서번호
	private String status;			// 결재 진행 상태
	private String title;			// 문서제목
	private String content;			// 문서내용
	private int writer;				// 기안자 (문서 작성자) 사번
	private String writer_name;		// 기안자 (문서 작성자) 성명
	private int receiver;			// 수신부서번호
	private String receiver_dname;	// 수신부서명
	private Date regdate;			// 작성일자
	private int curr_approval;		// 최근 결재자 사번(기안자와 같을 경우 결재 대기상태)
	private int next_approval;		// 다음 결재자 사번(0일 경우 결재 완료상태)
	private File addfile;			// 첨부파일 (최대 4GB binary file 저장 가능)
	private String filename;		// 첨부파일의 파일명
	
	public ApprovalVO() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public String getReceiver_dname() {
		return receiver_dname;
	}

	public void setReceiver_dname(String receiver_dname) {
		this.receiver_dname = receiver_dname;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getCurr_approval() {
		return curr_approval;
	}

	public void setCurr_approval(int curr_approval) {
		this.curr_approval = curr_approval;
	}

	public int getNext_approval() {
		return next_approval;
	}

	public void setNext_approval(int next_approval) {
		this.next_approval = next_approval;
	}

	public File getAddfile() {
		return addfile;
	}

	public void setAddfile(File addfile) {
		this.addfile = addfile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}