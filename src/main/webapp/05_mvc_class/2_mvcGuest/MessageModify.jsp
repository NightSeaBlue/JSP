<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board_ex.model.*,board_ex.service.*" %>
 
<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("utf-8"); 
	
%>

<%	
		
	int result = (int)request.getAttribute("result");	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 글수정</title>
</head>
<body>

 <!--  // 방명록 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고-->
	<%if(result == 1) {%>
	<% response.sendRedirect("GuestControl?cmd=list-page"); %>			
<%-- 	<jsp:forward page="/JSP/GuestControl?cmd=list-page"></jsp:forward>  --%>
<!-- 수정이 되지 않을 경우 암호가 잘못 입력되었습니다를 출력 -->		
	<%} else {%>
       	암호가 잘못 입력 되었습니다.
	<%} %>


</body>
</html>