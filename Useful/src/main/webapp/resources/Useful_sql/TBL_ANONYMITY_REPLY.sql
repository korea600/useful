drop table tbl_anonymity_reply;
create table tbl_anonymity_reply(
serial number not null,
rno number not null primary key,
replyid varchar2(20) ,
replytext varchar2(2000) not null,
regdate Date default sysdate
);
drop sequence tbl_anonymity_reply_seq;
create sequence tbl_anonymity_reply_seq;

insert into tbl_anonymity_reply (serial,rno,replyid,replytext) values(42,tbl_reply_seq.nextval,'tjddnjs003','´Ù¹øÂ° ´ñ±Û');
select * from tbl_anonymity_reply;

