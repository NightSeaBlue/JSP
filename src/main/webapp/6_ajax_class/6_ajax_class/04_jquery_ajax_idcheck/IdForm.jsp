<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		
	$('#id_check').click(function(){
	//$('.userinput').keyup(function(){			// 키보드 하나를 치고 땔 때마다 FUNCTION 발동
		//alert('아프다');
		$.ajax({
			type : 'get',
			url : 'IdCheck.jsp',
			data : {id : $('.userinput').val()},
			success : function(data){
				//alert('<'+data+'>');				// 서버와 통신할 경우 공백이 조오오오온나게 생김
				if(data.trim() == "YES") {
					$('#idmessage').text("이미 존재하는 아이디입니다.");
					$('#idmessage').show();
				}else if(data.trim()=="NO") {
					$('#idmessage').text("사용가능한 아이디입니다.");
					$('#idmessage').show();
				}
			}
			
		});
	})	
	
	
	
})
	

</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>