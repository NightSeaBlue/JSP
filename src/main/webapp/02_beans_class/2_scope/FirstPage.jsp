<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%  //--------------------------- 값 지정
	pageContext.setAttribute("name", "KIM");			// 해당 페이지의 변수 설정
	request.setAttribute("name", "SEUNGMIN");			// 클라이언트가 서버에 요청(Request)
	session.setAttribute("name", "DOKDO");				// session에 정보 저장
	application.setAttribute("name", "KOREA");			// session에 비해 application이 범위가 더 넓음 (applicatioin : 여러 사용자 공유용)
	//application.log("FirstPage.jsp : " + pageContext.getAttribute("name") + "님 접속");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title> 첫번째 페이지 </title>
</head>
<body>

하나의 페이지 속성 : <%= pageContext.getAttribute("name") %> <br>
하나의 요청 속성 :	 <%= request.getAttribute("name") %> <br>
하나의 세션 속성 :	 <%= session.getAttribute("name") %> <br>
하나의 어플리케이션 속성 : <%= application.getAttribute("name") %> <br>


<!-- 
	request.getParameter("") : client 에서 넘기는 data를 받을 때

	request.getAttribute("") : requset.setAttribuet()에 저장한 정보를 가져올 때 (즉 server 단에서 저장한 데이터를 가져올 때)
	
 -->


<!-- #############  -->
<!-- <a href='SecondPage.jsp'>다음 페이지</a> -->
<!-- 페이지 forward 이동된다면  -->
<%-- <%  response.sendRedirect("SecondPage.jsp"); %> --%>
<jsp:forward page="SecondPage.jsp"></jsp:forward>
</body>
</html>