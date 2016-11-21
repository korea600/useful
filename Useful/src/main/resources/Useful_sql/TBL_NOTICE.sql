create table tbl_notice(
serial integer primary key, --글번호
title varchar2(50) not null, --글제목
writer varchar2(20) not null, --글쓴이
content varchar2(2000), --내용
regdate date not null--작성일자
);

-- 글쓴이가 아무이름 쓸가봐 사원테이블 참조해서 사용 하려고 작성
drop table tbl_notice;
create table tbl_notice(
serial integer primary key, --글번호
title varchar2(50) not null, --글제목
ename varchar2(20) not null references tbl_emp(ename), --글쓴이
content varchar2(2000), --내용
regdate date not null--작성일자
);

create sequence tbl_notice_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   