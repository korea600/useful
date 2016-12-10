
drop table tbl_reservation;
create table tbl_reservation(
serial number primary key, 
roomno number not null, 
beginday varchar2(30) not null, 
begin number not null,
end number not null,
content varchar2(500),
booker varchar2(50) not null, 
empno number not null,
checked varchar2(20) not null 
);




drop table tbl_roommake;
create table tbl_roommake(
 serial number primary key,
 roomname varchar2(30) not null,
 roomno number not null
);
