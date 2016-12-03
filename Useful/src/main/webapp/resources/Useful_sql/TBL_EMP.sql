drop table tbl_emp;

create table tbl_emp(
empno number primary key, --사번
ename varchar2(10) not null, --사원명
pass varchar2(20) not null, -- 비밀번호
ssn varchar2(15) not null,   --주민번호
phone varchar2(15),          --폰
address varchar2(100),        --집주소
hiredate Date not null,      --입사일
deptno number ,          --부서번호
position varchar2(10),       --직책
manager varchar2(10),        --상사
leave number,               --잔여연차일
account varchar2(20) not null, --급여계좌
bank varchar2(15) not null,  -- 은행
sign varchar2(20)           --결제이미지
email varchar2(30)			-- 이메일
);

---------------------------
create table tbl_emp(
empno number primary key, --사번
ename varchar2(10) not null, --사원명
pass varchar2(20) not null, -- 비밀번호
ssn varchar2(13) not null,   --주민번호
phone varchar2(11),          --폰
address varchar2(50),        --집주소
hiredate Date not null,      --입사일
deptno number references tbl_dept(deptno),          --부서번호
position varchar2(10) references tbl_levelpay(position),       --직책
manager varchar2(10),        --상사
leave number,               --잔여연차일
account varchar2(20) not null, --급여계좌
bank varchar2(10) not null,  -- 은핸
sign varchar2(20)           --결제이미지
);


select * from tbl_emp;

select empno
from tbl_emp
where empno='1001';