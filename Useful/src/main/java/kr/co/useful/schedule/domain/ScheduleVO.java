package kr.co.useful.schedule.domain;

import java.util.Date;

public class ScheduleVO {
	private int serial;
	private int deptno;
	private int empno;
	private String ename;
	private String title;
	private String content;
	private String begin;
	private String end;
	private int begintime;// 시작시간
	private Date regdate;

	public ScheduleVO() {

	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getBegintime() {
		return begintime;
	}

	public void setBegintime(int begintime) {
		this.begintime = begintime;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}


	@Override
	public String toString() {
		return "ScheduleVO [고유번호=" + serial + ", 부서번호=" + deptno + ", 사원번호=" + empno + ", 제목=" + title + ", 내용="
				+ content + ", 시작날짜=" + begin + ", 마감날짜=" + end + "시작시간=" + begintime + "작성일" + regdate + "]";
	}

	
	
	/*
	 * serial number primary key, --글번호 category varchar2(20) not null, --구분
	 * -부서,전체 deptno number not null, --부서번호 title varchar2(50) not null, --제목
	 * content varchar2(2000), --글내용 begin date not null, --시작 시간 end date not
	 * null --종료시간
	 */

}
