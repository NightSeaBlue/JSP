<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>   
  
 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8");
 %>
  
 <!--  이전 폼의 각각의 데이터를 빈즈의 멤버로 지정  -->
 <jsp:useBean id="comment" class="mybatis.guest.model.Comment">
 	<jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>    
 <% System.out.println(comment); %>
 <!-- 서비스의 메소드 호출  -->
 <%
 int result = CommentService.getInstance().updateComment(comment);
 %>
    
    
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<% if (result !=0) { %>
수정되었는지 확인해보세요. <br/>
<a href="listComment.jsp">목록보기</a>
<%} else { %>
수정에 실패하였습니다. <br/>
<%}//end of if %>

</body>
</html>