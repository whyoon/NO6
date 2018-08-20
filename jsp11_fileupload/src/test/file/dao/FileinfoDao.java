package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import test.file.vo.FileinfoVo;

public class FileinfoDao {
	public int insert(FileinfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DBConnection.getConn();
			String sql="insert into fileinfo "+" values(fileinfo_seq.nextval,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getOrgfilename());
			pstmt.setString(5, vo.getSavefilename());
			pstmt.setLong(6, vo.getFilesize());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return -1;
		}finally {
			DBConnection.closeConn(null, pstmt, con);
		}
	}
	
	public ArrayList<FileinfoVo> list(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getConn();
			String sql="select * from fileinfo";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<FileinfoVo> list=new ArrayList<>();
			
			while(rs.next()) {
				int filenum=rs.getInt("filenum");
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String orgfilename=rs.getString("orgfilename");
				String savefilename=rs.getString("savefilename");
				Long filesize=rs.getLong("filesize");
				FileinfoVo vo=new FileinfoVo(filenum, writer, title, content, orgfilename, savefilename, filesize);
				list.add(vo);
			}
			return list;
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}finally {
			DBConnection.closeConn(rs, pstmt, con);
		}
	}
	
	public int delete(int filenum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DBConnection.getConn();
			String sql="delete from fileinfo where filenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, filenum);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return -1;
		}finally {
			DBConnection.closeConn(null, pstmt, con);
		}
	}
	
	public FileinfoVo getinfo(int filenum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getConn();
			String sql="select * from fileinfo where filenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, filenum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String orgfilename=rs.getString("orgfilename");
				String savefilename=rs.getString("savefilename");
				long filesize=rs.getLong("filesize");
				
				
				FileinfoVo vo=new FileinfoVo(filenum, writer, title, content, orgfilename, savefilename, filesize);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DBConnection.closeConn(rs, pstmt, con);
		}
	}
	public int update(FileinfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DBConnection.getConn();
			String sql="update fileinfo set writer=?, title=?,content=?,orgfilename=?,savefilename=? where filenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getOrgfilename());
			pstmt.setString(5, vo.getSavefilename());
			pstmt.setInt(6, vo.getFilenum());
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return -1;
		}finally {
			DBConnection.closeConn(null, pstmt, con);
		}
	}
}
