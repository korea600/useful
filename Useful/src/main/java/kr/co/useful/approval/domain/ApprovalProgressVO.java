package kr.co.useful.approval.domain;

public class ApprovalProgressVO {
	private int no;			// 결재문서번호
	private int empno;		// 결재자 사번
	private String position;// 결재자 직책
	private String ename;	// 결재자 성명
	private int deptno; 	// 결재자의 부서번호
	private boolean sign;	// 결재여부
	
	public ApprovalProgressVO() {}
	
	public ApprovalProgressVO(int no, int empno, String position,String ename, int deptno, boolean sign) {
		this.no=no;				this.empno = empno;
		this.ename = ename;		this.deptno = deptno;
		this.sign = sign;		this.position=position;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
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
	public boolean isSign() {
		return sign;
	}
	public void setSign(boolean sign) {
		this.sign = sign;
	}
}
