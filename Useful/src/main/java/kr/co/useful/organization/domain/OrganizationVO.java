package kr.co.useful.organization.domain;

public class OrganizationVO {
	
	private int empno;			// ��� (tbl_emp)
	private String ename;		// ����� (tbl_emp)
	private String phone;		// ��ȭ��ȣ (tbl_emp)
	private String address;		// �ּ� (tbl_emp)
	private int deptno;			// �μ���ȣ (tbl_emp, tbl_dept)
	private String dname;		// �μ��� (tbl_dept)
	private String position;	// ��å (tbl_emp, tbl_position)
	private int posno;			// ��å��ȣ (tbl_position)
	private String email;		// �̸��� (tbl_emp)
	
	public OrganizationVO() {}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	public int getEmpno() {
		return empno;
	}
	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
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
	public int getPosno() {
		return posno;
	}
	public void setPosno(int posno) {
		this.posno = posno;
	}
}
