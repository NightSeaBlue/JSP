<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="Info.*" %>

<%
		/* InfoBean bean = new InfoBean();
		//받는 데이터의 타입 한글 깨지지 않게 설정
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		bean.setName(name);
		
		String id = request.getParameter("id");
		bean.setId(id); */
		

%>

<jsp:useBean id="bean" class="Info.InfoBean">
	<!--<jsp:setProperty name = "bean" property="name"/>
	<jsp:setProperty name = "bean" property="id"/>-->
	<jsp:setProperty name = "bean" property="*"/>
</jsp:useBean>
	



<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <%=bean.getName() %><br/>
	주민번호 : <%=bean.getId() %><br/>
	성  별   : <%=bean.getGender() %><br/>  
	맞습니까????
</body>
</html>