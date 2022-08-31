package ch13.service2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch13.service.CommandProcess;

public class Message implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// jsp에 전달할 내용
		request.setAttribute("message", "오늘은 8월의 마지막 날");
		return "kk/message";
	}

}