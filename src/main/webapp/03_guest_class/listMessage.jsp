<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%	
	// client가 선택한 페이지 번호를 넘겨받음
	String pNum = request.getParameter("page");

	// 전체 메세지 레코드 검색 
	ListMessageService service = ListMessageService.getInstance();		// singleton type using
	List <Message> mList =  service.getMessageList(pNum);				// listMessageService 내 getMessageList function 사용
	
	int totalPageCount = service.getTotalPage();						// ListMessageService 내 getTotalPage() function 사용
	
	// 페이지 번호를 받아줄 변수 선언
	int pageNo = 1;
	// pNum 이 null 이 아닐 때 페이지 번호에 pNum 의 정수형 값을 할당함.
	if(pNum != null) {pageNo = Integer.parseInt(pNum);}
		
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

	<% if( mList.isEmpty() ) { %>				<!-- isEmpty() : boolean type / list 내 아무런 값이 없으면 true , 있으면 false -->
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for (Message m : mList) { %>			<!--  each for 문 // 배열의 값이 있으면 이를 다시  class 에 할당해 출력 -->
		<tr>	
			<td><%=m.getMessageId() %> </td> 
			<td><%=m.getGuestName() %> </td> 
			<td> <a href="deleteMessage.jsp?messageId=<%=m.getMessageId() %>">삭제하기</a> </td>		<!-- 삭제하기 버튼에 삭제를 실행할 페이지 url 하이퍼링크 부여 -->	
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%=m.getMessage() %></textarea>
			</td>
		</tr>
		<%} // end of for %>
	</table>
	
	<% } // end if-else %>

	<a href="insertMessage.jsp">글쓰기</a>						<!-- 글쓰기에 글을 쓸 수 있는 url 부여 -->
	<hr>
	<a href='listMessage.jsp?page=<%=1%>'>처음</a> 				<!-- 목록의 첫 페이지로 갈 수 있도록 url 부여/ property를 직접 생성해 부여 -->
	<%if(pageNo>1) { %>
	<a href='listMessage.jsp?page=<%=pageNo-1 %>'>이전</a> 		<!-- pageNo 가 1보다 클 경우, 이전 화면(즉 페이지번호를 한개 줄여서)으로 갈 수 있도록 page부여 -->
	<%} // end of if
	  else {%>													<!-- pageNo가 1이거나 작을경우 -->						
	 <a href=''>이전</a>											<!--  아무 링크를 부여하지 않아 이전 버튼이 미작동하게 함 -->	
	<%} %>
	<%for (int i = 1 ; i <= totalPageCount;i++) { %>			<!-- 반복문 -->
			<a href='listMessage.jsp?page=<%=i%>'>[<%= i %>]</a>		<!-- totalPage와 i가 같아질 때까지 반복문을 돌려 출력 -->	
	<%}	// end of for %>
	<%if(pageNo == totalPageCount) { %>
	<a href='listMessage.jsp?page=<%=totalPageCount %>'>다음</a>
	<%}// end of if
	else { %>
	<a href='listMessage.jsp?page=<%=pageNo+1 %>'>다음</a>
	<%} // end of else %>
	<a href='listMessage.jsp?page=<%=totalPageCount%>'>끝</a>
</body>
</html>