create table tbl_emppay(
empno number not null,
paydate date not null,
pay number,
bouns number
);

drop table tbl_emppay;
create table tbl_emppay(
empno number not null references tbl_emp(empno),
paydate date not null,
pay number references tbl_levelpay(pay),
bouns integer
);
