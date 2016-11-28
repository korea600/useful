create table tbl_commute(
serial number primary key,
empno number not null,
login date default sysdate,
logout date default sysdate,
checked varchar2(10)
);

drop table tbl_commute;
create table tbl_commute(
serial number primary key,
empno number not null references tbl_emp(empno),
commute date not null,
checked varchar2(10)
);

create sequence tbl_commute_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   