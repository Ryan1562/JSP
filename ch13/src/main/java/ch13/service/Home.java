package ch13.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Home implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String[] images = {"ioi","jung","produce","twice"};
		int num = (int)(Math.random()* images.length);
		request.setAttribute("image", images[num]);
		return "home";
	}

}