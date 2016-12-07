drop table tbl_recipient_note;
create table tbl_recipient_note(
serial number, --메시지 번호 순
mynotename varchar2(20), --내 아이디로 저장된 내용조회할때
mynoteid number,--내아이디 empno
reciid number,--보낸사람 empno
reciname varchar2(30),  -- 보낸사람 아이디
recontent varchar2(2000), -- 받은 내용
recipientdate date default sysdate -- 받은날짜
);

drop sequence tbl_recipient_note_seq;
create sequence tbl_recipient_note_seq;
select * from tbl_recipient_note;
select empno,ename,pass from tbl_emp;
select * from tbl_recipient_note;