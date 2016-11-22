package kr.co.useful.organization.domain;

public class OrganizationVO {
	private int empno;			// 사번 (tbl_emp)
	private String ename;		// 사원명 (tbl_emp)
	private String phone;		// 전화번호 (tbl_emp)
	private String address;		// 주소 (tbl_emp)
	private int deptno;			// 부서번호 (tbl_emp, tbl_dept)
	private String dname;		// 부서명 (tbl_dept)
	private String position;	// 직책 (tbl_emp, tbl_position)
	private int posno;			// 직책번호 (tbl_position)
	
	public OrganizationVO() {}
	
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
