package kr.co.useful.manager.domain;

public class Commute_MonthlyVO {
	private String login;
	private int attendance;
	private int late;
	private int absence;
	private int vacation;
	private int businessTrip;
	private int earlyLeave;
	
	public Commute_MonthlyVO() {
		// TODO Auto-generated constructor stub
	}

	public Commute_MonthlyVO(String login, int attendance, int late, int absence, int vacation, int businessTrip,
			int earlyLeave) {
		super();
		this.login = login;
		this.attendance = attendance;
		this.late = late;
		this.absence = absence;
		this.vacation = vacation;
		this.businessTrip = businessTrip;
		this.earlyLeave = earlyLeave;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
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

	@Override
	public String toString() {
		return "Commute_MonthlyVO [login=" + login + ", attendance=" + attendance + ", late=" + late + ", absence="
				+ absence + ", vacation=" + vacation + ", businessTrip=" + businessTrip + ", earlyLeave=" + earlyLeave
				+ "]";
	}
	
	
}
