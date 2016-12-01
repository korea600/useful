package kr.co.useful.note.domain;

import java.util.Date;

public class SendVO {
private int serial;
private String mynote;
private String sendman;
private String sendcontent;
private Date senddate;
public SendVO() {
	// TODO Auto-generated constructor stub
}
public SendVO(int serial, String mynote, String sendman, String sendcontent, Date senddate) {
	this.serial = serial;
	this.mynote = mynote;
	this.sendman = sendman;
	this.sendcontent = sendcontent;
	this.senddate = senddate;
}
@Override
public String toString() {
	return "SendVO [serial=" + serial + ", mynote=" + mynote + ", sendman=" + sendman + ", sendcontent=" + sendcontent
			+ ", senddate=" + senddate + "]";
}
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
public String getSendman() {
	return sendman;
}
public void setSendman(String sendman) {
	this.sendman = sendman;
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
