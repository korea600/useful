drop table tbl_emp;

create table tbl_emp(
empno number primary key, --���
ename varchar2(10) not null, --�����
pass varchar2(20) not null, -- ��й�ȣ
ssn varchar2(15) not null,   --�ֹι�ȣ
phone varchar2(15),          --��
address varchar2(100),        --���ּ�
hiredate Date not null,      --�Ի���
deptno number ,          --�μ���ȣ
position varchar2(10),       --��å
manager varchar2(10),        --���
leave number,               --�ܿ�������
account varchar2(20) not null, --�޿�����
bank varchar2(15) not null,  -- ����
sign varchar2(20)           --�����̹���
email varchar2(30)			-- �̸���
);

---------------------------
create table tbl_emp(
empno number primary key, --���
ename varchar2(10) not null, --�����
pass varchar2(20) not null, -- ��й�ȣ
ssn varchar2(13) not null,   --�ֹι�ȣ
phone varchar2(11),          --��
address varchar2(50),        --���ּ�
hiredate Date not null,      --�Ի���
deptno number references tbl_dept(deptno),          --�μ���ȣ
position varchar2(10) references tbl_levelpay(position),       --��å
manager varchar2(10),        --���
leave number,               --�ܿ�������
account varchar2(20) not null, --�޿�����
bank varchar2(10) not null,  -- ����
sign varchar2(20)           --�����̹���
);


select * from tbl_emp;

select e.empno,d.dname,e.ename,c.login,c.logout,c.checked
		 from tbl_emp e,tbl_commute c,tbl_dept d
		 where e.empno = c.empno and e.deptno = d.deptno 
		 order by empno;

select * from tbl_commute order by login;

select * from tbl_commute where empno in(select empno from tbl_emp where empno='1001')  and to_char(login, 'YYYYMMDD')= '20161206'
  	order by empno;

select empno, ename, deptno, position, regdate, dname
		from tbl_emp natural join tbl_dept
		where empno='1001';