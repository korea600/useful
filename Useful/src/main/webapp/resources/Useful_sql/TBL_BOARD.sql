create table tbl_board(
serial number primary key, --�۹�ȣ
title varchar2(50) not null, --������
writer varchar2(30) not null, --�۾���
empno number not null, --���
content varchar2(2000) not null, --����
regdate date default sysdate not null, --�ۼ�����
viewcnt number default 0 --��ȸ��
);

drop table tbl_board;
create table tbl_board(
serial number primary key, --�۹�ȣ
title varchar2(50) not null, --������
ename varchar2(30) not null references tbl_emp(ename), --�۾���
content varchar2(2000) not null, --����
regdate date not null, --�ۼ�����
viewcnt number --��ȸ��
);
drop sequence tbl_board_seq;
create sequence tbl_board_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   alter table tbl_board modify (empno number);
   select viewcnt from tbl_board where serial=3;
   update tbl_board set viewcnt=viewcnt+1
where serial=3;
   alter table tbl_board modify (viewcnt number default 0);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'�׽�Ʈ','�׽�Ʈ','�׽�Ʈ',sysdate);
   
   alter table tbl_board modify (regdate date default sysdate);
   alter table tbl_board add(originalfileName varchar2(1000));
   alter table tbl_board add(saveFileName varchar2(1000));
   alter table tbl_board add(fileSize number);
   select * from tbl_board where serial=55;