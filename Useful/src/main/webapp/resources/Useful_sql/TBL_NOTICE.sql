create table tbl_notice(
serial number primary key, --글번호
title varchar2(50) not null, --글제목
writer varchar2(20) not null, --글쓴이
content varchar2(2000), --내용
viewcnt number default 0, --조회수
regdate date default sysdate not null--작성일자
);

-- 글쓴이가 아무이름 쓸가봐 사원테이블 참조해서 사용 하려고 작성
drop table tbl_notice;
create table tbl_notice(
serial number primary key, --글번호
title varchar2(50) not null, --글제목
ename varchar2(20) not null references tbl_emp(ename), --글쓴이
content varchar2(2000), --내용
regdate date not null--작성일자
);

alter table tbl_notice modify(regdate date default sysdate not null);
alter table tbl_notice add(viewcnt number default 0);
create sequence tbl_notice_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트1','테스트1','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트2','테스트2','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트3','테스트3','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트4','테스트4','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트5','테스트5','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트6','테스트6','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트7','테스트7','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트8','테스트8','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트9','테스트9','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트10','테스트10','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트11','테스트11','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트12','테스트12','내용1',sysdate);
   insert into tbl_notice (serial,title,writer,content,regdate) values (tbl_notice_seq.nextval,'테스트13','테스트13','내용1',sysdate);
   