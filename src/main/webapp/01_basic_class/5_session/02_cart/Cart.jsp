<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="shop.cart.Goods" %> 
<% 
	String id="";
	String name ="";
	int price=0;

	ArrayList<Goods> glist = null;

	request.setCharacterEncoding("utf-8");		// 받는 데이터의 타입 한글 깨지지 않게 설정
	
	// 1. Form의 값(hidden값) 넘겨받기 ( id, name, price )
		id = request.getParameter("id");					// hidden 의 name에 따른 parameter의 값을 받아줄 변수 지정
		name = request.getParameter("name");
		price = Integer.parseInt(request.getParameter("price"));
	// 2. 세션의 cart 속성을 얻어온다.
		Object obj = session.getAttribute("cart");				// 애초에 cart라는 세션이 null 값임
	// 3. 만일 null이면 ArrayList 객체 새로 생성하고 그렇지 않으면 ArrayList 변수(glist)에 지정
	if (obj == null) {
		glist = new ArrayList <Goods> ();
		//session.setAttribute("cart", glist);
	} else {
		glist = (ArrayList <Goods>) obj;		// 만일 cart라는 세션에 값이 있는 경우, 이 값을 ArrayList 로 upcasting 해 glist에 지정
	}
	// 4. 1번의 값들을 Goods 객체로 생성후 ArrayList 에 추가
	Goods selectgoods = new Goods(id,name,price);				// id,name,price 를 가지는 Goods 객체 생성
	glist.add(selectgoods);										// glist 라는 ArrayList에 goods 추가
	
	//glist.add(new Goods(id,name,pirce));							=> 새로이 생성자 생성할 필요 없음
	// 5. 세션에 cart 라는 이름에 ArrayList를 저장
	session.setAttribute("cart",glist);							// session에 cart 다시 할당, value 할당

%>		 
		 
<html> 
<body bgcolor=white>
<%= name %> 을 구입하셨습니다.
 
<br><br><br>

<table>
<tr bgcolor="#e7a068"><th>상품명</th>
<th>가격</th></tr>

<%
		int n = glist.size(); 						// glist ArrayList 의 크기
		int sum = 0; 								// 선택한 제품에 대한 금액을 합칠 변수
		for(int i=0; i < n; i++) { 
			Goods goods = (Goods) glist.get(i); 	// glist 내 값이 있는 경우 해당하는 열의 값을 goods에 할당시킴 	
			int gp = goods.getPrice(); 				// 선택한 제품의 금액을 할당할 변수
			sum += gp; 								// 총액 합계
%>
			<tr><td align="center"> <%= goods.getName() %> </td>
				<td align="right"> <%= gp %> </td></tr>
<%
		} 		 
%>

<tr bgcolor="#e7a068"><td colspan="2" align="right"> 총액 : <%= sum  %></td></tr>
</table>

<br/><br/>
[<a href="wshop.jsp">쇼핑하러 가기</a>]
[<a href="Buy.jsp">구입하기</a>]

</body></html>

