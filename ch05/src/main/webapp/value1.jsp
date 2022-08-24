<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>애완 동물</h2>
${paramValues.pets[0] } ${paramValues.pets[1] } ${paramValues["pets"][2] }
${paramValues.pets[3] } ${paramValues.pets[4] } ${paramValues["pets"][5] }
<h2>애완동물</h2>
<%
	String[] pets = request.getParameterValues("pets");
	for (String pet:pets) {
		out.println(pet+" ");
	}
%>
</body>
</html>