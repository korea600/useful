package kr.co.useful.note.domain;

public class NoteFindUserVO {
	private String empno; //���
	private String dname; //�μ���
	private String ename; //�����
	private String position;//��å
	private String phone; //��ȭ��ȣ
	private String email; //�̸���
	
	public NoteFindUserVO() {}

	public NoteFindUserVO(String empno, String dname, String ename, String position, String phone, String email) {
		this.empno = empno;
		this.dname = dname;
		this.ename = ename;
		this.position = position;
		this.phone = phone;
		this.email = email;
	}

	public String toString() {
		return "NoteFindUserVO [empno=" + empno + ", dname=" + dname + ", ename=" + ename + ", position=" + position
				+ ", phone=" + phone + ", email=" + email + "]";
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
