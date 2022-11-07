<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 문법</title>
</head>
<body>

<!-- 변수 선언 -->
<c:set var='gender' value='male'/>

<c:if test="${gender eq 'male' }">당신은 남자입니다.</c:if>
<c:if test="${gender eq 'female' }">당신은 여자입니다.</c:if>
<br>
<!--  c:set 사이 value 입력가능 , when otherwise , 여러 조건 -->
<c:set var='age'>7</c:set>
<c:choose>
	<c:when test="${age lt 10}">어린이 입니다.</c:when>
	<c:when test="${age ge 10 and age lt 20}">청소년 입니다.</c:when>
	<c:otherwise> 성인 입니다.</c:otherwise>
</c:choose>
<hr>
<c:set var='sum' value = '0'/>
<c:forEach var='i' begin ='1' end = '100'>
	<c:set var='sum' value='${sum+i}'/>
</c:forEach>

1~100 까지의 합 : ${sum} <br>

<!-- 1부터 100 까지 짝수의 합 / 홀수의 합 출력 -->

<c:set var='sumeven' value='0'/>
<c:set var='sumodd' value='0'/>
<c:set var='even' value='0'/>
<c:set var='odd' value ='0'/>
<c:forEach var ='i' begin = '1' end = '100'>
   <c:if test="${i mod 2 eq 0}"> <c:set var='sumeven' value='${sumeven+i}'></c:set> </c:if>
   <c:if test="${i mod 2 eq 1}"> <c:set var='sumodd' value='${sumodd+i}'></c:set> </c:if>   
</c:forEach>

<c:forEach var='i' begin ='1' end = '1000'>
	<c:choose>
		<c:when test="${i mod 2 eq 0}">
			<c:set var='even' value='${even+i}'/>
		</c:when>
		<c:otherwise>
			<c:set var='odd' value='${odd+i}'/>
		</c:otherwise>
	</c:choose>
</c:forEach>

1~100 까지 짝수의 합 : ${sumeven} <br>
1~100 까지 홀수의 합 : ${sumodd} <br>

1~1000 까지 짝수의 합 : ${even} <br>
1~1000 까지 홀수의 합 : ${odd} <br>

</body>
</html>

<!-- 
	* JSP 기초 문법
	< %@ % > : 설정
			 - page
			 - include
			 - taglib : JSTL (JSP Standard Tag Library)
	< %! % > : 선언 (변수, 함수)
	< % % >	 : 스크립트릿 (자바코드)
	< %= % > : 표현식 (화면결과 출력) => EL 로 전환

--> 