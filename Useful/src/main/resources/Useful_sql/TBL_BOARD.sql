create table tbl_board(
serial integer primary key, --글번호
title varchar2(50) not null, --글제목
writer varchar2(30) not null, --글쓴이
content varchar2(2000) not null, --내용
regdate date not null, --작성일자
viewcnt integer --조회수
);

drop table tbl_board;
create table tbl_board(
serial integer primary key, --글번호
title varchar2(50) not null, --글제목
ename varchar2(30) not null references tbl_emp(ename), --글쓴이
content varchar2(2000) not null, --내용
regdate date not null, --작성일자
viewcnt integer --조회수
);

create sequence tbl_board_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
   