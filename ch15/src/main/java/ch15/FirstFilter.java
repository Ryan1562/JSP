package ch15;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
@WebFilter("/FirstFilter")
public class FirstFilter extends HttpFilter implements Filter {
	public void destroy() {	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("필터 : 작업전");   // 화면 띄기 전에 작동
		chain.doFilter(request, response);  // 웹 화면 출력
		System.out.println("필터 : 작업후");   // 웹 화면 출력 후
	}
	public void init(FilterConfig fConfig) throws ServletException {	}
}