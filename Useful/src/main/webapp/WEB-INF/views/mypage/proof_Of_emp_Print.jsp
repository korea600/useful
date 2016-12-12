<%@ page language="java" contentType="application/vnd.word;charset=UTF-8" pageEncoding="UTF-8"%>
<%   
	response.setHeader("Content-Disposition","attachment;filename=Proof_of_employee.doc");
    response.setHeader("Content-Description", "JSP Generated Data");		%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	 table{
	 	font-family:"맑은 고딕";
	 }
	 

</style>
</head>
<body>
    <div style="text-align: center;"><font size=23>재직 증명서</font></div>
<p>
<br>
    1. 인적사항
</p>
<table border="1" cellspacing="0" cellpadding="0" style="text-align: center;width: 100%;">
    <tbody>
        <tr>
            <td width="20%" valign="top" style="background-color: gray;">
                <p align="center">
                    성 명
                </p>
            </td>
            <td width="30%" valign="top">
            	${proof_emp.ename }
            </td>
            <td width="20%" valign="top" style="background-color: gray;">
                <p align="center">
                    주민등록번호
                </p>
            </td>
            <td width="30%" valign="top">
            	${proof_emp.ssn }
            </td>
        </tr>
        <tr>
            <td valign="top" style="background-color: gray;">
                <p align="center">
                    주 소
                </p>
            </td>
            <td valign="top" colspan="3">
            	${proof_emp.address }
            </td>
        </tr>
    </tbody>
</table>
<br>
<p>
    2. 재직사항
</p>
<table border="1" cellspacing="0" cellpadding="0" style="text-align: center;width: 100%;">
    <tbody>
        <tr>
            <td width="20%" valign="top"  style="background-color: gray;">
                <p align="center">
                    회 사 명
                </p>
            </td>
            <td width="30%" valign="top">
            	㈜가디
            </td>
            <td width="20%" valign="top"  style="background-color: gray;">
                <p align="center">
                    사업자번호
                </p>
            </td>
            <td width="30%" valign="top">
            	123-88-30201
            </td>
        </tr>
        <tr>
            <td valign="top"  style="background-color: gray;">
                <p align="center">
                    대 표 자
                </p>
            </td>
            <td  valign="top">
            	이 길재
            </td>
            <td  valign="top"  style="background-color: gray;">
                <p align="center">
                    대표전화
                </p>
            </td>
            <td  valign="top">
            	02-1253-8253
            </td>
        </tr>
        <tr>
            <td  valign="top"  style="background-color: gray;">
                <p align="center">
                    소 재 지
                </p>
            </td>
            <td valign="top" colspan="3">
            	서울특별시 금천구 가산동 신한이노플렉스 2차 209호
            </td>
        </tr>
        <tr>
            <td valign="top"  style="background-color: gray;">
                <p align="center">
                    근무부서
                </p>
            </td>
            <td  valign="top">
            	${proof_emp.dname }
            </td>
            <td width="97" valign="top"  style="background-color: gray;">
                <p align="center">
                    직 급
                </p>
            </td>
            <td valign="top">
            	${proof_emp.position }
            </td>
        </tr>
        <tr>
            <td valign="top"  style="background-color: gray;">
                <p align="center">
                    재직기간
                </p>
            </td>
            <td  valign="top" colspan="3">
            	${proof_emp.hiredate }부터 현재까지
            </td>
        </tr>
        <tr>
            <td  valign="top"  style="background-color: gray;">
                <p align="center">
                    사용용도
                </p>
            </td>
            <td  valign="top" colspan="3">
            	${purpose }
            </td>
        </tr>
    </tbody>
</table>
<br>
<p align="center">
    상기인이 위와 같이 재직하고 있음을 증명합니다.
</p>
<br>
<p align="center">
    ${proof_emp.sd }
</p>
<br>
<p align="center">
    ㈜가디 대표이사 이길재 (인)
</p>

</body>
</html>