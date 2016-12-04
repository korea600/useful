drop table tbl_notice_reply;
create table tbl_notice_reply(
serial number not null,
rno number not null primary key,
replyid varchar2(20) ,
replytext varchar2(2000) not null,
regdate Date default sysdate
);
drop sequence tbl_notice_reply_seq;
create sequence tbl_notice_reply_seq;

insert into TBL_REPLY (serial,rno,replyid,replytext) values(6,tbl_notice_reply_seq.nextval,'tjddnjs003','´Ù¹øÂ° ´ñ±Û');
select * from tbl_notice_reply;