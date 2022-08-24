<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	try{
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		out.println(num1+" + "+num2+" = "+(num1+num2));
	}catch(NumberFormatException e) { 
%>	
<script type="text/javascript">
	alert("그게 숫자냐 ? 바보는 아니시죠 !!");
	history.back(); // history.go(-1);
</script>
<%	}  %>
</body>
</html>