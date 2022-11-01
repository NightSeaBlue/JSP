<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="libs/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
$(function(){
		var param = {cate:"book", name:"hong"};			//JSON = 객체 형식으로 주고받는 패턴
		
		/* $.ajax({
			type : 'get',				// get 과 post 의 약간의 용량차, browser 별로 기본 ajax 타입이 다름,브라우저별 공통성을 주고자 기입
			data : param,
			url	 : '01_server.jsp',
			success : parseData,
			error : function(err){
				alert('전송 오류');
				console.log(err);		// 오류 발생한 것을 보고자 임의의 인자 지정
			} 
		}); */
		
		$.get('01_server.jsp',param,parseData);		// 축약형 , 권장하진 않음
		
function parseData(strText){
			// alert( strText );
			var aryData = strText.split("|");				// 넘겨받은 data 가 text type 이므로(String), split 함수 실행 가능
			for(var i=0;i<aryData.length;i++){
				var param  = aryData[i].split("=");			// aryData 에 cate=cate / name=name 일케 드가있음	
				if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 공백이 들어와서 cate를 찾지 못함
					 document.getElementById("cate").value = param[1];
				}
				
				if( param[0].trim() == 'name'){
					document.getElementById("name").value = param[1];
				}
			}
		}
	
	
})	
	
</script>

</head>


<body>
	서버로부터 넘겨받은 데이터
	<br /> 첫번째 데이터 :
	<input type="text" name="" id="cate" />
	<br /> 두번째 데이터 :
	<input type="text" name="" id="name" />
	<br />
</body>
</html>


