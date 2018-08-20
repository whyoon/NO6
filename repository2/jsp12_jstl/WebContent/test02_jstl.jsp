<form method="post" action="result1"></form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test02_jstl.jsp</title>
</head>
<body>
<!-- 변수선언 -->
<c:set var="name" value="홍길동"/>
이름 : ${name }
<!--
	if문
	형식)
	<c:if test="$(조건식)">
		수행할 문장
	</c:if>

-->
<c:set var="id" value="admin"/>
<c:if test="${id=='admin'}">
	<p>당신은 관리자이군요!</p>
</c:if>
<%--
	<c:choose>
		<c:when test="${조건식}">
			조건에 맞을때 수행할 문장
		</c:when>
		<c:when test="${조건식}">
			조건에 맞을때 수행할 문장
		</c:when>
		<c:others>
			조건에 모두 맞지 않을때 수행할 문장
		</c:others>
	</c:choose>

--%>
<%
	session.setAttribute("grade", "silver");
%>
<c:choose>
	<c:when test="${sessionScope.grade=='gold' }">
		당신은 gold입니다.<br>
	</c:when>
	<c:when test="${sessionScope.grade=='silver' }">
		당신은 실버입니다.<br>
	</c:when>
	<c:when test="${sessionScope.grade=='bronze' }">
		당신은 브로즈 입니다.<br>
	</c:when>	
	<c:otherwise>
		비회원입니다.<br>
	</c:otherwise>
</c:choose>
<br>
<!-- 임의의 정수를 입력받아 result1.jsp에서 짝수인지 홀수인지 출력해 보세요.
jstl 사용 -->
	임의의 정수<input type="text" name="num1"><br>
	<input type="submit" value="짝수홀수판별">
</form>


</body>
</html>