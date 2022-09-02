package ch16;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class DeptDao {
	private static DeptDao instance = new DeptDao();
	private DeptDao() {}
	public static DeptDao getInstance() {
		return instance;
	}
	private Connection getCoonection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {	System.out.println("연결 에러 : "+e.getMessage());		}
		return conn;
	}
	public List<Dept> list() {
		List<Dept> list = new ArrayList<>();
		Connection conn = getCoonection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from dept order by deptno";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Dept dept = new Dept();
				dept.setDeptno(rs.getInt(1));   // 1 -> "deptno"
				dept.setDname(rs.getString(2));
				dept.setLoc(rs.getString(3));
				
				list.add(dept);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {		}
		}
		return list;
	}
} 