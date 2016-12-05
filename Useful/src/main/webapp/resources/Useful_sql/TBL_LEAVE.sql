drop table tbl_leave;

create table tbl_leave(
empno number primary key,
basic number , --기본연차
rest number , --잔여연차
used number --사용연차
);
