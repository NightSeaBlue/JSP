<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		<!-- language="java" 없어도 됨 -->
<%! String msg; %>
<%
	msg="안녕하세요~";
%>
<!--  주석을 상황에 맞게 사용할 것, 어느 단에서 처리해서 도움을 줄것 인지 -->
<!--  HTML 주석 : 제일 늦게 빠짐 --> 
<%-- JSP 주석 : 제일 먼저 빠짐 --%>
<% //JAVA 주석 : 두번 째로 빠짐 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
메세지 : <%= msg %> 
</body>
</html>