<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- contentType="text/xml"이다. -->  
   
<%	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	
	// 2. 다시 화면으로 보낼 데이터 구성
	String result ="";
	
	result += "<data>";
	result += "<first>"+ "서버에서_"+cate+"_변경" +"</first>";
	result += "<second>"+ "from_"+name+"_server" +"</second>";
	result += "</data>";
	
	/* DATA 를 주고 받을 때 XML 구조로 주고받는 것이, 서로 다른 회사간 소통에 용이해, XML tag 타입으로 받는 경우들이 있었음 */
	
	out.write(result);
	
%>    
