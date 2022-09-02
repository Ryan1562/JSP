package ch15;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
public class ResponseWrapper extends HttpServletResponseWrapper {
	private HttpServletResponse response;
	// StringWriter 문자를 일부를 변경할 수 있음, 임시 보관 , String 전부 변경
	private StringWriter sw;
	private PrintWriter pw; 
	public ResponseWrapper(HttpServletResponse response) {
		super(response);
		this.response = response;
	}
	public void addCookie(Cookie cookie) {
		String value = cookie.getValue();
		String newVal = value+"-보바";
		cookie.setValue(newVal);
		response.addCookie(cookie);
	}
	public PrintWriter getWriter() throws IOException {
		if ( pw == null) {
			sw = new StringWriter();
			pw = new PrintWriter(sw);
		}
		return pw;
	}
	public void replace() throws IOException {
		String str = sw.toString();
		String newStr = str.replace("비행기","댕댕이");
		PrintWriter out = response.getWriter();
		out.println(newStr);
	}
}