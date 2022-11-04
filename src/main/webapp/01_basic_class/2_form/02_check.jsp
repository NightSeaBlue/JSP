<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
		// 1) 이전화면에서 사용자 입력값을 얻어옴
        // request.getParameter("");		단일
       // request.getParameterValues(""); 다중
       String name = request.getParameter("name");
       String gender = request.getParameter("gender");
       String occup = request.getParameter("occupation");
       String[] hobby = request.getParameterValues("hobby"); 
       String hobbyTxt ="";
       //if(hobby != null) {
       for(int i = 0 ; hobby !=null && i < hobby.length ; i++) {
    	   hobbyTxt = hobby[i]+"/";
       	}
       //}
       
       
	   	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 결과</title>
</head>
<body>
	<!--  2) 얻어온 입력값을 화면에 출력하기 -->
	<h2>폼 입력 결과</h2>
	입력한 이름 : <%= name %><br> 
	입력한 성별 : <%= gender %><br> 
	입력한 직업 : <%= occup %><br> 
	입력한 취미 : <%= hobbyTxt %>


	<%-- if(hobby == null) { out.print("--"); } else {for(String s : hobby) out.print(s+" ");}--%>

	<%-- try { 
				   <%-- for(String s : hobby) out.print(s+" "); --%>
	<%-- }catch (NullPointerException e) {
					   System.out.print(e.toString());
				   } catch(Exception e){
					   e.printStackTrace();
				   }--%>
</body>
</html>