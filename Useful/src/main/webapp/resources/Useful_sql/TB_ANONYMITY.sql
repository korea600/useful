create table tbl_anonymity(
serial number primary key,
title varchar2(50) not null,
content varchar2(2000) not null,
regdate date default sysdate,
viewcnt number default 0
);

alter table tbl_anonymity add (viewcnt number default 0);

create sequence tbl_anonymity_seq;
select * from tbl_anonymity;