<%@page import="test.vo.MembersVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test04_for.jsp</title>
</head>
<body>
<%
	int[] a={10,20,30,40,50};
%>
<c:set var="a" value="<%=a %>"/>
<!-- items 속성에 배열요소를 지정함  -->
<c:forEach var="n" items="${a }">
	${n }
</c:forEach>
<br>
<c:forEach var="n" items="${a }" varStatus="vs">
	${vs.index }:${n }
</c:forEach>
<br>
<%
	ArrayList<MembersVo> list=new ArrayList<MembersVo>();
	list.add(new MembersVo(1,"홍길동","010","서울",null));
	list.add(new MembersVo(2,"이영희","011","부산",null));
	list.add(new MembersVo(3,"유관순","012","강남",null));
	request.setAttribute("list",list); //?
%>
<c:forEach var="vo" items="${requestScope.list }">
	번호:${vo.num }<br>
	이름:${vo.name }<br>
	전화:${vo.phone }<br>
	주소:${vo.addr }<br>
</c:forEach>
</body>
</html>