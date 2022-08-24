package ch04;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Fibonaccci")
public class Fibonaccci extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// service(doGet, doPost)메서드 보다  먼저 실행할 작업이 있는 경우에 사용하는 메서드
	private BigInteger arr[]; // BigInteger long으로 처리할 수 없는 아주 큰 정수 데이터 처리하는 클래스
	public void init() throws ServletException {
		arr = new BigInteger[100];
		arr[0] = new BigInteger("1");  arr[1] = new BigInteger("1");
		for (int i = 2; i < arr.length; i++) {
			arr[i] = arr[i-1].add(arr[i - 2]);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body><h2>피보나찌 수열</h2>");
		for (int i = 0; i < num; i++) {
			out.println(arr[i]+"<br>");
		}
		out.println("</body></html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}