create table tbl_schedule(
serial integer primary key, --글번호
category varchar2(20) not null, --구분 -부서,전체
deptno integer not null, --부서번호
title varchar2(50) not null, --제목
content varchar2(2000), --글내용
begin date not null, --시작 시간
end date not null --종료시간
);

--부서번호 외래키 사용
drop table tbl_schedule;
create table tbl_schedule(
serial integer primary key, --글번호
category varchar2(20) not null, --구분 -부서,전체
deptno integer not null references tbl_dept(deptno), --부서번호
title varchar2(50) not null, --제목
content varchar2(2000), --글내용
begin date not null, --시작 시간
end date not null --종료시간
);

create sequence tbl_schedule_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   