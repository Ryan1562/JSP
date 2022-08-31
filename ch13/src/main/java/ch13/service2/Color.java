package ch13.service2;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch13.service.CommandProcess;
public class Color implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String[] color = {"red","orange","yellow","green","blue","navy","violet"};
		int num = (int)(Math.random()*color.length);
		request.setAttribute("color", color[num]);
		return "kk/color";
	}
}