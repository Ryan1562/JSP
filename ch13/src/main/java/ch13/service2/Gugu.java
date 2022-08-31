package ch13.service2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch13.service.CommandProcess;

public class Gugu implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = (int)(Math.random()*8) + 2; 
		request.setAttribute("num", num);
		return "kk/gugu";
	}
}