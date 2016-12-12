drop table tbl_commute;
create table tbl_commute(
serial number primary key, -- ��ȣ
empno number not null, -- ���
login date default sysdate, -- ��ٽð�
logout date, -- ��ٽð�
checked varchar2(10) -- ����
);

create table tbl_commute(
serial number primary key,
empno number not null references tbl_emp(empno),
commute date not null,
checked varchar2(10)
);

drop sequence tbl_commute_seq;
create sequence tbl_commute_seq
   start with 1
   increment by 1
   nocycle
   nocache;
  
  select * from tbl_commute; order by login;
  select login
		from tbl_commute
		where empno='1002' and to_char(login,'yyyymmdd') = to_char(sysdate,'yyyymmdd');
  