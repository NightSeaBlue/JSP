<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="board_ex.model.*, board_ex.service.*" %>
<%@ page import="java.util.List" %>

<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>

<%

String pNum = request.getParameter("page"); 
System.out.println(pNum);

// 전체 메세지 레코드 검색

ListArticleService service = ListArticleService.getInstance(); 
List <BoardVO> mList =  service.getArticleList(pNum);

int totalPageCount = service.getTotalPage();

// 페이지 번호를 받아줄 변수 선언
int pageNo = 1;
// pNum 이 null 이 아닐 때 페이지 번호에 pNum 의 정수형 값을 할당함.
if(pNum != null) {pageNo = Integer.parseInt(pNum);}

 
%>

<HTML>
<head><title> 게시글 목록 </title>
</head>

<BODY>

	<h3> 게시판 목록 </h3>
	
	<table border="1" bordercolor="darkblue">
		
	<% if( mList.isEmpty() ) { %>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
	<!--  여기에 목록 출력하기  -->
	<% for(BoardVO b : mList) { %>
	<tr>
		<td> 글번호 <%=b.getSeq() %> </td>
		<td><a href='BoardView.jsp?seq=<%=b.getSeq() %>' >제 목 <%=b.getTitle() %></a></td>
		<td> 작성자 <%=b.getWriter() %></td>
		<td> 작성일 <%=b.getRegdate() %></td>
		<td> 조회수 <%=b.getCnt() %></td>
	</tr>
	<%}	// end of for %>
	<% }  %>
		<tr>
			<td colspan="5">
				<a href="BoardInputForm.jsp">글쓰기</a>
			</td>
		</tr>		
	</table>
	
	<hr>
	<a href='BoardList.jsp?page=<%=1%>'>처음</a> 				<!-- 목록의 첫 페이지로 갈 수 있도록 url 부여/ property를 직접 생성해 부여 -->
	<%if(pageNo>1) { %>
	<a href='BoardList.jsp?page=<%=pageNo-1 %>'>이전</a> 		<!-- pageNo 가 1보다 클 경우, 이전 화면(즉 페이지번호를 한개 줄여서)으로 갈 수 있도록 page부여 -->
	<%} // end of if
	  else {%>													<!-- pageNo가 1이거나 작을경우 -->						
	 <a href=''>이전</a>											<!--  아무 링크를 부여하지 않아 이전 버튼이 미작동하게 함 -->	
	<%} %>
	<%for (int i = 1 ; i <= totalPageCount;i++) { %>			<!-- 반복문 -->
			<a href='BoardList.jsp?page=<%=i%>'>[<%= i %>]</a>		<!-- totalPage와 i가 같아질 때까지 반복문을 돌려 출력 -->	
	<%}	// end of for %>
	<%if(pageNo == totalPageCount) { %>
	<a href='BoardList.jsp?page=<%=totalPageCount %>'>다음</a>
	<%}// end of if
	else { %>
	<a href='BoardList.jsp?page=<%=pageNo+1 %>'>다음</a>
	<%} // end of else %>
	<a href='BoardList.jsp?page=<%=totalPageCount%>'>끝</a>
		
</BODY>
</HTML>
