<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	<c:forEach var="변수" bagin="시작값" end="끝값" step="증감값">
		반복수행문장
	</c:forEach>
 --%>
<c:forEach var="i" begin="1" end="100" step="1">
	${i } &nbsp;
</c:forEach>
<br>
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum=sum+i }"/>
</c:forEach>
1부터 100까지 합: ${sum }<br>
<br>
<!-- 
	[2단] 2*1=2 ... 2*9=18
	[2단] 3*1=3 ... 3*9=18
	[2단] 2*1=2 ... 2*9=18

 -->
 <c:forEach var="i" begin="2" end="9">
	[${i }단] &nbsp;
	<c:forEach var="j" begin="1" end="9">
		${i}*${j }=${i*j } &nbsp;
	</c:forEach>
	<br>
</c:forEach>
 
</body>
</html>