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
		String orgfilename=vo.getOrgfilename(); // ����ڰ� ���ε������ϸ�
		String savefilename=vo.getSavefilename(); // ��������� ���ϸ�
		long filesize=vo.getFilesize();
		
		//--------------1. �ٿ�ε�â���� �����ϱ� --------------//
		// ���ϸ��� �ѱ��� ��� ������ �ʵ��� ���ڵ��ϱ�
		String filename=URLEncoder.encode(orgfilename, "utf-8");
		// �ѱ۸� ������ ������ +�� ��ȯ�ǰ� �� +��ȣ�� �ٽ� ���鹮�ڷ� ��ȯ�ϱ�
		filename=filename.replaceAll("\\+", "%20");
		// �ٿ�ε� â���� �����ϱ����� ������Ÿ������
		response.setContentType("application.octet-stream");
		// �ٿ�ε�� ����ũ�� ����
		response.setContentLengthLong(filesize);
		// �ٿ�ε�â�� ������ ���ϸ� ����
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		
		
		//--------------2. �ٿ�ε� �ϱ�(Ŭ���̾�Ʈ�� ���Ϻ����ϱ�) --------------//		
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
