<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String path=application.getRealPath("/upload");
	MultipartRequest mr=new MultipartRequest(
				request,
				path,
				1024*1024*5,
				"utf-8",
				new DefaultFileRenamePolicy()
			);
	System.out.println("path:" + path);
	String writer=mr.getParameter("writer");
	String title=mr.getParameter("title");
	String content=mr.getParameter("content");
%>
<h1>파일업로드 완료</h1>
<ul>
	<li>작성자:<%=writer %></li>
	<li>제목:<%=title %></li>
	<li>내용:<%=content %></li>
</ul>
<%
	Enumeration<String> em=mr.getFileNames();
	while(em.hasMoreElements()){
		String name=em.nextElement();
		out.println("전달된 파라미터 이름:" + name +"<br>");
		String orgfilename=mr.getOriginalFileName(name);
		String savefilename=mr.getFilesystemName(name);
%>
	<p>
		전송된파일명:<%=orgfilename %>, 저장된파일명:<%=savefilename %>
	</p>
<%
	}
%>

</body>
</html>












