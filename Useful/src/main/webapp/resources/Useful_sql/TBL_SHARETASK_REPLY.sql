--tbl_sharetask_reply

drop table tbl_sharetask_reply;    
create table tbl_sharetask_reply(
   rno             number primary key,
   bno             number references tbl_sharetask(bno),
   replytext       varchar2(1000) not null,
   replyer         varchar2(50) not null,
   empno           number not null,
   regdate         date default sysdate,
  
);

insert into 

select * from TBL_SHARETASK_REPLY;

drop sequence tbl_sharetask_reply_seq;
create sequence tbl_sharetask_reply_seq
start with 1
increment by 1
nocycle
nocache;

