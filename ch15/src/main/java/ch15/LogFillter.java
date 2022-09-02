package ch15;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
@WebFilter("/sub3/*")
public class LogFillter extends HttpFilter implements Filter {
	PrintWriter pw;
	public void init(FilterConfig fConfig) throws ServletException { // doFiler하기전에 먼저 실행
		try {
			pw = new PrintWriter(new FileWriter("C:\\jsp/logFiler.txt"));
		} catch (IOException e) { System.out.println(e.getMessage()); }
	}
	public void destroy() {  // WAS(tomcat) 종료
		if (pw != null) pw.close();
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		GregorianCalendar gc = new GregorianCalendar();
		String date = String.format("%TF %TT\r\n",gc, gc);
		pw.write(date+": sub3 작업 실행\r\n");
		chain.doFilter(request, response);
	}	
}