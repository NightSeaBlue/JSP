<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.MemberDao" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입  </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		// 초기에 회원가입 버튼을 불활성화 시켜, 서식을 완성하게 유도
	$('#sign').attr('disabled','disabled');
		
		// 중복값 확인버튼 기능 구현 
	$('#ccheck').click(function(){		
		//alert('ok');
		$.ajax ({		// ajax 실행
			type : 'get',
			url  : 'CheckId.jsp',								// ajax를 실행할 주소
			data : {id : $("input[name='id']").val()},			// ajax를 위해 보낼 data : id 단에서 입력한 id
			dataType : 'text',									// 실행 후 받을 data의 type : text
			success : function(data) {							// Ajax 성공시 function 실행
				//alert(data);
				if(data.trim() == "true") {						// data의 결과 값의 공백을 제거한 값이 true와 일치할 때
					$('#result').text("중복된 아이디가 있습니다.");	// div의 tf에 할당
					$('#result').show();						// div display에 none을 부여해뒀음 ,show() 를 통해 보여주면 됨
					$('#sign').attr('disabled','disabled');
				} else if (data.trim() == "false"){				// 값이 false일 경우 (중복된 값이 없을 때)
					$('#result').text("아이디를 사용 가능 합니다.");
					$('#result').show();
					$('#sign').removeAttr('disabled');			// 회원가입 버튼의 기능 활성화 (disabled 요소 삭제)
				}
			}
		});
	});
		// 회원가입 버튼 기능 구현
	$('#sign').click(function(){								// 회원가입 버튼을 눌렀을 때
		//alert('ok');
		var pw =  $("input[name='password']").val();			// password 에 입력한 값을 가져옴
		var rePw = $("input[name='repassword']").val();			// repassword에 입력한 값을 가져옴
		if(pw == rePw) {										// 그 두개의 value가 일치할 때 AJAX 실행
		 $.ajax({
			type : 'get',
			url  : 'CheckPw.jsp',								// AJAX를 실행시킬 URL
			data : {id : $("input[name='id']").val(),pw : $("input[name='password']").val()},	// data : id 와 password
			dataType : 'text',																	// 실행 후 받을 data type : text
			success : function(data){															// AJAX 성공시 function 실행									
				if(data.trim() == "true") {														// data 가 true와 일치할 때
					alert("회원 가입이 불가능 합니다.");
					$('#sign').attr('disabled','disabled');										// submit 버튼 재불활성화	
				} else {																		// data가 false와 일치할 때 (즉 중복되는 아이디 비밀번호가 없을 때)
					alert("회원 가입이 가능 합니다.");							
					$('#sign').removeAttr('disabled');											// submit 버튼 활성화					
				}
			}
			
		});  
	} else {											// pw 와 rePw 가 일치하지 않을 때
		alert("비밀번호가 일치하지 않습니다.");					// 비밀번호가 일치하지 않는다는 alert 호출
		$('#sign').attr('disabled','disabled');			// 회원가입 버튼 불활성화
		window.location.reload();						// 이후 입력창을 새로고침 해, client가 다시 값을 입력하도록 유도	
	}
	});
	
})

</script>
</head>
<body>

<h1>회원가입서 작성하기</h1>
 
	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr>
				<td width="100">
				<font color="blue">아이디</font>
				</td>
				<td width="100">
				<input type="text" name="id" required>
				<input type="button" value="중복확인" id="ccheck"><br/>
				<div id="result" style="display:none;"></div>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호</font>
				</td>
				<td width="100">
				<input type="password" name="password" required/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호확인</font>
				</td>
				<td width="100">
				<input type="password" name="repassword" required/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">이름</font>
				</td>
				<td width="100">
				<input type="text" name="name" required/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">전화번호</font>
				</td>
				<td>
				<input type="text" size="15" name="tel"/>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">주소</font>
				</td>
				<td>
				<input type="text" size="50" name="addr"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				 <!--로그인 버튼-->
				 <input type="submit" value="회원가입" id="sign">	
				</td>
				<td width="100">
				<input type="reset" name="cancel" value="취소" id = "cancel"><br/>
				</td>
			</tr>
		</table>
	</form>



 </body>
</html>
    