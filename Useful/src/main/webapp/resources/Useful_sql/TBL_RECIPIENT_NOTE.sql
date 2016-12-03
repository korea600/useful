drop table tbl_recipient_note;
create table tbl_recipient_note(
serial number, --메시지 번호 순
mynote varchar2(20), --내 아이디로 저장된 내용조회할때
reciid varchar2(20), -- 보낸사람 아이디
recontent varchar2(2000), -- 받은 내용
recipientdate date default sysdate -- 받은날짜
);
select * from tbl_recipient_note;
drop sequence tbl_recipient_note_seq;
create sequence tbl_recipient_note_seq;

select empno,ename,pass from tbl_emp;