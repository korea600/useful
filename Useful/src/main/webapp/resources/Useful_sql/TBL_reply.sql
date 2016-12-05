drop table tbl_reply;
create table tbl_reply(
serial number not null,
rno number not null primary key,
replyname varchar2(30) not null,
replyid number not null ,
replytext varchar2(2000) not null,
regdate Date default sysdate
);
drop sequence tbl_reply_seq;
create sequence tbl_reply_seq;

insert into TBL_REPLY (serial,rno,replyid,replytext) values(5,tbl_reply_seq.nextval,'tjddnjs003','´Ù¹øÂ° ´ñ±Û');
select * from tbl_reply;

