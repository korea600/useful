package kr.co.useful.manager.domain;

import java.util.Date;

public class EmpVO {
	private int empno;
	private String ename;
	private String pass; 
	private String ssn;
	private String phone; 
	private String address;
	private Date hiredate;
	private int deptno;
	private String position;
	private String manager;
	private double leave;
	private String account;
	private String bank;
	private String sign;
	private Date regdate;
	private String email;
	private String dname;
	public EmpVO() {
	}



	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public double getLeave() {
		return leave;
	}

	public void setLeave(double leave) {
		this.leave = leave;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}





	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public EmpVO(int empno, String ename, String pass, String ssn, String phone, String address, Date hiredate,
			int deptno, String position, String manager, double leave, String account, String bank, String sign,
			Date regdate, String email) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.pass = pass;
		this.ssn = ssn;
		this.phone = phone;
		this.address = address;
		this.hiredate = hiredate;
		this.deptno = deptno;
		this.position = position;
		this.manager = manager;
		this.leave = leave;
		this.account = account;
		this.bank = bank;
		this.sign = sign;
		this.regdate = regdate;
		this.email = email;
	}



	public EmpVO(int empno, String ename, String pass, String ssn, String phone, String address, Date hiredate,
			int deptno, String position, String manager, double leave, String account, String bank, String sign,
			Date regdate, String email, String dname) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.pass = pass;
		this.ssn = ssn;
		this.phone = phone;
		this.address = address;
		this.hiredate = hiredate;
		this.deptno = deptno;
		this.position = position;
		this.manager = manager;
		this.leave = leave;
		this.account = account;
		this.bank = bank;
		this.sign = sign;
		this.regdate = regdate;
		this.email = email;
		this.dname = dname;
	}



	public String getDname() {
		return dname;
	}



	public void setDname(String dname) {
		this.dname = dname;
	}



	@Override
	public String toString() {
		return "EmpVO [empno=" + empno + ", ename=" + ename + ", pass=" + pass + ", ssn=" + ssn + ", phone=" + phone
				+ ", address=" + address + ", hiredate=" + hiredate + ", deptno=" + deptno + ", position=" + position
				+ ", manager=" + manager + ", leave=" + leave + ", account=" + account + ", bank=" + bank + ", sign="
				+ sign + ", regdate=" + regdate + ", email=" + email + ", dname=" + dname + "]";
	}
}
