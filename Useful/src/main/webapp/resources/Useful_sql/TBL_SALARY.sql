
drop table tbl_salary;
create table tbl_salary(
serial number primary key, -- ����
empno number , --���
Paymentdate date , --������
Paymentmonth date , --�ͼӿ�
basicpay number , --�⺻��
car number , -- ����������
meal number , --�Ĵ뺸����
childcare number , --��������
Otherpay number , --��Ÿ����
national number , --���ο���
health number , --�ǰ�����
employment number , --��뺸��
care  number , --����纸��
Incometax number , --�ҵ漼
localtax number,  --����ҵ漼
grossincome  number, --�����հ�
deductions number, --�����հ�
AdjustedIncome number --�������ݾ�
);
create sequence tbl_salary_seq
 start with 1
   increment by 1
   nocycle
   nocache;