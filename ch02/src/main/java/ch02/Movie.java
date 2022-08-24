package ch02;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Movie")
public class Movie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] movie = request.getParameterValues("movie");
		response.setContentType("text/html;charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2>좋아하는 영화</h2>");
		if (movie == null) out.println("당신은 영화를 안 좋아하나 봐요");
		else {
			for (int i = 0; i < movie.length;i++) {
				if (i == movie.length - 1)
					out.println(movie[i]);
				else out.println(movie[i]+", ");
			}
		}
		out.println("</body></html>");
		out.close();

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}