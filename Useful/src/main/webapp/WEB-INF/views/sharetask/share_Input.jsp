<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

/* 첨부파일 css */
#imgInp{display: none;}
#fileName{ font-family: '맑은 고딕'; margin:0; border:0; width:600px; height:30px;  /* border:solid #b9b9b9 1px;  */}
#fileFind{
 background: #333;
 font-size:13px;
 padding:6px;
 color: white;
 font-family: '맑은 고딕';
 position: relative;
 cursor: pointer;
 

}



.border1 {
	border: solid #b9b9b9 1px;
	border-top: 0;
}

.border2 {
	border: solid #b9b9b9 1px;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}

.button1 {
	border: 0;
	height: 28px;
	color: #fff;
	background-color: #333;
	cursor: pointer;
	font-size: 13px;
}

.button2 {
	border: 0;
	height: 30px;
	color: #fff;
	background-color: #545250;
	cursor: pointer;
	font-size: 18px;
}

.ttr {
	width: 900px;
	height: 500px;
	margin: 0;
	border: 0;
}


</style>

</head>

<body>
	<center>
		<form action="/sharetask/insert" method="post">
			<table border="1"
				style="border-collapse: collapse; line-height: 30px;"
				width="900px">
				<tr>
					<td align="center" colspan="4" height="110px"
						align="center">업무 등록</td>
				</tr>
				<tr>
					<td bgcolor="#dae6f4"  align="center" width="150px">작성자</td>
					<td align="center" width="750px">
					<input type="text" name="writer" readonly="readonly" value="id같을때이름">
					<input type="hidden" name="writer" readonly="readonly" value="id같을때이름">
					</td>
				</tr>
				<tr>
				    <td bgcolor="#dae6f4"  align="center" width="150px">분류</td>
				    <td>
				    <select name="category">
				    <option value="선택">선택</option>
				    <option value="업무관련">업무관련</option>
				    <option value="회의관련">회의관련</option>
				    <option value="기타">기타</option>
				    </select>
				    </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#dae6f4" width="150px">첨부파일</td>

					<td align="center" style="padding:0;">
					<!-- <input type="file" id="imgInp" name="file" accept=".gif, .jpg, .png" onchange="javascript: document.getElementById('fileName').value = this.value"> 
					<input type="text" id="fileName"> &nbsp; 
					<label for="imgInp"><span id="fileFind">파일찾기</span></label>&nbsp;
					<input type="button" class="button1" value="취소" id="filecancle" /> -->
					</td>
				</tr>
				<tr><td colspan="2" align="center">등록 ---> 첨부파일 뜨기--->삭제버튼도 추가</td></tr>
				<tr>
					<td bgcolor="#dae6f4" align="center" width="150px">제목</td>
					<td width="420px" style="padding: 0;">
					<input type="text" name="title" style="width: 750px; height: 30px; margin: 0; border: 0;"></td>

				</tr>

				<tr>
					<td colspan="2" style="padding:0;"><textarea name="content" style="font-size:15px; width: 900px; margin: 0; height:500px; border:0;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit"  value="등록" /> 
					<input type="button"  value="취소" onclick="" /></td>
				</tr>
				<tr height="100px"></tr>
			</table>
		</form>
	</center>
</body>
</html>