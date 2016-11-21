create table tbl_lazyness(
serial number primary key, --일련번호
empno number not null, -- 사번
category varchar2(20) not null, -- 종류
begin date , --시작
term date , --기간
etc date --비고
);

drop table tbl_lazyness;
create table tbl_lazyness(
serial number primary key, --일련번호
empno number not null references tbl_emp(empno), -- 사번
category varchar2(20) not null, -- 종류
begin date , --시작
term date , --기간
etc date --비고
);

create sequence tb1_lazyness_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   