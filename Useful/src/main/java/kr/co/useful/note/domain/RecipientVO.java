package kr.co.useful.note.domain;

import java.util.Date;

public class RecipientVO {
private int serial;
private String mynotename; //내 이름
private int mynoteid; //내사번
private int reciid;
private String reciname;
private String recontent;
private Date recipientdate;

public int getSerial() {
	return serial;
}
public void setSerial(int serial) {
	this.serial = serial;
}
public String getMynotename() {
	return mynotename;
}
public void setMynotename(String mynotename) {
	this.mynotename = mynotename;
}
public int getMynoteid() {
	return mynoteid;
}
public void setMynoteid(int mynoteid) {
	this.mynoteid = mynoteid;
}
public int getReciid() {
	return reciid;
}
public void setReciid(int reciid) {
	this.reciid = reciid;
}
public String getReciname() {
	return reciname;
}
public void setReciname(String reciname) {
	this.reciname = reciname;
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
