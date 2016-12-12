create table tbl_anonymity(
serial number primary key,
title varchar2(50) not null,
pass varchar2(30) not null,
content varchar2(2000) not null,
regdate date default sysdate,
viewcnt number default 0,
originalfilename varchar2(2000),
saveFileName varchar2(2000),
filesize number
);
drop table tbl_anonymity;
drop sequence tbl_anonymity_seq;
alter table tbl_anonymity modify(pass varchar2(30));
alter table tbl_anonymity add (viewcnt number default 0);
alter table tbl_anonymity add(pass number );
create sequence tbl_anonymity_seq;
select * from tbl_anonymity;