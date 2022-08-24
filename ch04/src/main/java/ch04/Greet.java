package ch04;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Greet")
public class Greet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter pw;
	// doGet, doPost보다 먼저 실행
	public void init() throws ServletException {
		try {	pw = new PrintWriter(new FileWriter("c:/jsp/log.txt"));
		} catch (IOException e) { System.out.println(e.getMessage()); }
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String greet = "안녕하세요 "+name+"님";
		GregorianCalendar gc = new GregorianCalendar();
		pw.printf("%TF %TT - %s\r\n", gc, gc, greet);
		out.println("<html><body>");
		out.println(greet);
		out.println("</body></html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	// 서버가 종료할 때 실행하는 메서드
	public void destroy() {
		if (pw != null) pw.close();
	}
}