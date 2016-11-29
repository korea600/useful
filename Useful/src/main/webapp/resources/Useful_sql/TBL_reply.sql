drop table tbl_reply;
create table tbl_reply(
serial number primary key,
rno number not null,
replyid varchar2(20),
replytext varchar2(2000) not null,
regdate Date default sysdate not null
);

create sequence tbl_reply_seq;

insert into TBL_REPLY (serial,replyid,replytext,regdate) values(tbl_reply_seq.nextval,'tjddnjs003','´Ù¹øÂ° ´ñ±Û',sysdate);
select serial from tbl_reply;

