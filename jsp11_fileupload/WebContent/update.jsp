<%@page import="test.file.vo.FileinfoVo"%>
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
<h1> 수정 </h1>
<!-- 파일업로드시에 enctype="multipart/form-data" 반드시 설정해야 함 -->
<%
	request.setCharacterEncoding("utf-8");

	int filenum=Integer.parseInt(request.getParameter("filenum"));
	FileinfoDao dao=new FileinfoDao();
	FileinfoVo vo= dao.getinfo(filenum);
	
	String writer=vo.getWriter();
	String title=vo.getTitle();
	String content=vo.getContent();
	String orgfilename=vo.getOrgfilename();
%>	

<form method="post" action="update_file.jsp" enctype="multipart/form-data">
	<table border="1" width="500">
		<tr>
			<td>작성자</td>
			<td>
				<input type="text" name="writer" value="<%=writer%>">
				<input type="hidden" name="filenum" value="<%=filenum %>">
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=title %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="5" cols="50" name="content"><%=content %></textarea></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><input type="file" name="file1"><span>기존파일:<%=orgfilename %></span></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송">
			</td>
		</tr>
	</table>
</form>
</body>
</html>