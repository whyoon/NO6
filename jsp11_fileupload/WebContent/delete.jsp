<%@page import="test.file.dao.FileinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int filenum=Integer.parseInt(request.getParameter("filenum"));
		FileinfoDao dao=new FileinfoDao();
		int n=dao.delete(filenum);
		if(n>0){
			response.sendRedirect("list.jsp");
		}else{
	%>
			<h1>삭제실패</h1>
			<a href="main.jsp">메인으로</a>
	<%
		}
	%>
</body>
</html>