drop table tbl_send_note;
create table tbl_send_note(
serial number, --�޽��� ��
mynote varchar2(20), -- ���� ���ϳ�����ȸ
myempno number,--�� emp
sendman varchar2(20), --�޴»�� ���̵�
sendempno number,
sendcontent varchar2(2000), --���� ����
senddate date default sysdate --������¥
);

drop sequence tbl_send_note_seq;
create sequence tbl_send_note_seq;
select * from tbl_send_note;
insert into tbl_send_note(serial,mynote,myempno,sendman,sendempno,sendcontent) values(tbl_send_note_seq.nextval,'������',1005,'�̱���',1006,'�����������׽�Ʈ');