package ch13.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch13.dao.PdsItem;
import ch13.service.PdsItemService;
@WebServlet("*.action") // 끝의 확장자가 action끝나면 이 컨트롤러로 받아서 처리
public class PdsItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 여러 개의 요청을 하나의 컨트롤러로 처리하기 위한 방법 
		// URL : http://localhost:8080/ch13/pds/fileupload.action
		String path = request.getContextPath();  // /ch13 : length 5자
//		System.out.println("path = " + path);
		String uri = request.getRequestURI();  //   /ch13/pds/fileupload.action
//		System.out.println("uri = " + uri);
		String command = uri.substring(path.length()+1);  // pds/fileupload.action
//		System.out.println("command = " + command);
		String pgm = "";
		PdsItemService pis = new PdsItemService();
		if (command.equals("pds/fileupload.action")) {
			int result = pis.insert(request);
			request.setAttribute("result", result);
			pgm = "upload_result.jsp";
		} else if (command.equals("pds/list.action")) {
			List<PdsItem> list= pis.list();
			request.setAttribute("list", list);  // jsp에 전달
			pgm = "list.jsp";
		} 
		RequestDispatcher rd = request.getRequestDispatcher(pgm);
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}