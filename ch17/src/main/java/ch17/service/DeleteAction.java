package ch17.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch17.dao.MemberDao;
public class DeleteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(id);
		if (result > 0) {
			// 탈퇴한 사람은 사용할 수 없도록 로그인 안되것 처럼 사용하기 위해서 seesion삭제
			session.invalidate();
		}
		
		request.setAttribute("result", result);
		return "delete";
	}
}