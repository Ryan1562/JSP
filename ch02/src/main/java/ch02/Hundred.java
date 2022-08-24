package ch02;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Hundred")
public class Hundred extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		1 ~ 100까 합계. setContentType는 반드시 out생성보다 먼저 해야 한다
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int sum = 0;
		for (int i = 1; i <=  100; i++) {
			sum += i;
		}
		out.println("<html><body>");
		out.println("<h2>1부터 100까지 합</h2>");
		out.println(sum);
		out.println("</body></hyml>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}