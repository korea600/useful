package kr.co.useful.note.domain;

import java.util.Date;

public class RecipientVO {
private int serial;
private String mynote;
private String reciid;
private String recontent;
private Date recipientdate;
public RecipientVO() {
	// TODO Auto-generated constructor stub
}
public RecipientVO(int serial, String mynote, String reciid, String recontent, Date recipientdate) {
	this.serial = serial;
	this.mynote = mynote;
	this.reciid = reciid;
	this.recontent = recontent;
	this.recipientdate = recipientdate;
}
@Override
public String toString() {
	return "RecipientVO [serial=" + serial + ", mynote=" + mynote + ", reciid=" + reciid + ", recontent=" + recontent
			+ ", recipientdate=" + recipientdate + "]";
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
public String getReciid() {
	return reciid;
}
public void setReciid(String reciid) {
	this.reciid = reciid;
}
public String getRecontent() {
	return recontent;
}
public void setRecontent(String recontent) {
	this.recontent = recontent;
}
public Date getRecipientdate() {
	return recipientdate;
}
public void setRecipientdate(Date recipientdate) {
	this.recipientdate = recipientdate;
}

}
