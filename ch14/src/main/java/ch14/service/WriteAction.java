package ch14.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch14.dao.Board;
import ch14.dao.BoardDao;

public class WriteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		int num = Integer.parseInt(request.getParameter("num"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String password = request.getParameter("password");
		
		board.setNum(num);
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRe_level(re_level);
		board.setSubject(subject);
		board.setWriter(writer);
		board.setContent(content);
		board.setPassword(password);
		BoardDao bd = BoardDao.getInstance();
		int result = bd.insert(board);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "write";
	}
}