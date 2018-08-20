<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test01_el.jsp</title>
</head>
<body>
10+20 : <%=10+20 %><br>
10+20 : ${10+20 }<br>
10>20 : ${10>20 }<br>
10>20 : ${10 gt 20 }<br>
<%--
//http://localhost:8081/jsp12_jstl/test01_el.jsp?id=song&pwd=1234
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	out.print(id+"<br>");
	out.print(pwd +"<br>");
--%>
param.id :  ${param.id }<br>
param.pwd : ${param.pwd }<br>
<%
	session.setAttribute("id","hello");
	session.setAttribute("pwd","1234");
%>
<%--
	String id=(String)session.getAttribute("id");
	String pwd=(String)session.getAttribute("pwd");
	out.println("세션에 저장된 아이디:" + id +"<br>");
	out.println("세션에 저장된 비밀번호:" + pwd +"<br>");
--%>

세션에 저장된 아이디 : ${sessionScope.id }<br>
세션에 저장된 비밀번호 : ${sessionScope.pwd }<br>
세션에 저장된 아이디 : ${id }<br>
세션에 저장된 비밀번호 : ${pwd }<br>

<%
	//requestScope에 name저장하고 꺼내와 출력해 보기
	request.setAttribute("name","홍길동");
%>
name : ${requestScope.name }<br>

<!-- result.jsp에서 el을 사용해서 두수곱 출력해 보세요. -->
<form method="post" action="result.jsp">
	수1<input type="text" name="num1"><br>
	수2<input type="text" name="num2"><br>
	<input type="submit" value="곱구하기">
</form>
</body>
</html>












