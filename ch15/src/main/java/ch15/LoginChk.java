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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter("/sub4/*")
public class LoginChk extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;
	public void destroy() {	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req  = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		String id = (String)req.getSession().getAttribute("id");
		if (id == null || id.equals(""))  // login 안함
			res.sendRedirect("../loginForm.jsp");
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {	}
}
