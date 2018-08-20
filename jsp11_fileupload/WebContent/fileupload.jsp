<%@page import="test.file.vo.FileinfoVo"%>
<%@page import="test.file.dao.FileinfoDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileupload.jsp</title>
</head>
<body>
<%
	String path=application.getRealPath("/upload");
/*
    public MultipartRequest(javax.servlet.http.HttpServletRequest request,
                        java.lang.String saveDirectory,
                        int maxPostSize,
                        java.lang.String encoding,
                        FileRenamePolicy policy)
*/
	MultipartRequest mr=new MultipartRequest(request,//request객체
			path,//파일업로드할 실제경로
			1024*1024*5,//최대업로드크기(byte단위-5MB설정)
			"utf-8",//인코딩
			new DefaultFileRenamePolicy());//동일한파일명이존재할때 파일명뒤에 1,2,..붙임
			// 예) foo.gif가 존재하면 foo1.gif로 파일명이 생성됨
	//파라미터를 읽어올때는 MultipartRequest객체를 사용
	String writer=mr.getParameter("writer");
	String title=mr.getParameter("title");
	String content=mr.getParameter("content");
	String orgfilename=mr.getOriginalFileName("file1");
	String savefilename=mr.getFilesystemName("file1");
	
	
	//---------------- DB 저장 -------------------//
	File f=mr.getFile("file1"); // file1에 대한 정보를 갖는 File객체  얻어오기
	long filesize=f.length();// 파일크기 구하기
	FileinfoDao dao=new FileinfoDao();
	FileinfoVo vo=
				new FileinfoVo(0,writer, title, content, orgfilename, savefilename, filesize);
				int n=dao.insert(vo);
				if(n>0){
					out.println("<h1>DB저장성공!</h1>");
				}else{
					out.println("<h1>DB저장실패!</h1>");
				}
%>
<h2>파일업로드 완료</h2>
<p>업로드위치:<%=path %></p>
<ul>
	<li>작성자:<%=writer %></li>
	<li>제목:<%=title %></li>
	<li>내용:<%=content %></li>
	<li>업로드한파일명:<%=orgfilename %></li>
	<li>실제저장된파일명:<%=savefilename %></li>
</ul>
<li><a href="main.jsp">메인으로</a></li>
</body>
</html>













	