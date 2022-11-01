<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.MemberDao" %>  
<%
	String id = request.getParameter("id");				// checkLogin 함수를 실행하기 위해 , Client가 입력한 id 와 pw를 받음
	String pw = request.getParameter("password");
	
	if(pw == "" || pw == "null") {						// 비밀번호를 입력하지 않은 경우, 비밀번호를 입력하도록 유도
		out.print("비밀번호를 입력하세요");
		return;
	}
	
	 MemberDao dao = MemberDao.getInstance();	
	 boolean result = dao.checkLogin(id, pw);

	 if (result) {out.print(true);}
	 else		{out.print(false);}

%>