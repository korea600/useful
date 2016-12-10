drop table tbl_schedule;

create table tbl_schedule(
serial number primary key, --�۹�ȣ
title varchar2(50) not null, --����
content varchar2(2000),
begin varchar2(30) not null, --���� ��¥
end varchar2(30) not null, --���ᳯ¥
begintime number,
regdate date default sysdate,
deptno number not null,
empno number not null
);
--�μ���ȣ �ܷ�Ű ���
drop table tbl_schedule;
create table tbl_schedule(
serial number primary key, --�۹�ȣ
category varchar2(20) not null, --���� -�μ�,��ü
deptno number not null references tbl_dept(deptno), --�μ���ȣ
title varchar2(50) not null, --����
content varchar2(2000), --�۳���
begin date not null, --���� �ð�
end date not null --����ð�
);

create sequence tbl_schedule_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   