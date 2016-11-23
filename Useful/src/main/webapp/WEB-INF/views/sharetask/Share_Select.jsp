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
		<form action="#" method="post">
			<table border="1"
				style="border-collapse: collapse; line-height: 30px;"
				width="900px">
				<tr>
					<td align="center" colspan="4" height="110px"
						align="center">업무 상세</td>
				</tr>
				<tr><td colspan="4" align="right">글번호: 1 조회수: 3 <a href="">이전</a> <a href="#">다음</a></td></tr>
				<tr>
					<td bgcolor="#dae6f4"  align="center" width="150px">작성자</td>
					<td align="center" width="300px" ></td>
					<td bgcolor="#dae6f4" align="center" width="150px">작성일</td>
					<td align="center" width="300px"></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#dae6f4" width="150px">첨부파일</td>
					<td align="center" colspan="3" width="750px" style="padding:0;">
					<input type="file" id="imgInp" name="file" accept=".gif, .jpg, .png" onchange="javascript: document.getElementById('fileName').value = this.value"> 
					<input type="text" id="fileName"> &nbsp; 
					<label for="imgInp"><span id="fileFind">파일찾기</span></label>&nbsp;
					<input type="button" class="button1" value="취소" id="filecancle" />
					</td>
				</tr>
				<tr><td colspan="4" align="center">첨부파일 차례로</td></tr>
				
				<tr>
					<td bgcolor="#dae6f4" align="center" width="150px" readonly="readonly">제목</td>
					<td colspan="3" style="padding: 0;">
					<input type="text" name="title" style="width: 753px; height: 30px; margin:0; border:0;"></td>

				</tr>

				<tr>
					<td colspan="4" style="padding:0;">
					<textarea name="contents" readonly="readonly" style="width: 900px; margin: 0; height:500px; border:0;">
					수정 -->수정,목록 버튼 사라지고 확인버튼과 취소버튼 보여줌
					삭제 -->확인창 띄워주고 확인하면 리스트로 감
					*본인글 일때만 수정/삭제 버튼 보여줌
					*본인이 아닐경우 목록버튼
					*관리자는 수정/삭제 가능
					
					</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
					<input type="submit"  value="수정" /> 
					<input type="submit"  value="삭제" />
					<input type="button"  value="목록" onclick=""/></td>
				</tr>
			
			</table>
		</form>
	</center>
</body>
</html>