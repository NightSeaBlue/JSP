<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
	    $(function(){
	    	var param = {cate : "점심은",name : "뭘먹을까"};
	    	
	    	$.ajax({
	    		data : param,
	    		url : '04_server.jsp',
	    		dataType : 'text',		// 지금은 수업상 text 이지만, 추후 JSON 타입으로 받아야 함
	    		success : parseData 
	    		
	    	});
	    	
	    	function parseData(result) {
	    		//*************************************
	    		// 추후에 JSON 라이브러리 사용시 JSON 객체로 변환 필요
	    		
	    		var obj = {};
	    		obj = eval("("+result+")");				//eval : 자동으로 객체로 변환해줌
	    		$('#cate').val(obj.first);
	    		$('#name').val(obj.second);
	    	}
	    	    	
	    	
	    })
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


