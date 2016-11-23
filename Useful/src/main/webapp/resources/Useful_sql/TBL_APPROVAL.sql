create table tbl_approval(	-- 결재정보 테이블
	no number primary key,				-- 문서번호
	status varchar2(15),				-- 결재진행상태
	title varchar2(100),				-- 문서 제목
	content varchar2(1000),				-- 내용
	writer varchar2(5),					-- 기안자 사번
	receiver varchar2(5),				-- 수신부서번호 (0이면 전체)
	regdate date default sysdate,		-- 작성일
	curr_approval number,				-- 최근 결재자 사번 (기안자와 같을 경우 아무도 결재하지 않은 상태)
	next_approval number,				-- 다음 결재자 사번 (0이면 결재 완료)
	addfile blob,						-- 첨부파일 (blob : 최대 4GB의 binary 파일 저장)
	filename varchar2(100)				-- 첨부파일의 파일명 
)

create sequence tbl_approval_seq	-- 문서번호용 sequence
start with 1
increment by 1
nocache nocycle;