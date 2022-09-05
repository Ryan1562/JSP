package ch17.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch17.dao.MemberDao;
import ch17.model.Member;

public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDao md = MemberDao.getInstance();
		Member member  = md.select(id);
		if (member == null || member.getDel().equals("y"))
			result = -1; // 없는 아이디이거나 탈퇴한 아이디
		else {
			if (member.getPassword().equals(password)) {
				// jsp에서 session이 내장 객체지만 java에서는 객체를 생성하여 사용해야 한다
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				result = 1;  // 로그인 성공
			} // else 암호가 다름
		}
		request.setAttribute("result", result);
		return "login";
	}
}