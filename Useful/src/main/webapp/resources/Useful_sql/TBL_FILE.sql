create table tbl_file(
filenum number,
oname varchar2(1000),
filename varchar2(1000),
filesize number,
article number
);
drop sequence tbl_file_seq;
create sequence tbl_file_seq;