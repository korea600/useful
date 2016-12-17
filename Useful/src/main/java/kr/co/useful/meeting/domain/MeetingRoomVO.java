package kr.co.useful.meeting.domain;

public class MeetingRoomVO {
	private int serial;
	private int roomno;
	private String roomname;
	
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
	public String toString() {
		return "MeetingRoomVO [serial=" + serial + ", roomno=" + roomno + ", roomname=" + roomname + "]";
	}

}
