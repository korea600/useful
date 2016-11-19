create table tbl_emppay(
empno integer not null,
paydate date not null,
pay integer,
bouns integer
);

drop table tbl_emppay;
create table tbl_emppay(
empno integer not null references tbl_emp(empno),
paydate date not null,
pay integer references tbl_levelpay(pay),
bouns integer
);
