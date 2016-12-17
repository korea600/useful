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
	private int begintime;// ���۽ð�
	private Date regdate;

	public ScheduleVO() {}

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

	public String toString() {
		return "ScheduleVO [������ȣ=" + serial + ", �μ���ȣ=" + deptno + ", �����ȣ=" + empno + ", ����=" + title + ", ����="
				+ content + ", ���۳�¥=" + begin + ", ������¥=" + end + "���۽ð�=" + begintime + "�ۼ���" + regdate + "]";
	}

}
