<%@page import="test.file.vo.FileinfoVo"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="test.file.dao.FileinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update_file.jsp</title>
</head>
<body>
<%
	String path=application.getRealPath("/upload");
	FileinfoDao dao=new FileinfoDao();
	
	MultipartRequest mr=new MultipartRequest(
			request, // request 객체
			path, // 파일업로드할 실제경로
			1024*1024*5, // 최대업로드크기(byte단위-5MB설정)
			"utf-8", // 인코딩
			new DefaultFileRenamePolicy() // 동일한 파일명이 존재할때 파일명 뒤에 1,2,...붙임
			// 예) foo.gif가 존재하면 foo1.gif로 파일명이 생성됨 
			);
	
	
	// 파라미터를 읽어올때는 MultipartRequest객체를 사용
	String writer=mr.getParameter("writer");
	String title=mr.getParameter("title");
	String content=mr.getParameter("content");
	String orgfilename=mr.getOriginalFileName("file1"); // 전송된 파일명
	String savefilename=mr.getFilesystemName("file1"); // 실제 저장된 파일명
			
	int filenum = Integer.parseInt(mr.getParameter("filenum"));
	String name=dao.getinfo(filenum).getSavefilename();
	
	//FileinfoVo vo1 = dao.getinfo(filenum);
	//String name = vo1.getSavefilename();
	
	File file=new File(path+"\\"+name);
	
	System.out.println("우하하하하:   "  +  path+"\\"+name);
	
	file.delete();
	
	
	
	//---------------- DB 저장 ----------------//
	File f=mr.getFile("file1"); // file1에 대한 정보를 갖는 File객체 얻어오기
	long filesize=f.length(); // 파일크기 구하기
	
	FileinfoVo vo=new FileinfoVo(filenum,writer,title,content,orgfilename,savefilename,filesize);
	int n=dao.update(vo);
	if(n>0){
		out.println("<h1>DB수정성공</h1>");
	}else{
		out.println("<h1>수정실패</h1>");
	}
	
%>
<h2> 파일 업로드 완료</h2>
<p>업로드 위치</p>
<ul>
	<li>작성자 : <%=writer %></li>
	<li>제목 : <%=title %></li>
	<li>내용 : <%=content %></li>
	<li>업로드한 파일명 : <%=orgfilename%></li>
	<li>실제저장된파일명 : <%=savefilename %></li>
</ul>
<a href="main.jsp">메인으로</a>

</body>
</html>