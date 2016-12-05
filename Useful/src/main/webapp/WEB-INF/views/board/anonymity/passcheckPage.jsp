<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#checkBtn").on("click",function(){
		/*  var serial=$('#serial').val();
		var pass=$('#btn-input').val(); */
		$.ajax({
				type:'POST',
				url:'/useful/board/anonymity/passcheckPage',
				data: {
					serial:"${serial}",
					pass:$('#btn-input').val() 
				},
				success:function(result){
				if(result=='SUCCESS'){
					opener.location="modifyPage?serial=${serial}";
					self.close();
				}else alert("안도미")
			}
		});
	});
});
</script>
</head>
<body>
<div class="col-lg-6" style="width: 100%;">
						<div class="list_number">
						
									<!-- 검색버튼 -->
									 <div class="panel-footer">
                            <div class="input-group" >
                            
                            
                              
                                <input name="keyword" id="btn-input" type="text" class="form-control input-sm" placeholder="게시물 비밀번호를 입력해주세요.." style="height: 30px;width: 85%;size: 30;"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm" id="checkBtn" type='button' style="height: 30px;">
                                        확인
                                    </button>
                                </span>
                            </div>
</body>
</html>