package ch17.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch17.dao.MemberDao;
import ch17.model.Member;
public class Confirm2 implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		String msg = "";
		if (member == null) msg = "사용 가능한 아이디 입니다";
		else msg = "사용중이니 다른 아이디를 쓰세요";
		
		request.setAttribute("msg", msg);
		return "confirm2";
	}
}