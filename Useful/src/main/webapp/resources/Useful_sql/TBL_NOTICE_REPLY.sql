drop table tbl_notice_reply;
create table tbl_notice_reply(
serial number not null,
replyname varchar2(30) not null,
rno number not null primary key,
replyid varchar2(20) ,
replytext varchar2(2000) not null,
regdate Date default sysdate
);
drop sequence tbl_notice_reply_seq;
create sequence tbl_notice_reply_seq;

alter table tbl_notice_reply add(replyname varchar2(30));

insert into TBL_REPLY (serial,rno,replyid,replytext) values(6,tbl_notice_reply_seq.nextval,'tjddnjs003','�ٹ�° ���');
select * from tbl_notice_reply;