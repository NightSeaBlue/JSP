<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.MemberDao" %>     
<%
	String id = request.getParameter("id");			// Client가 입력한 id를 넘겨받음
	
	if (id == ""|| id == "null") {					// 입력한 id 가 없는 경우
		out.print("아이디를 입력해주세요.");				// id 를 입력하도록 유도
		return;										// 이후 다시 아이디를 입력하도록 return
	}
	
	MemberDao dao = MemberDao.getInstance();		// MemberDao 에 있는 기능을 실행하고자 singleton pattern으로 제작된 MemberDao를 import 후, getInstance 함수 호출
    boolean idChk = dao.isDuplicatedId(id);			// MemberDao 내 ID 중복검사 function 실행(결과가 boolean Type), 이를 받아줄 수 있는 Boolean Type 변수 지정
   
	
    if (idChk) {out.print(true);}					// 결과값이 true 일 때, true 로 돌려줌
    else 	   {out.print(false);}					// 결과값이 false 일 때, false 로 돌려줌
    
    
%>