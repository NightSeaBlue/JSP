<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.MemberDao" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>
<% 
	String id= request.getParameter("userId");		// ID : 클라이던트가 입력한 ID

	MemberDao dao = MemberDao.getInstance();		// Singleton Type 이므로 getInstance 이용
	boolean idChk=dao.isDuplicatedId(id);			// isduplicatedID 의 실행 결과값이 boolean Type 이므로 이를 받아줄 변수 지정
%>
<% if (id.equals(null) || id.equals("")) { %>		<!-- id의 입력된 값이 null값 일 때 -->
		아이디를 입력해 주십시오.
<%}else if(idChk = true) {%>						<!-- idChk 객체값이 true 일 때  -->
		사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  }else { %>
		사용할 수 있는 아이디입니다.
<%  } %>

</body>
</html>