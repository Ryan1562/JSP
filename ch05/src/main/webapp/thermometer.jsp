<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch05.Thermometer"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	Thermometer th = new Thermometer();
	pageContext.setAttribute("th", th);
%>
<h2>온도</h2>
${th.setTh("서울", 28.9)}
서울 섭씨온도 : ${th.getTh("서울") }<p>
서울 화씨온도 : ${th.getFarenheit("서울") }
</body>
</html>