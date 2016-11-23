package kr.co.useful.approval.domain;

public class ApprovalProgressVO {
	private int empno;		// 결재자 사번
	private String ename;	// 결재자 성명
	private boolean sign;	// 결재여부
	
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
