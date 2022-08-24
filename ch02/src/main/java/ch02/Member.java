package ch02;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name= request.getParameter("name");
		String[] email = request.getParameterValues("email");
		String gender  = request.getParameter("gender");
		String job = request.getParameter("job");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body><h2>회원가입 정보</h2>");
		out.println("아이디 : " + id+"<p>");
		out.println("암호 : " + password+"<p>");
		out.println("이름 : " + name+"<p>");
		out.println("성별 : " + gender+"<p>");
		out.println("직업 : " + job+"<p>");
		out.println("이메일 : ");
		if (email == null) out.println("메일 안 받아 !<p>");
		else for(int i =0; i < email.length; i++) {
			if (i == email.length - 1) out.println(email[i]+"<p>");
			else out.println(email[i] +", ");
		}
		out.println("</body></html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}