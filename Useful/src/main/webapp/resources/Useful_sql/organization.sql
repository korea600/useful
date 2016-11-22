-- 사원정보(tbl_emp) 샘플 데이터 삽입
insert into tbl_emp (empno, ename, pass, ssn, phone, address, hiredate, deptno, position, manager, leave, account, bank)
values (1000, '이길재', '1111','121212-1234567','010-123-4567','가산디지털',sysdate, 0, '사장',null, 30,'123456-7890123','한국은행');
insert into tbl_emp (empno, ename, pass, ssn, phone, address, hiredate, deptno, position, manager, leave, account, bank)
values (1001, '채효원', '1111','121212-1234567','010-123-4567','가산디지털',sysdate, 10, '부장',null, 30,'123456-7890123','한국은행');
insert into tbl_emp (empno, ename, pass, ssn, phone, address, hiredate, deptno, position, manager, leave, account, bank)
values (1002, '박지혜', '1111','121212-1234567','010-123-4567','가산디지털',sysdate, 10, '대리',null, 30,'123456-7890123','한국은행');
insert into tbl_emp (empno, ename, pass, ssn, phone, address, hiredate, deptno, position, manager, leave, account, bank)
values (1003, '안선영', '1111','121212-1234567','010-123-4567','가산디지털',sysdate, 10, '사원',null, 30,'123456-7890123','한국은행');
insert into tbl_emp (empno, ename, pass, ssn, phone, address, hiredate, deptno, position, manager, leave, account, bank)
values (1004, '이대원', '1111','121212-1234567','010-123-4567','가산디지털',sysdate, 10, '사원',null, 30,'123456-7890123','한국은행');
insert into tbl_emp (empno, ename, pass, ssn, phone, address, hiredate, deptno, position, manager, leave, account, bank)
values (1005, '전성원', '1111','121212-1234567','010-123-4567','가산디지털',sysdate, 10, '사원',null, 30,'123456-7890123','한국은행');
-- 컬럼 데이터 크기 수정
alter table tbl_emp modify (ssn varchar2(15));
alter table tbl_emp modify (phone varchar2(15));
alter table tbl_emp modify (bank varchar2(15));
alter table tbl_emp modify (address varchar2(100));
alter table tbl_position modify (position varchar2(20));
-- 직책 테이블(tbl_position) 샘플데이터 삽입
insert into tbl_position values ('사장', 0);
insert into tbl_position values ('부장', 10);
insert into tbl_position values ('대리', 20);
insert into tbl_position values ('사원', 30);
-- 부서테이블 (tbl_dept) 샘플데이터 삽입
insert into tbl_dept values (10,'잘했조');
insert into tbl_dept values (20,'강조');
insert into tbl_dept values (30,'보여조');
insert into tbl_dept values (40,'삼삼오오조');