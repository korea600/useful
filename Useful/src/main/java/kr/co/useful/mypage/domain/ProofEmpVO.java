package kr.co.useful.mypage.domain;

import java.util.Date;

public class ProofEmpVO {
	private int empno;
	private String ename;
	private String ssn;
	private String address;
	private String dname;
	private String position;
	private String hiredate;
	private Date sysdate;
	
	public ProofEmpVO() {
		// TODO Auto-generated constructor stub
	}

	public ProofEmpVO(int empno, String ename, String ssn, String address, String dname, String position,
			String hiredate, Date sysdate) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.ssn = ssn;
		this.address = address;
		this.dname = dname;
		this.position = position;
		this.hiredate = hiredate;
		this.sysdate = sysdate;
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

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}

	@Override
	public String toString() {
		return "ProofEmpVO [empno=" + empno + ", ename=" + ename + ", ssn=" + ssn + ", address=" + address + ", dname="
				+ dname + ", position=" + position + ", hiredate=" + hiredate + ", sysdate=" + sysdate + "]";
	}
}