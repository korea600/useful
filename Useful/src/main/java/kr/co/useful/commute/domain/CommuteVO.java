package kr.co.useful.commute.domain;

import java.util.Date;

public class CommuteVO {
	//serial, empno, login, logout, checked
	private int serial;
	private int empno;
	private Date login;
	private Date logout;
	private String checked;
	
	public CommuteVO() {
		// TODO Auto-generated constructor stub
	}

	public CommuteVO(int serial, int empno, Date login, Date logout, String checked) {
		super();
		this.serial = serial;
		this.empno = empno;
		this.login = login;
		this.logout = logout;
		this.checked = checked;
	}

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

	public Date getLogin() {
		return login;
	}

	public void setLogin(Date login) {
		this.login = login;
	}

	public Date getLogout() {
		return logout;
	}

	public void setLogout(Date logout) {
		this.logout = logout;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	
}
