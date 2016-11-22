package kr.co.useful.login.domain;

public class LoginVO {
	private int empno;
	private String pass;
	
	public LoginVO() {
		// TODO Auto-generated constructor stub
	}

	public LoginVO(int empno, String pass) {
		super();
		this.empno = empno;
		this.pass = pass;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
}
