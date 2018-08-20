<%@page import="java.io.File"%>
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
		// 삭제할 파일명 얻어오기
		String path=application.getRealPath("\\upload");
		String savefilename=dao.getinfo(filenum).getSavefilename();
		File f=new File(path +"\\" + savefilename);
		// 파일삭제
		if(f.delete()){
			// DB에서 삭제
			dao.delete(filenum);
			out.println("<h2>삭제완료</h2>");
			response.sendRedirect("list.jsp");
		}else{
			out.println("<h2>삭제실패</h2>");
		}
	%>
</body>
</html>