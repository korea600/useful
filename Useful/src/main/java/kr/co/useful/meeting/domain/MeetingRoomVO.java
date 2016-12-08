package kr.co.useful.meeting.domain;

public class MeetingRoomVO {
	private int serial;
	private int roomno;
	private String roomname;
	private String bookingday;
	private int begin;
	private int end;
	private String usecheck;

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

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getBookingday() {
		return bookingday;
	}

	public void setBookingday(String bookingday) {
		this.bookingday = bookingday;
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

	public String getUsecheck() {
		return usecheck;
	}

	public void setUsecheck(String usecheck) {
		this.usecheck = usecheck;
	}

	@Override
	public String toString() {
		return "MeetingRoomVO [serial=" + serial + ", roomno=" + roomno + ", roomname=" + roomname + ", bookingday="
				+ bookingday + ", begin=" + begin + ", end=" + end + ", usecheck=" + usecheck + "]";
	}

	

}
