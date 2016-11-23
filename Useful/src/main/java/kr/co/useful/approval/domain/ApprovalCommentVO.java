package kr.co.useful.approval.domain;

import java.util.Date;

public class ApprovalCommentVO {
	private int cno;			// 코멘트 번호
	private int no;				// 원본 결재문서번호
	private int writer;			// 코멘트 작성자 사번
	private String writer_name;	// 코멘트 작성자 성명
	private String comments;	// 코멘트 내용
	private Date regdate;		// 코멘트 작성시간
	
	public ApprovalCommentVO() {}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
