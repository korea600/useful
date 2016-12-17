package kr.co.useful.mypage.domain;

import java.util.Date;

public class MypageVO {
	private int empno;
	private String ename;
	private String pass;
	private String ssn;
	private int deptno;
	private String position;
	private String email;
	private String phone;
	private String address;
	private String bank;
	private String account;
	private Date hiredate;
	
	public MypageVO() {}

	public MypageVO(int empno, String ename, String pass, String ssn, int deptno, String position, String email,
			String phone, String address, String bank, String account, Date hiredate) {
		this.empno = empno;
		this.ename = ename;
		this.pass = pass;
		this.ssn = ssn;
		this.deptno = deptno;
		this.position = position;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.bank = bank;
		this.account = account;
		this.hiredate = hiredate;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

}
