<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="shop.cart.Goods"%>
<%@ page import="java.util.*"%>

<%
ArrayList<Goods> glist = null;

request.setCharacterEncoding("utf-8");

// 1. 세션에서 지정한 cart 속성값을 얻어온다
Object obj = session.getAttribute("cart");							//기존에 설정된 cart 섹션값 가져옴
// 2. 위의 값이 null 이면 리턴하고, 그렇지 않으면 glist 에 세션의 값을 지정
if (obj == null) {													// 아무것도 카트에 안 담았으면 초기화
	return;
} else {
	glist = (ArrayList<Goods>)obj;									// cart session = obj 이므로 obj의 값을 ArrayList type으로 upcasting 해 glist에 지정
}

// 3. 세션에서 속성을 제거한다
session.removeAttribute("cart");									// session에서 cart 값 제거 : 제거 해야 하는 이유 - 구매 이력 초기화
%>

<html>
<body bgcolor="white">
	<table>
		<tr bgcolor="#e7a068">
			<th>상품명</th>
			<th>가격</th>
		</tr>

		<%
		int sum = 0;							// 구매 금액의 총합을 구할 변수
		int n = glist.size();					// ArrayList인 Glist 의 길이(크기)

		for (int i = 0; i < n; i++) {
			Goods goods = (Goods) glist.get(i);		//glist에 입력된 정보들이 있을 경우, 해당하는 행의 정보를 goods에 할당함
			int gp = goods.getPrice();				// goods 내 price의 getter를 통해 가격을 가져오고 이를 변수에 할당
			sum += gp;								// 할당된 변수 만큼 sum에 합함.
		%>
		<tr>
			<td align="center"><%=goods.getName()%></td>
			<td align="right"><%=gp%></td>
		</tr>
		<%
		}
		%>
		<tr bgcolor="#e7a068">
			<td colspan="2" align="right">총액 : <%=sum%>
			</td>
		</tr>
	</table>

	<br>
	<br>
	<a href="wshop.jsp">다시 쇼핑하기</a>
</body>
</html>
