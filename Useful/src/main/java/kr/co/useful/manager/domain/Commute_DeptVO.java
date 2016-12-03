package kr.co.useful.manager.domain;

public class Commute_DeptVO {

	private String dname;
	private String ename;
	private int attendance;
	private int late;
	private int absence;
	private int vacation;
	private int businessTrip;
	private int earlyLeave;
	
	public Commute_DeptVO() {
	}

	public Commute_DeptVO(String dname, String ename, int attendance, int late, int absence,
			int vacation, int businessTrip, int earlyLeave) {
		super();
		this.dname = dname;
		this.ename = ename;
		this.attendance = attendance;
		this.late = late;
		this.absence = absence;
		this.vacation = vacation;
		this.businessTrip = businessTrip;
		this.earlyLeave = earlyLeave;
	}

	@Override
	public String toString() {
		return "Commute_DeptVO [dname=" + dname + ", ename=" + ename + ", attendance="
				+ attendance + ", late=" + late + ", absence=" + absence + ", vacation=" + vacation + ", businessTrip="
				+ businessTrip + ", earlyLeave=" + earlyLeave + "]";
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

	public int getAttendance() {
		return attendance;
	}

	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}

	public int getLate() {
		return late;
	}

	public void setLate(int late) {
		this.late = late;
	}

	public int getAbsence() {
		return absence;
	}

	public void setAbsence(int absence) {
		this.absence = absence;
	}

	public int getVacation() {
		return vacation;
	}

	public void setVacation(int vacation) {
		this.vacation = vacation;
	}

	public int getBusinessTrip() {
		return businessTrip;
	}

	public void setBusinessTrip(int businessTrip) {
		this.businessTrip = businessTrip;
	}

	public int getEarlyLeave() {
		return earlyLeave;
	}

	public void setEarlyLeave(int earlyLeave) {
		this.earlyLeave = earlyLeave;
	}
}
