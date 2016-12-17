package kr.co.useful.manager.domain;

public class CommuteVO {
	private int serial;
	private int empno;
	private String ename;
	private String dname;
	private String login;
	private String login_Time;
	private String logout;
	private String logout_Time;
	private String checked;
	
	public CommuteVO() {}

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
	public String getLogin_Time() {
		return login_Time;
	}
	public void setLogin_Time(String login_Time) {
		this.login_Time = login_Time;
	}
	public String getLogout() {
		return logout;
	}
	public void setLogout(String logout) {
		this.logout = logout;
	}
	public String getLogout_Time() {
		return logout_Time;
	}
	public void setLogout_Time(String logout_Time) {
		this.logout_Time = logout_Time;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
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
	public CommuteVO(int serial, int empno, String ename, String dname, String login, String login_Time, String logout,
			String logout_Time, String checked) {
		this.serial = serial;
		this.empno = empno;
		this.ename = ename;
		this.dname = dname;
		this.login = login;
		this.login_Time = login_Time;
		this.logout = logout;
		this.logout_Time = logout_Time;
		this.checked = checked;
	}

	public String toString() {
		return "CommuteVO [serial=" + serial + ", empno=" + empno + ", ename=" + ename + ", dname=" + dname + ", login="
				+ login + ", login_Time=" + login_Time + ", logout=" + logout + ", logout_Time=" + logout_Time
				+ ", checked=" + checked + "]";
	}
	
}
