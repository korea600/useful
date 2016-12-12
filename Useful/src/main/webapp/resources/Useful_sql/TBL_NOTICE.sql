create table tbl_notice(
serial number primary key, --�۹�ȣ
empno number not null, --���
title varchar2(200) not null, --������
writer varchar2(50) not null, --�۾���
content varchar2(2000), --����
viewcnt number default 0, --��ȸ��
originalfileName varchar2(1000),
saveFileName varchar2(1000),
filesize number,
regdate date default sysdate not null--�ۼ�����
);

-- �۾��̰� �ƹ��̸� ������ ������̺� �����ؼ� ��� �Ϸ��� �ۼ�
drop table tbl_notice;
create table tbl_notice(
serial number primary key, --�۹�ȣ
title varchar2(50) not null, --������
ename varchar2(20) not null references tbl_emp(ename), --�۾���
content varchar2(2000), --����
regdate date not null--�ۼ�����
);
select * from tbl_notice where serial=22;
alter table tbl_notice add(originalfileName varchar2(1000));
alter table tbl_notice add(saveFileName varchar2(1000));
alter table tbl_notice add(filesize number);

alter table tbl_notice modify(regdate date default sysdate not null);
alter table tbl_notice add(viewcnt number default 0);
drop sequence tbl_notice_seq;
create sequence tbl_notice_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ1','�׽�Ʈ1','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ2','�׽�Ʈ2','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ3','�׽�Ʈ3','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ4','�׽�Ʈ4','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ5','�׽�Ʈ5','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ6','�׽�Ʈ6','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ7','�׽�Ʈ7','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ8','�׽�Ʈ8','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ9','�׽�Ʈ9','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ10','�׽�Ʈ10','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ11','�׽�Ʈ11','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ12','�׽�Ʈ12','����1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'�׽�Ʈ13','�׽�Ʈ13','����1',sysdate);
   