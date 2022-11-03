<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board_ex.model.*,board_ex.service.*" %>
 
<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("utf-8");
	
%>

<!-- 1. 이전 화면의 입력값을 넘겨받아 BoardVO 객체의 각 멤버변수로 지정 -->
<jsp:useBean id="vo" class="board_ex.model.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%	
	
	// 2. Service에 update() 호출하여 레코드 수정
	ModifyArticleService service = ModifyArticleService.getInstance();
	int result = service.update(vo);	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
</head>
<body>

 <!--  // 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고-->
	<%if(result == 1) {%>
		<jsp:forward page="BoardView.jsp?seq=<%=vo.getSeq() %>"></jsp:forward>
<!-- 수정이 되지 않을 경우 암호가 잘못 입력되었습니다를 출력 -->		
	<%} else {%>
       	암호가 잘못 입력 되었습니다.
	<%} %>


</body>
</html>