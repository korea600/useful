create table tbl_deptboard(
serial integer primary key, --글번호
deptno integer not null, --부서번호
title varchar2(100) not null, --글제목
writer varchar2(100) not null, --글쓴이
content varchar2(2000) not null, --내용
regdate date not null, --작성일자
viewcnt integer , --조회수
checked varchar2(10) -- 구분 - 신규/진행중/보류/중단/완료
);

drop table tbl_deptboard;
-- 부서번호 참조하고 글쓴이 사원테이블에서 참조
create table tbl_deptboard(
serial integer primary key, --글번호
deptno integer not null references tbl_dept(deptno), --부서번호
title varchar2(100) not null, --글제목
ename varchar2(100) not null references tbl_emp(ename), --글쓴이
content varchar2(2000) not null, --내용
regdate date not null, --작성일자
viewcnt integer , --조회수
checked varchar2(10) -- 구분 - 신규/진행중/보류/중단/완료
);

create sequence tbl_deptboard_seq
 start with 1
   increment by 1
   nocycle
   nocache;
   