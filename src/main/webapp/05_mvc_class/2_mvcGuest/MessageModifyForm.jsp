<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.guest.model.*, mvc.guest.command.*" %>
<%
	// 1. 수정할 레코드의 게시글번호를 넘거받기
	String id = request.getParameter("id");
	// 2. param 에 해당하는 요소를 모두 가져옴
	Message msg = (Message)request.getAttribute("msg");
	

	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정하기</title>
</head>
 <body>
 	
	<h4> 방명록 글 수정하기 </h4><br/>
	<form name='frm' method='post' action="modify-confirm.do?cmd=modify-confirm">
	<input	type='hidden' name='id' value='<%=msg.getId()%>' >
	작 성 자 : <input type='text' name='guest_name' value='<%=msg.getGuestName()%>'><br/><br/>
	패스워드(수정/삭제시 필요) :
			<input type='password' name='password'><br/><br/>
	내  용 : <textarea name='message' rows='10' cols='40'><%=msg.getMessage()%></textarea><br/><br/>

	<input type='submit' value='수정하기'>
	<input type='button' value='목록보기' onclick="window.location='listMessage.jsp'">
	</form>

</body>
</html>