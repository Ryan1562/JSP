package ch08;
import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;
public class TestCall {
	private int empno;
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String call() throws NamingException, SQLException {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection conn = ds.getConnection();
		String sql = "{?=call employ_ename(?)}";
		CallableStatement cs = conn.prepareCall(sql);
		cs.registerOutParameter(1, Types.VARCHAR);
		cs.setInt(2, empno);
		cs.execute();
		String ename = cs.getString(1);
		cs.close(); conn.close();
		return ename;
	}
}