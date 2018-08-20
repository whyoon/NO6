<%@page import="test.file.vo.FileinfoVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dao.FileinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>파일목록</h1>	
<table border="1" width="800">
	<tr>
		<th>파일번호</th><th>작성자</th><th>제목</th><th>파일크기</th><th>삭제</th><th>다운로드</th><th>수정</th>
	</tr>
<%
	FileinfoDao dao=new FileinfoDao();
	ArrayList<FileinfoVo> list=dao.list();
	
	for(FileinfoVo vo:list){
		int filenum=vo.getFilenum();
%>		
	<tr>
		<td><%=filenum %></td>
		<td><%=vo.getWriter() %></td>
		<td><%=vo.getTitle() %></td>
		<td><%=vo.getFilesize() %>byte</td>
		<td><a href="delete.jsp?filenum=<%=filenum %>">삭제</a></td>
		<td><a href="download.do?filenum=<%=filenum %>">다운로드</a></td>
		<!-- 파일에 대한 정보 폼에 보이기 
		-->
		<td><a href="update.jsp?filenum=<%=filenum %>">수정</a></td>
	</tr>
<%
	}
%>
	
</table>
</body>
</html>