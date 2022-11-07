<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="mybatis.guest.model.Comment"%>
<%@ page import="mybatis.guest.service.CommentService"%>

<% 
int commentNo = Integer.parseInt(request.getParameter("commentNo"));
int result = CommentService.getInstance().deleteCommentByPrimaryKey(commentNo);

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePage</title>
</head>
<body>
<% if(result !=0) {%>
	삭제 되었습니다.
	window.location.replace("listComment.jsp");
<% } else { %>
	삭제에 실패하였습니다.
<%} // end of if %>		

</body>
</html>