create table tbl_voteresult(
serial integer, --글번호
empno varchar2(100), --참여자 이중참여 방지용
answer varchar2(50) --응답
);

--사번을 emp테이블에서 참조
create table tbl_voteresult(
serial integer, --글번호
empno varchar2(100) references tbl_emp(empno), --참여자 이중참여 방지용
answer varchar2(50) --응답
);
