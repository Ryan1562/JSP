package ch09;
import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;
public class MemberDao {
	// 싱글톤, Singleton, 디자인 패턴, 하나의 객체로 DB처리(입력, 수정, 삭제, 조회)
	// static 정적, 공유, 객체를 생성하지 않고 바로 사용, 클래스 변수, MemberDao클래스
	// instance = new MemberDao(); 클래스가 loading될 때 한번만 생성
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}  // 외부에서는 객체를 생성하지 마라
	// 외부에서 객체를 생성하려면 MemberDao.getInstance(); 사용하여 instance 같이 사용
	public static MemberDao getInstance() {
		return instance;
	}
	// Database Connection Pool  입력/수정/삭제/조회할 때 이 메서드를 사용하여 DB연결 
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결에러 : " + e.getMessage());
		}
		return conn;
	}
	public int insert(Member member) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member1 values(?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close(); 
			} catch (Exception e) {		}
		}
		return result;
	}
	public int loginChk(String id, String password) { // password 입력한 패스워드
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;	ResultSet rs = null;
		String sql = "select password from member1 where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("password");  // DB에 있는 패스워드
				if (dbPass.equals(password)) result = 1;   // id와 password가 일치
				else result = 0; // id는 있지만 암호는 다름
			} else result = -1;  // 없는 아이디
		}catch (Exception e) { 
			System.out.println(e.getMessage());
		}finally {
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close(); 
			} catch (Exception e) {		}
		}
		return result;
	}
	public String getName(String id) { // password 입력한 패스워드
		String name = "";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;	ResultSet rs = null;
		String sql = "select name from member1 where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString(1); // getString("name");
			} 
		}catch (Exception e) { 
			System.out.println(e.getMessage());
		}finally {
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close(); 
			} catch (Exception e) {		}
		}
		return name;
	}
}