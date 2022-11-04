
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.guest.model.*" %>     
<%@ page import="java.util.List" %>

<%
	// Control에서 param에 저장한 mList 변수에 지정
	List <Message> mList = (List <Message>) request.getAttribute("param");
			
	// 이전 페이지로부터 파라미터를 받아 이를 변수에 지정
	String pNum = request.getParameter("page");
		

		
	int pageNo = 1;
	
	if (pNum != null) pageNo = Integer.parseInt(pNum);
	
	 
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 2 </title>
</head>
<body>
	
	<a href="insert.do?cmd=input-form">방명록 남기기 </a><br/><br/>
	
	<% if( mList == null ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for( Message msg : mList ) { %>
		<tr>	
			<td> <%= msg.getId() %> </td> 
			<td> <%= msg.getGuestName() %></td> 
			<td> <a href="modify.do?cmd=modify-form&id=<%= msg.getId() %>"> [ 수정하기 ]</a> </td>
			<td> <a href="delete.do?cmd=delete-form&id=<%= msg.getId() %>"> [ 삭제하기 ]</a> </td>			
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%= msg.getMessage() %>
			</textarea>
			</td>
		</tr>
		<% } %>
	</table> 
	

	<% } // end if-else %>
<%-- 	<a href='GuestControl?cmd=list-page&page=<%=1%>'>처음</a> 				<!-- 목록의 첫 페이지로 갈 수 있도록 url 부여/ property를 직접 생성해 부여 --> --%>
<%-- 	<%if(pageNo>1) { %> --%>
<%-- 	<a href='GuestControl?cmd=list-page&page=<%=pageNo-1 %>'>이전</a> 		<!-- pageNo 가 1보다 클 경우, 이전 화면(즉 페이지번호를 한개 줄여서)으로 갈 수 있도록 page부여 --> --%>
<%-- 	<%} // end of if --%>
<%-- 	  else {%>													<!-- pageNo가 1이거나 작을경우 -->						 --%>
<!-- 	 <a href=''>이전</a>											 아무 링크를 부여하지 않아 이전 버튼이 미작동하게 함	 -->
<%-- 	<%} %> --%>
<%-- 	 <%for (int i = 1 ; i <= totalPageCount;i++) { %>			<!-- 반복문 --> --%>
<%-- 			<a href='GuestControl?cmd=list-page&page=<%=i%>'>[<%= i %>]</a>		<!-- totalPage와 i가 같아질 때까지 반복문을 돌려 출력 -->	 --%>
<%-- 	<%}	// end of for %> --%>
<%-- 	<%if(pageNo == totalPageCount) { %> --%>
<%-- 	<a href='GuestControl?cmd=list-page&page=<%=totalPageCount %>'>다음</a> --%>
<%-- 	<%}// end of if --%>
<%-- 	else { %> --%>
<%-- 	<a href='GuestControl?cmd=list-page&page=<%=pageNo+1 %>'>다음</a> --%>
<%-- 	<%} // end of else %> --%>
<%-- 	<a href='GuestControl?cmd=list-page&page=<%=totalPageCount%>'>끝</a> --%>
	
	
	
	
</body>
</html>