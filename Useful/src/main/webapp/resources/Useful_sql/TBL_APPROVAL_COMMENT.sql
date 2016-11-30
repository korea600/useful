create table tbl_approval_comment(		-- 결재시 입력할 코멘트 테이블
	cno number primary key,		-- 코멘트 번호
	no number,					-- 원본 결재문서 번호
	writer number,				-- 코멘트 작성자 사번
	writer_name varchar2(15),	-- 코멘트 작성자 성명
	checked varchar2(10),		-- 코멘트 작성시 상태 (결재/반려)
	comments varchar2(400),		-- 코멘트 내용
	regdate date default sysdate -- 코멘트 작성 시간
);


create sequence tbl_approval_comment_seq	-- 코멘트 번호 입력용 sequence
start with 1
increment by 1
nocache nocycle;
