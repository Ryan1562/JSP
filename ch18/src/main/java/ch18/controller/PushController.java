package ch18.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/push.action")
public class PushController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/event-stream");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int num = (int)(Math.random() * 45) + 1;   // 1 ~ 45사이의 램덤한 숫자 발생
		out.println("data:"+num+"\n\n");
		try{
			Thread.sleep(1000); // 1초, 하루에 한번 1000 * 60 * 60 * 24
		}catch (Exception e) {	}
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}