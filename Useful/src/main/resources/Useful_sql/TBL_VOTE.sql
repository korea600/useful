create table tbl_vote(
serial integer primary key, --글번호
title varchar2(50) not null, --글제목
writer varchar2(50) not null, --글슨이
content varchar2(2000) not null, --상세질문
regdate date not null --작성일자
);

drop table tbl_vote;
create table tbl_vote(
serial integer primary key, --글번호
title varchar2(50) not null, --글제목
ename varchar2(50) not null references tbl_emp(ename), --글슨이
content varchar2(2000) not null, --상세질문
regdate date not null --작성일자
);

create sequence tbl_vote_seq
 start with 1
   increment by 1
   nocycle
   nocache;
   