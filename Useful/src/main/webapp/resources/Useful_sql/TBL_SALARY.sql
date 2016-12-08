
drop table tbl_salary;
create table tbl_salary(
serial number primary key, -- 구분
empno number , --사번
Paymentdate date , --지급일
Paymentmonth date , --귀속월
basicpay number , --기본급
car number , -- 차량유지비
meal number , --식대보조금
childcare number , --보육수당
Otherpay number , --기타수당
national number , --국민연금
health number , --건강보험
employment number , --고용보험
care  number , --장기요양보험
Incometax number , --소득세
localtax number,  --지방소득세
grossincome  number, --지급합계
deductions number, --공제합계
AdjustedIncome number --차인지금액
);
create sequence tbl_salary_seq
 start with 1
   increment by 1
   nocycle
   nocache;