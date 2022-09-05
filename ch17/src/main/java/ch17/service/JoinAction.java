package ch17.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch17.dao.MemberDao;
import ch17.model.Member;
public class JoinAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		Member member = new Member();   // member 화면에서 입력한 데이터를 받기위한 객체
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setAddress(address);
		member.setTel(tel);
		
		MemberDao md = MemberDao.getInstance();
		Member member2 = md.select(id);  // member2 DB에서 중복된지 확인하기 위한 객체
		if (member2 == null) result = md.insert(member);
		else result = -1; // 이미 있는 데이터
		request.setAttribute("result", result);
		return "join";
	}
}