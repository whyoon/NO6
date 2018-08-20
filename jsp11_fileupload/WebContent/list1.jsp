<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dao.FileinfoDao"%>
<%@page import="test.file.vo.FileinfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list1.jsp</title>
</head>
<body>
<h1>파일목록</h1>
<table border="1" width="500">
	<tr>
		<th>파일번호</th><th>작성자</th><th>제목</th><th>이미지</th>
	
	</tr>
	<%
		FileinfoDao dao=new FileinfoDao();
		ArrayList<FileinfoVo> list=dao.list();
		for(FileinfoVo vo:list){
	%>
		<tr>
			<td><%=vo.getFilenum() %></td>
			<td><%=vo.getWriter() %></td>
			<td><%=vo.getTitle() %></td>
			<td>
			<img src="upload/<%=vo.getOrgfilename()%>" style="width:100px;height:100px">
			</td>
		</tr>
	<%
		}	
	%>
</table>
</body>
</html>











