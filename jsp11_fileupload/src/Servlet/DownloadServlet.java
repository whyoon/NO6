package Servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.file.dao.FileinfoDao;
import test.file.vo.FileinfoVo;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/download.do")
public class DownloadServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int filenum=Integer.parseInt(request.getParameter("filenum"));
		FileinfoDao dao=new FileinfoDao();
		FileinfoVo vo=dao.getinfo(filenum);
		String orgfilename=vo.getOrgfilename(); // 사용자가 업로드한파일명
		String savefilename=vo.getSavefilename(); // 실제저장된 파일명
		long filesize=vo.getFilesize();
		
		//--------------1. 다운로드창으로 응답하기 --------------//
		// 파일명이 한글인 경우 깨지지 않도록 인코딩하기
		String filename=URLEncoder.encode(orgfilename, "utf-8");
		// 한글명에 공백이 있으면 +로 변환되고 이 +기호를 다시 공백문자로 변환하기
		filename=filename.replaceAll("\\+", "%20");
		// 다운로드 창으로 응답하기위한 콘텐츠타입지정
		response.setContentType("application.octet-stream");
		// 다운로드될 파일크기 설정
		response.setContentLengthLong(filesize);
		// 다운로드창에 보여질 파일명 설정
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		
		
		//--------------2. 다운로드 하기(클라이언트에 파일복사하기) --------------//		
		String uploadPath=getServletContext().getRealPath("\\upload");
		FileInputStream fis=new FileInputStream(uploadPath + "\\" + savefilename);
		OutputStream os=response.getOutputStream();
		BufferedInputStream bis=new BufferedInputStream(fis);
		BufferedOutputStream bos=new BufferedOutputStream(os);
		byte[] b=new byte[1024];
		int n=0;
		while((n=bis.read(b))!=-1) {
			bos.write(b,0,n);
		}
		bos.close();
		bis.close();
	}
}
