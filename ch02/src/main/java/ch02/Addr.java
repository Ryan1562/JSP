package ch02;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Addr")
public class Addr extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	html에서 get방식 요청한 경우에 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
//		java에서 응답하는 한글 세팅
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("당신은 이름이 "+name+"이고 사는 곳은 "+addr+"이군요");
		out.close();
	}
//	post방식으로 응답한 경우에 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		요청하는 곳에서 보낸 한글 세팅
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}