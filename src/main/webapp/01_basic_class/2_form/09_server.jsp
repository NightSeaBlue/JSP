<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%
	// 1. 이전 폼의 사용자 입력값을 얻어 오기
	 int empno = Integer.parseInt(request.getParameter("empno"));
 	 String ename = request.getParameter("ename");
 	 String job = request.getParameter("job");
 	 int deptno = Integer.parseInt(request.getParameter("deptno"));
 	 int sal = Integer.parseInt(request.getParameter("sal"));
 			 
 	 
	// 2. EmpVO 멤버변수에 지정
	 EmpVO vo = new EmpVO();
	 vo.setEname(ename); 
	 vo.setDeptno(deptno);
	 vo.setEmpno(empno);
	 vo.setJob(job);
	 vo.setSal(sal);
	
	// 3. DB에 입력
	EmpDAO dao = EmpDAO.getInstance();		 
	dao.insert(vo);



%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었는지 DB에서 확인합니다.
	 <hr>
	 <!--  1-2) 얻어온 입력값 출력 -->
	 사번 :   	<%= vo.getEmpno() %><br>
	 사원명 :  	<%= vo.getEname() %><br>
	 부서번호 : 	<%= vo.getDeptno() %><br>
	 업무 :    	<%= vo.getJob() %><br>
	 월급 :		<%= vo.getSal() %>
	 
</body>
</html>