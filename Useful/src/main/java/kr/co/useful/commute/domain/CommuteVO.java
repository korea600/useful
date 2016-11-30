package kr.co.useful.commute.domain;

import java.util.Date;

public class CommuteVO {
	//serial, empno, login, logout, checked
	private int serial;
	private int empno;
	private String login;
	private String login_time;	
	private String logout;
	private String logout_time;
	private String checked;
	
	public CommuteVO() {
		// TODO Auto-generated constructor stub
	}

	
	public CommuteVO(int serial, int empno, String login, String login_time, String logout, String logout_time,
			String checked) {
		super();
		this.serial = serial;
		this.empno = empno;
		this.login = login;
		this.login_time = login_time;
		this.logout = logout;
		this.logout_time = logout_time;
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


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getLogin_time() {
		return login_time;
	}


	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}


	public String getLogout() {
		return logout;
	}


	public void setLogout(String logout) {
		this.logout = logout;
	}


	public String getLogout_time() {
		return logout_time;
	}


	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}


	public String getChecked() {
		return checked;
	}


	public void setChecked(String checked) {
		this.checked = checked;
	}


	
	
	
}
