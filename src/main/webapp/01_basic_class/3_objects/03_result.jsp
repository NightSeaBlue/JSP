<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");						// 클라이언트가 입력해서 보내는 값이 한글이 있는 경우 깨지지 않게
	String name = request.getParameter("name");					// 클라이언트가 입력한 name 값 가져옴
	String [] animal = request.getParameterValues("animal");	// animal의 경우 checkbox 형태, parameter 가 복수형으로 존재함
	String choosepet = "";										// 선택한 결과
	for(int i=0; animal !=null && i<animal.length;i++) {		// 선택 값이 있는 경우 그 결과를 choosepet 에 할당
		choosepet+=animal[i];									
	}

%>    
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>03_result.jsp</title>
</head>
<body>

<!--  이전 화면에서 사용자 입력값을 얻어와서 
		- request.getParameter("")
		- request.getParameterValues("")
			화면 출력 -->
			
 이름 : <%=name %>
 동물 : <%=choosepet %>			


</body>
</html>