create table tbl_reservation(
serial integer primary key, --일련번호
roomno integer not null, --회의실번호
begin date not null, --시작시간
end date not null, --종료시간
booker varchar2(50), --예약자
checked varchar2(20) --승인구분
);

--에약자명 사원명 테이블에서 외래키 참조
drop table tbl_reservation;
create table tbl_reservation(
serial integer primary key, --일련번호
roomno integer not null, --회의실번호
begin date not null, --시작시간
end date not null, --종료시간
ename varchar2(50) references tbl_emp(ename), --예약자
checked varchar2(20) --승인구분
);

create sequence tbl_reservation_seq
  start with 1
   increment by 1
   nocycle
   nocache;
   