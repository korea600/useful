create table tbl_board(
serial number primary key, --글번호
title varchar2(50) not null, --글제목
writer varchar2(30) not null, --글쓴이
content varchar2(2000) not null, --내용
regdate date default sysdate not null, --작성일자
viewcnt number --조회수
);

drop table tbl_board;
create table tbl_board(
serial number primary key, --글번호
title varchar2(50) not null, --글제목
ename varchar2(30) not null references tbl_emp(ename), --글쓴이
content varchar2(2000) not null, --내용
regdate date not null, --작성일자
viewcnt number --조회수
);
drop sequence tbl_board_seq;
create sequence tbl_board_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   insert into tbl_board (serial,title,writer,content,regdate) values (tbl_board_seq.nextval,'테스트','테스트','테스트',sysdate);
   
   alter table tbl_board modify (regdate date default sysdate);