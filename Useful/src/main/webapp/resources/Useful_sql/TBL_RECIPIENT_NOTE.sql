drop table tbl_recipient_note;
create table tbl_recipient_note(
serial number, --�޽��� ��ȣ ��
mynotename varchar2(20), --�� ���̵�� ����� ������ȸ�Ҷ�
mynoteid number,--�����̵� empno
reciid number,--������� empno
reciname varchar2(30),  -- ������� ���̵�
recontent varchar2(2000), -- ���� ����
recipientdate date default sysdate -- ������¥
);

drop sequence tbl_recipient_note_seq;
create sequence tbl_recipient_note_seq;
select * from tbl_recipient_note;
select empno,ename,pass from tbl_emp;
select * from tbl_recipient_note;