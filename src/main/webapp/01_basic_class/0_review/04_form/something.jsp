<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="member.dao.*"%>

<%
	// 0. 한글처리
	request.setCharacterEncoding("utf-8");
	//1. 이전 폼의 입력값 얻어오기
	String realname = request.getParameter("realname");
	String nickname = request.getParameter("nickname");
	String myemail = request.getParameter("myemail");
	int myage = Integer.parseInt(request.getParameter("myage"));

 	//2. VO객체에 저장하기
	 MemberVO vo = new MemberVO();
 	vo.setRealname(realname);
 	vo.setNickname(nickname);
 	vo.setMyemail(myemail);
 	vo.setMyage(myage);
 
 	//3. DB에 입력하기
 	MemberDAO dao = MemberDAO.getInstance();
 	dao.insert(vo);
 	//4. 출력은 알아서

		


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 결과</title>
</head>
<body>
	본명 : <%=vo.getRealname() %>
	이명 : <%=vo.getNickname() %>
	이메일 : <%=vo.getMyemail() %>
	나이 :  <%=vo.getMyage() %>
</body>
</html>