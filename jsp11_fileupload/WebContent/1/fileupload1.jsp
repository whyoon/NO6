<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileupload.jsp</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String scnt=request.getParameter("cnt");
	int cnt=0;
	if(scnt!=null){
		cnt=Integer.parseInt(scnt);
	}else{
		writer="";
		title="";
		content="";
		scnt="0";
	}
%>
<body>
	<form method="post" action="fileupload1.jsp">
		<table border="1" width="500">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="<%=writer%>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=title%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="50" name="content"><%=content %></textarea></td>
			</tr>
			<tr>
				<td>첨부파일갯수</td>
				<td><input type="text" name="cnt" value="<%=scnt%>">
				  <input type="submit" value="확인">
				 </td>
			</tr>
		</table>
	</form>
	<form action="fileuploadOk.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="writer" value="<%=writer%>">
		<input type="hidden" name="title" value="<%=title%>">
		<input type="hidden" name="content" value="<%=content%>">
		<table border="1" width="500">
		<%
			for(int i=1;i<=cnt;i++){
		%>
			<tr>
				<td>첨부파일</td><td><input type="file" name="file<%=i%>"></td>
			</tr>
		<%
			}
		%>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송">
			</td>
		</tr>
		</table>
	
	</form>
</body>
</html>


















