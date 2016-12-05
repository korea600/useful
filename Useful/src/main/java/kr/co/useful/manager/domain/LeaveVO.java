package kr.co.useful.manager.domain;

import java.util.Date;

public class LeaveVO {
	private int empno;
	private String ename;
	private String dname;
	private Date hiredate;
	private int basic;
	private int used;
	private int rest;
	
	public LeaveVO() {
		// TODO Auto-generated constructor stub
	}

	public LeaveVO(int empno, String ename, String dname, Date hiredate, int basic, int used, int rest) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.dname = dname;
		this.hiredate = hiredate;
		this.basic = basic;
		this.used = used;
		this.rest = rest;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public int getBasic() {
		return basic;
	}

	public void setBasic(int basic) {
		this.basic = basic;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	public int getRest() {
		return rest;
	}

	public void setRest(int rest) {
		this.rest = rest;
	}

	@Override
	public String toString() {
		return "LeaveVO [empno=" + empno + ", ename=" + ename + ", dname=" + dname + ", hiredate=" + hiredate
				+ ", basic=" + basic + ", used=" + used + ", rest=" + rest + "]";
	}
}
