<%@page import="java.util.GregorianCalendar,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%! private PrintWriter pw;
	public void jspInit() {
		try {
			pw = new PrintWriter(new FileWriter("c:/jsp/jspLog.txt"));
		} catch(Exception e) { System.out.println(e.getMessage()); }
   }
   public void jspDestroy() {
	   if (pw != null) pw.close();
   }
%>
<%
	String name = request.getParameter("name");
	GregorianCalendar gc = new GregorianCalendar();
	String msg = "안녕하세요 "+name+"님";
	pw.printf("%TF %TT %s\r\n", gc, gc, msg);
%>
<%=msg %>
</body>
</html>