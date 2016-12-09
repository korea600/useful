package kr.co.useful.meeting.domain;

public class MeetingVO {
	
	private int serial;
	private int roomno;
	private String beginday;
	private int begin;
	private int end;
	private String content;
	private String booker;
	private int empno;
	private String checked;
	
	public MeetingVO() {
		// TODO Auto-generated constructor stub
	} 
	
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	public String getBeginday() {
		return beginday;
	}
	public void setBeginday(String beginday) {
		this.beginday = beginday;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBooker() {
		return booker;
	}
	public void setBooker(String booker) {
		this.booker = booker;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}


	@Override
	public String toString() {
		return "MeetingVO [serial=" + serial + ", roomno=" + roomno + ", beginday=" + beginday + ", begin=" + begin
				+ ", end=" + end + ", content=" + content + ", booker=" + booker + ", empno=" + empno + ", chechked="
				+ checked + "]";
	}
	
	
	

}
