package ch13.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class PdsItemDao {
	// singleton
	private static PdsItemDao instance = new PdsItemDao();
	private PdsItemDao() {	}
	public static PdsItemDao getInstance() {
		return instance;
	}
	// database connection pool
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결 에러 : "+e.getMessage());
		}
		return conn;
	}
	public int insert(PdsItem pi) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into pds_item values(pds_seq.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pi.getFileName());
			pstmt.setInt(2, pi.getFileSize());
			pstmt.setString(3, pi.getDescription());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {	System.out.println(e.getMessage());
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null)  conn.close();
			}catch (Exception e) {		}
		}
		return result;
	}
	public List<PdsItem> list() {
		List<PdsItem> list = new ArrayList<>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from pds_item order by id desc";
		try {
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PdsItem pi = new PdsItem();
				pi.setId(rs.getInt("id"));
				pi.setFileName(rs.getString("filename"));
				pi.setFileSize(rs.getInt("filesize"));
				pi.setDescription(rs.getString("description"));
	
				list.add(pi);
			}
		}catch (Exception e) {	System.out.println(e.getMessage());
		}finally {
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null)  conn.close();
			}catch (Exception e) {		}
		}
		return list;
	}
}