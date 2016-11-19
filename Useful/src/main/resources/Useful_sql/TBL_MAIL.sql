create table tbl_mail(
serial integer primary key, --일련번호
title varchar2(100) not null, --제목
sender varchar2(100) not null, --작성자
receiver varchar2(100) not null, -- 받는사람
gdate date, --날짜
content varchar2(2000), --내용
attfile varchar2(2000) --첨부파일
);

--작성자 받는사람 사원테이블참조
drop table tbl_mail;
create table tbl_mail(
serial integer primary key, --일련번호
title varchar2(100) not null, --제목
sender varchar2(100) not null references tbl_emp(ename), --작성자
receiver varchar2(100) not null references tbl_emp(ename), -- 받는사람
gdate date, --날짜
content varchar2(2000), --내용
attfile varchar2(2000) --첨부파일
);


create sequence tbl_mail_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
   
 