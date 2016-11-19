

create table tbl_votedate(
serial integer, -- 글번호
question varchar2(50), --보기
regdate date not null --작성일
);

create sequence tbl_votedate_seq
 start with 1
   increment by 1
   nocycle
   nocache;
   