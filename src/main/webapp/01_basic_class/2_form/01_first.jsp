<%-- JSP 기본 값, 없는 경우 한글이 다 깨져서 나옴 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 로그인창 </title>
</head>
<body>

<h3>로그인 확인하기 </h3> 
<form action="01_second.jsp" method="get"><!--  post 처리를 하는 경우 입력한 결과 가 보이지 않음 -->
사용자: <input name='User' type='text'><br/>
비밀번호: <input name='Pass' type='password'><br/>
<input type='submit' value='login'> <!-- submit 을 해야 서버로 입력한 결과가 넘어 옴 -->
</form>

</body>
</html>