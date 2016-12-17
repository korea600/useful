package kr.co.useful.note.domain;

import java.util.Date;

public class SendVO {
	private int serial;
	private String mynote; //내이름
	private int myempno; //내사번
	private String sendman; //상대방 이름
	private int sendempno; //상대방 사번
	private String sendcontent;
	private Date senddate;
	
	public SendVO(int serial, String mynote, int myempno, String sendman, int sendempno, String sendcontent,
			Date senddate) {
		this.serial = serial;
		this.mynote = mynote;
		this.myempno = myempno;
		this.sendman = sendman;
		this.sendempno = sendempno;
		this.sendcontent = sendcontent;
		this.senddate = senddate;
	}

	public String toString() {
		return "SendVO [serial=" + serial + ", mynote=" + mynote + ", myempno=" + myempno + ", sendman=" + sendman
				+ ", sendempno=" + sendempno + ", sendcontent=" + sendcontent + ", senddate=" + senddate + "]";
	}

	public SendVO() {}

	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getMynote() {
		return mynote;
	}
	public void setMynote(String mynote) {
		this.mynote = mynote;
	}
	public int getMyempno() {
		return myempno;
	}
	public void setMyempno(int myempno) {
		this.myempno = myempno;
	}
	public String getSendman() {
		return sendman;
	}
	public void setSendman(String sendman) {
		this.sendman = sendman;
	}
	public int getSendempno() {
		return sendempno;
	}
	public void setSendempno(int sendempno) {
		this.sendempno = sendempno;
	}
	public String getSendcontent() {
		return sendcontent;
	}
	public void setSendcontent(String sendcontent) {
		this.sendcontent = sendcontent;
	}
	public Date getSenddate() {
		return senddate;
	}
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

}
