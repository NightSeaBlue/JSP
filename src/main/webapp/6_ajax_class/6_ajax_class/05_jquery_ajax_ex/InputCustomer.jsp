<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 고객관리 프로그램 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" >
 $(function(){
	 
	$('#btnInsert').click(function(){
		// 원래 통신
		/* $('form').attr('action','DataInput.jsp');
		$('form').submit(); */								//insert 의 타입이 button임, 직접 submit 시켜야 함
		
		// 1) Ajax 통신을 위해 사용자 입력값을 객체 형식으로 저장
		//		=> 추후 폼객체 serialize() 참고
		var param = {name : $('#name').val(),age:$('#age').val(),tel : $('#tel').val(),addr : $('#tel').val()};
		//alert(param)
		//alert('OK');
		$.ajax({
			url : 'DataInput.jsp',
			type : 'get',
			data : param,
			success : function(data){
				//alert('<'+data+'>');
				if(data.trim() == '1') {				// 클라이언트와 서버 교류시 공백이 생기므로 공백 제거
					alert("입력 성공");
					// 화면 입력값을 초기화
					$('#name').val('');
					$('#age').val('');
					$('#tel').val('');
					$('#addr').val('');
				} else {
					alert("입력 실패");
				}
			}
		});
	});
	 
	 
	 $('#btnSelect').click(function(){
		// alert('OK');
		$.ajax({
			url 	 : 'DataSelect.jsp',
			dataType : 'xml',
			success  : selectResult 
		});
	 });
	 
	 
	 function selectResult(data) {
		 var person =$(data).find('person');		// consol을 확인을 해보면, 	person 밑에 name 부터 쫙 나와있음
		 //console.log(data);
		 //alert(person.length);					// 테이블에 입력되어 있는 값이 배열로 되어 있어, length를 찍으면 배열의 길이 측정 가능함
		 
		 $('#tbd').empty();							// tbody단 정리 (새로운 데이터를 붙이기 위해)
		 
		 person.each(function(){					// 사람 한명 한명별로 기능을 제공 (입력된 사람들이 다 다른사람이니까)
			 /* 이름,나이,전화번호, 주소를 할당받을 변수 설정 */
		 	 var name = $(this).find('name').text();			
			 var age = $(this).find('age').text();
			 var tel = $(this).find('tel').text();
			 var addr = $(this).find('addr').text();			
		 
			 /* 동적 tr을 만들고, 거기에 동적 td를 만들어 값을 붙임 */
			$('#tbd').append ('<tr>'
						+'<td>'+name+'</td>'
						+'<td>'+age+'</td>'
						+'<td>'+tel+'</td>'
						+'<td>'+addr+'</td>'
						+'<tr/>')
		
		 });
	 }
	 
 });
 

</script>

</head>


<!-- <body> -->
<body>

<h2> 고객정보 입력 </h2>

<form name="inForm" method="post">
<table border = 1>
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tr>
		<td align="center"><input type="text" size="8" name="name" id="name"></td>
		<td align="center"><input type="text" size="4" name="age" id="age"></td>
		<td align="center"><input type="text" size="12" name="tel" id="tel"></td>
		<td align="center"><input type="text" size="30" name="addr" id="addr"></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> 
			<input type="button" id='btnInsert' value="입력">
		</td>
	</tr>
</table>

<br>
<hr>

<h2> 고객정보 목록보기  </h2>
<table border='0' width="510"> 
	<tr>
		<td align="right"><input type="button"  id='btnSelect' value="가져오기"></td>
	</tr>
</table>
<table border = 1 id="listTable">
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tbody id='tbd'></tbody>
</table>
<div id="myDiv"> </div>

</form>
</body>
</html>