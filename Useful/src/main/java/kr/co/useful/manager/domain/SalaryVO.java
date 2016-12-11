package kr.co.useful.manager.domain;

import java.util.Date;

public class SalaryVO {
	private int serial;
	private int empno;
	private String ename;
	private String dname;
	private String position;
	private Date paymentdate;
	private Date paymentmonth;
	private int basicpay;
	private int car;
	private int meal;
	private int childcare;
	private int otherpay;
	private int national;
	private int health;
	private int employment;
	private int care;
	private int Incometax;
	private int localtax;
	private int grossincome;
	private int deductions;
	private int adjustedIncome;
	
	public SalaryVO() {
		// TODO Auto-generated constructor stub
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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Date getPaymentdate() {
		return paymentdate;
	}

	public void setPaymentdate(Date paymentdate) {
		this.paymentdate = paymentdate;
	}

	public Date getPaymentmonth() {
		return paymentmonth;
	}

	public void setPaymentmonth(Date paymentmonth) {
		this.paymentmonth = paymentmonth;
	}

	public int getBasicpay() {
		return basicpay;
	}

	public void setBasicpay(int basicpay) {
		this.basicpay = basicpay;
	}

	public int getCar() {
		return car;
	}

	public void setCar(int car) {
		this.car = car;
	}

	public int getMeal() {
		return meal;
	}

	public void setMeal(int meal) {
		this.meal = meal;
	}

	public int getChildcare() {
		return childcare;
	}

	public void setChildcare(int childcare) {
		this.childcare = childcare;
	}

	public int getOtherpay() {
		return otherpay;
	}

	public void setOtherpay(int otherpay) {
		this.otherpay = otherpay;
	}

	public int getNational() {
		return national;
	}

	public void setNational(int national) {
		this.national = national;
	}

	public int getHealth() {
		return health;
	}

	public void setHealth(int health) {
		this.health = health;
	}

	public int getEmployment() {
		return employment;
	}

	public void setEmployment(int employment) {
		this.employment = employment;
	}

	public int getCare() {
		return care;
	}

	public void setCare(int care) {
		this.care = care;
	}

	public int getIncometax() {
		return Incometax;
	}

	public void setIncometax(int incometax) {
		Incometax = incometax;
	}

	public int getLocaltax() {
		return localtax;
	}

	public void setLocaltax(int localtax) {
		this.localtax = localtax;
	}

	public int getGrossincome() {
		return grossincome;
	}

	public void setGrossincome(int grossincome) {
		this.grossincome = grossincome;
	}

	public int getDeductions() {
		return deductions;
	}

	public void setDeductions(int deductions) {
		this.deductions = deductions;
	}

	public int getAdjustedIncome() {
		return adjustedIncome;
	}

	public void setAdjustedIncome(int adjustedIncome) {
		this.adjustedIncome = adjustedIncome;
	}

	@Override
	public String toString() {
		return "SalaryVO [serial=" + serial + ", empno=" + empno + ", ename=" + ename + ", dname=" + dname
				+ ", position=" + position + ", paymentdate=" + paymentdate + ", paymentmonth=" + paymentmonth
				+ ", basicpay=" + basicpay + ", car=" + car + ", meal=" + meal + ", childcare=" + childcare
				+ ", otherpay=" + otherpay + ", national=" + national + ", health=" + health + ", employment="
				+ employment + ", care=" + care + ", Incometax=" + Incometax + ", localtax=" + localtax
				+ ", grossincome=" + grossincome + ", deductions=" + deductions + ", adjustedIncome=" + adjustedIncome
				+ "]";
	}

	public SalaryVO(int serial, int empno, String ename, String dname, String position, Date paymentdate,
			Date paymentmonth, int basicpay, int car, int meal, int childcare, int otherpay, int national, int health,
			int employment, int care, int incometax, int localtax, int grossincome, int deductions,
			int adjustedIncome) {
		super();
		this.serial = serial;
		this.empno = empno;
		this.ename = ename;
		this.dname = dname;
		this.position = position;
		this.paymentdate = paymentdate;
		this.paymentmonth = paymentmonth;
		this.basicpay = basicpay;
		this.car = car;
		this.meal = meal;
		this.childcare = childcare;
		this.otherpay = otherpay;
		this.national = national;
		this.health = health;
		this.employment = employment;
		this.care = care;
		Incometax = incometax;
		this.localtax = localtax;
		this.grossincome = grossincome;
		this.deductions = deductions;
		this.adjustedIncome = adjustedIncome;
	}
	
}
