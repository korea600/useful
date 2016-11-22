create table tbl_approval(
	no number primary key,	-- 문서번호
	status varchar2(15),	-- 결재진행상태
	title varchar2(100),	-- 문서 제목
	content varchar2(1000),	-- 내용
	writer varchar2(15),	-- 기안자
	regdate date default sysdate,	-- 작성일
	enddate date,					-- 결재마감일
	curr_approval varchar2(15),		-- 현재까지 완료된 결재선 (기안자와 같을 경우 아무도 결재하지 않은 상태)
	next_approval varchar2(15)		-- 다음 결재자 (null이면 결재 완료)
)