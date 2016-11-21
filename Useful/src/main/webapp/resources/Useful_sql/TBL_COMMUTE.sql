create table tbl_commute(
serial integer primary key,
empno integer not null,
commute date not null,
checked varchar2(10)
);

drop table tbl_commute;
create table tbl_commute(
serial integer primary key,
empno integer not null references tbl_emp(empno),
commute date not null,
checked varchar2(10)
);

create sequence tbl_commute_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   